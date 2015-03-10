(function (win, doc) {
    'use strict';

    if (doc.documentElement.className.indexOf('fonts-loaded') > -1) {
        return;
    }

    var serif400 = new win.FontFaceObserver('Charter ITC Std', {
        weight: 'normal',
        style: 'normal'
    });

    var serif400i = new win.FontFaceObserver('Charter ITC Std', {
        weight: 'normal',
        style: 'italic'
    });

    win.Promise
        .all([serif400.check(), serif400i.check()])
        .then(function () {
            doc.documentElement.className += ' fonts-loaded';
            win.enhance.cookie('fonts-loaded', !0, 7);
        });

}(this, this.document));
