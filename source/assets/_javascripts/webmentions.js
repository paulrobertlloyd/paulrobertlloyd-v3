// Display sumbitted webmentions
// = require vendor/RouterRouter/dist/routerrouter
// = require modules/dateformatter
// = require modules/template

// = require modules/webmentions
// = require modules/likes
// = require modules/reposts
// = require modules/responses

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
