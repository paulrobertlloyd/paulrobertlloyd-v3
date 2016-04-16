// Load webfonts
// = require vendor/fontfaceobserver/fontfaceobserver

(function (win, doc) {
    'use strict';

    if (doc.documentElement.className.indexOf('fonts-loaded') > -1) {
        return;
    }

    var regular = new FontFaceObserver('Calibre', {
        weight: 'normal',
        style: 'normal'
    });

    var italic = new FontFaceObserver('Calibre', {
        weight: 'normal',
        style: 'italic'
    });

    var semibold = new FontFaceObserver('Calibre', {
        weight: 700,
        style: 'normal'
    });

    Promise.all([regular.load(), italic.load(), semibold.load()]).then(function () {
        doc.documentElement.className += ' fonts-loaded';
        win.enhance.cookie('fonts-loaded', !0, 7);
    });

}(this, this.document));
