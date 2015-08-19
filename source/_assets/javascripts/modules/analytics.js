// Piwik analytics tracking code

(function (doc) {
    'use strict';

    var host = 'https://analytics.paulrobertlloyd.com/';
    var ref = doc.getElementsByTagName('script')[0];
    var script = doc.createElement('script');
    var _paq = _paq || [];

    _paq.push(['setTrackerUrl', host + 'piwik.php']);
    _paq.push(['setSiteId', 1]);
    _paq.push(['trackPageView']);
    _paq.push(['enableLinkTracking']);

    script.src = host + 'piwik.js';
    script.async = true;
    script.defer = true;
    ref.parentNode.insertBefore(script, ref);

}(this.document));
