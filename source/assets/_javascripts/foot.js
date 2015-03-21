(function (win, doc) {
    'use strict';

    if (doc.documentElement.className.indexOf('fonts-loaded') > -1) {
        return;
    }

    var charterRegular = new win.FontFaceObserver('Charter ITC Std', {
        weight: 'normal',
        style: 'normal'
    });

    var charterItalic = new win.FontFaceObserver('Charter ITC Std', {
        weight: 'normal',
        style: 'italic'
    });

    win.Promise
        .all([charterRegular.check, charterItalic.check])
        .then(function () {
            doc.documentElement.className += ' fonts-loaded';
            win.enhance.cookie('fonts-loaded', !0, 7);
        });

}(this, this.document));
