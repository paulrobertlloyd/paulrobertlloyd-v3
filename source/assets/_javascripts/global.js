// = require polyfills/template
// = require vendor/RouterRouter/dist/routerrouter
// = require_tree ./modules

(function () {
    'use strict';

    var router = new RouterRouter();

    router.route(':year/:month/:slug', function () {
        new Webmentions({
            container: document.querySelector('#webmentions'),
            endpoint: 'https://webmention.paulrobertlloyd.com/api/webmentions',
            params: {
                'target': location.href.replace(location.hash, '')
            }
        });
    });
})();
