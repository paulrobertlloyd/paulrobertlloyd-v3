(function (win, doc, undefined) {
    'use strict';

    var enhance = {};

    function loadJS(src) {
        var ref = doc.getElementsByTagName('script')[0];
        var script = doc.createElement('script');
        script.src = src;
        script.async = true;
        ref.parentNode.insertBefore(script, ref);
        return script;
    }
    enhance.loadJS = loadJS;

    function getMeta(metaname) {
        var metas = doc.getElementsByTagName('meta');
        var meta;
        for (var i = 0; i < metas.length; i = i + 1){
            if (metas[i].name && metas[i].name === metaname){
                meta = metas[ i ];
                break;
            }
        }
        return meta;
    }
    enhance.getMeta = getMeta;

    function cookie(name, value, days) {
        var expires;
        if (value === undefined) {
            var cookiestring = '; ' + doc.cookie;
            var cookies = cookiestring.split('; ' + name + '=');
            if (cookies.length === 2){
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

    if (!(doc.querySelector && win.innerWidth)) {
        return;
    }

    doc.documentElement.className += ' js-enhanced';

    var fullJS = getMeta('fulljs');
    if (fullJS){
        loadJS(fullJS.content);
    }

    win.enhance = enhance;

}(this, this.document));
