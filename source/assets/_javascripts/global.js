// = require polyfills/template
// = require vendor/RouterRouter/dist/routerrouter
// = require_tree ./modules

(function () {
    'use strict';

    var router = new RouterRouter();

    router.route(':year/:month/:slug', function () {
        new Webmentions({
            container: document.querySelector('#responses'),
            endpoint: 'https://webmention.io/api/mentions',
            params: {
                'target': location.href.replace(location.hash, '')
            }
        });
    });
})();
