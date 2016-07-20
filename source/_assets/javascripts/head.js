(function (win, doc, undefined) {
  'use strict';

  var enhance = {};
  var fullCSSKey = 'fullcss';
  var fullJSKey = 'fulljs';

  // loadJS: Load a JS file asynchronously.
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

  // loadCSS: Load a CSS file asynchronously.
  // https://github.com/filamentgroup/loadCSS/
  function loadCSS(href, before, media) {
    var link = doc.createElement('link');
    var ref = before || doc.getElementsByTagName('script')[0];
    var sheets = window.document.styleSheets;
    link.rel = 'stylesheet';
    link.href = href;
    link.media = 'only x';

    ref.parentNode.insertBefore(link, ref);

    link.onloadcssdefined = function (callback) {
      var defined;
      for (var i = 0; i < sheets.length; i = i + 1) {
        if (sheets[ i ].href && sheets[i].href.indexOf(href) > -1) {
          defined = true;
        }
      }
      if (defined) {
        callback();
      } else {
        setTimeout (function () {
          link.onloadcssdefined(callback);
        });
      }
    };
    link.onloadcssdefined(function () {
      link.media = media || 'all';
    });
    return link;
  }
  enhance.loadCSS = loadCSS;

  // getMeta function: get a meta tag by name
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

  // Cookie function
  // https://github.com/filamentgroup/cookie/
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
  if (fullJS){
    loadJS(fullJS.content);
  }

  win.enhance = enhance;

}(this, this.document));
