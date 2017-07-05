(function (win, doc, undefined) {
  'use strict';

  var enhance = {};
  var fullCSSKey = 'fullcss';
  var fullJSKey = 'fulljs';

  // Load a JS file asynchronously.
  // https://github.com/filamentgroup/loadJS/
  function loadJS(src) {
    var ref = doc.getElementsByTagName('script')[0];
    var script = doc.createElement('script');
    script.src = src;
    script.async = true;
    ref.parentNode.insertBefore(script, ref);
    return script;
  }
  enhance.loadJS = loadJS;

  // Load a CSS file asynchronously.
  // https://github.com/filamentgroup/loadCSS/
  function loadCSS(href, before, media) {
    var link = doc.createElement('link');
    var sheets = doc.styleSheets;
    var ref;
    if (before) {
      ref = before;
    } else {
      var refs = (doc.body || doc.getElementsByTagName('head')[0]).childNodes;
      ref = refs[refs.length - 1];
    }

    link.rel = 'stylesheet';
    link.href = href;
    link.media = 'only x';

    // Wait until body is defined before injecting link.
    // This ensures a non-blocking load in IE11.
    function ready(cb) {
      if (doc.body) {
        return cb();
      }
      setTimeout(function () {
        ready(cb);
      });
    }

    // Inject link
    ready(function () {
      ref.parentNode.insertBefore(link, (before ? ref : ref.nextSibling));
    });

    // A method (exposed on return object for external use)
    // that mimics onload by polling until document.styleSheets
    // until it includes the new sheet.
    var onloadcssdefined = function (cb) {
      var resolvedHref = link.href;
      var i = sheets.length;
      while (i--) {
        if (sheets[i].href === resolvedHref) {
          return cb();
        }
      }
      setTimeout(function () {
        onloadcssdefined(cb);
      });
    };

    function loadCB() {
      if (link.addEventListener) {
        link.removeEventListener('load', loadCB);
      }
      link.media = media || 'all';
    }

    // Once loaded, set link's media back to `all` so that stylesheet applies once loaded
    if (link.addEventListener) {
      link.addEventListener('load', loadCB);
    }

    link.onloadcssdefined = onloadcssdefined;
    onloadcssdefined(loadCB);
    return link;
  }
  enhance.loadCSS = loadCSS;

  // Get a meta tag by name
  function getMeta(metaname) {
    var metas = doc.getElementsByTagName('meta');
    var meta;
    for (var i = 0; i < metas.length; i = i + 1) {
      if (metas[i].name && metas[i].name === metaname) {
        meta = metas[i];
        break;
      }
    }
    return meta;
  }
  enhance.getMeta = getMeta;

  // Cookie function
  // https://github.com/filamentgroup/cookie/
  function cookie(name, value, days) {
    var expires;
    if (value === undefined) {
      var cookiestring = '; ' + doc.cookie;
      var cookies = cookiestring.split('; ' + name + '=');
      if (cookies.length === 2) {
        return cookies.pop().split(';').shift();
      }
      return null;
    } else {
      if (value === false) {
        days = -1;
      }
      if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        expires = '; expires=' + date.toGMTString();
      } else {
        expires = '';
      }
      doc.cookie = name + '=' + value + expires + '; path=/';
    }
  }
  enhance.cookie = cookie;

  // Load CSS styles asynchronously
  var fullCSS = getMeta(fullCSSKey);
  if (fullCSS && !cookie(fullCSSKey)) {
    loadCSS(fullCSS.content);
    cookie(fullCSSKey, 'true', 7);
  }

  // Cut the mustard…
  if (!(doc.querySelector && win.innerWidth)) {
    return;
  }

  // …and add class if user agent does.
  doc.documentElement.className += ' js-enhanced';

  // Load JavaScript asynchronously
  var fullJS = getMeta(fullJSKey);
  if (fullJS) {
    loadJS(fullJS.content);
  }

  win.enhance = enhance;
}(this, this.document));
