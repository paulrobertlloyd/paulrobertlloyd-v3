// Load webfonts
// = require vendor/promis/promise
// = require vendor/fontfaceobserver/fontfaceobserver
(function (win, doc) {
    'use strict';

    if (doc.documentElement.className.indexOf('fonts-loaded') > -1) {
        return;
    }

    var tiemposRegular = new win.FontFaceObserver('Tiempos', {
        weight: 'normal',
        style: 'normal'
    });

    var tiemposItalic = new win.FontFaceObserver('Tiempos', {
        weight: 'normal',
        style: 'italic'
    });

    var calibreRegular = new win.FontFaceObserver('Calibre', {
        weight: 'normal',
        style: 'normal'
    });

    var calibreItalic = new win.FontFaceObserver('Calibre', {
        weight: 'normal',
        style: 'italic'
    });

    var calibreSemibold = new win.FontFaceObserver('Calibre', {
        weight: 700,
        style: 'normal'
    });

    win.Promise
        .all([tiemposRegular.check, tiemposItalic.check, calibreRegular.check, calibreItalic.check, calibreSemibold.check])
        .then(function () {
            doc.documentElement.className += ' fonts-loaded';
            win.enhance.cookie('fonts-loaded', !0, 7);
        });

}(this, this.document));
