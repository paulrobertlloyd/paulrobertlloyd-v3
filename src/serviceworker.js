// https://gist.github.com/adactio/4d588bb8a65fa11a3ea3
//
// Licensed under a CC0 1.0 Universal (CC0 1.0) Public Domain Dedication
// http://creativecommons.org/publicdomain/zero/1.0/

(function () {
  'use strict';

  // Update 'version' if you need to refresh the caches
  var version = 'v::1::';
  // A cache for core files like CSS and JavaScript
  var staticCacheName = 'static';
  // A cache for pages to store for offline
  var pagesCacheName = 'pages';
  // A cache for images to store for offline
  var imagesCacheName = 'images';

  var updateStaticCache = function () {
    return caches.open(version + staticCacheName)
      .then(function (cache) {
        // With the cache opened, load a JSON file containing an array of files to be cached
        return fetch('cache.json').then(function (response) {
          // Once the contents are loaded, convert the raw text to a JavaScript object
          return response.json();
        }).then(function (files) {
          return cache.addAll(files);
        });
      });
  };

  var stashInCache = function (cacheName, request, response) {
    caches.open(cacheName)
      .then(function (cache) {
        cache.put(request, response);
      });
  };

  // Limit the number of items in a specified cache.
  var trimCache = function (cacheName, maxItems) {
    caches.open(cacheName)
      .then(function (cache) {
        cache.keys()
          .then(function (keys) {
            if (keys.length > maxItems) {
              cache.delete(keys[0])
                .then(trimCache(cacheName, maxItems));
            }
          });
      });
  };

  // Remove caches whose name is no longer valid
  var clearOldCaches = function () {
    return caches.keys()
      .then(function (keys) {
        return Promise.all(keys
          .filter(function (key) {
            return key.indexOf(version) !== 0;
          })
          .map(function (key) {
            return caches.delete(key);
          })
        );
      });
  };

  self.addEventListener('install', function (event) {
    event.waitUntil(updateStaticCache()
      .then(function () {
        return self.skipWaiting();
      })
    );
  });

  self.addEventListener('activate', function (event) {
    event.waitUntil(clearOldCaches()
      .then(function () {
        return self.clients.claim();
      })
    );
  });

  self.addEventListener('message', function (event) {
    if (event.data.command === 'trimCaches') {
      trimCache(pagesCacheName, 20);
      trimCache(imagesCacheName, 30);
    }
  });

  self.addEventListener('fetch', function (event) {
    var request = event.request;
    var url = new URL(request.url);

    // Only deal with requests to my own server
    if (url.origin !== location.origin) {
      return;
    }

    // For non-GET requests, try the network first, fall back to the offline page
    if (request.method !== 'GET') {
      event.respondWith(
        fetch(request)
        .catch(function () {
          return caches.match('/error/offline');
        })
      );
      return;
    }

    // For HTML requests, try the network first, fall back to the cache, finally the offline page
    if (request.headers.get('Accept').indexOf('text/html') !== -1) {
      // Fix for Chrome bug: https://code.google.com/p/chromium/issues/detail?id=573937
      if (request.mode !== 'navigate') {
        request = new Request(request.url, {
          method: 'GET',
          headers: request.headers,
          mode: request.mode,
          credentials: request.credentials,
          redirect: request.redirect
        });
      }

      event.respondWith(
        fetch(request)
          .then(function (response) {
            // NETWORK
            // Stash a copy of this page in the pages cache
            var copy = response.clone();
            var cacheName = version + pagesCacheName;
            stashInCache(cacheName, request, copy);
            return response;
          })
          .catch(function () {
            // CACHE or FALLBACK
            return caches.match(request)
              .then(function (response) {
                return response || caches.match('/error/offline');
              });
          })
        );
      return;
    }

    // For non-HTML requests, look in the cache first, fall back to the network
    event.respondWith(
      caches.match(request)
        .then(function (response) {
          // CACHE
          return response || fetch(request)
            .then(function (response) {
              // NETWORK
              // If request is for an image, stash a copy of this image in the images cache
              if (request.headers.get('Accept').indexOf('image') !== -1) {
                var copy = response.clone();
                stashInCache(imagesCacheName, request, copy);
              }
              return response;
            })
            .catch(function () {
              // OFFLINE
              // If request is for an image, show an offline placeholder
              if (request.headers.get('Accept').indexOf('image') !== -1) {
                return caches.match('/images/offline.svg');
              }
            });
        })
    );
  });

}());
