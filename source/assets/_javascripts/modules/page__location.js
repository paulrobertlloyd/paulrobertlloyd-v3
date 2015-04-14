// Move position of published location
// = require vendor/scopedQuerySelector/src/scopedQuerySelectorShim
(function (win, doc) {
    'use strict';

    var postMain = doc.querySelector('.c-page__main'),
        postLocation = doc.querySelector('.c-page__location');

    if (postMain && postLocation) {
        var postStart = postMain.querySelector(':scope > p');

        postStart.insertBefore(postLocation, postStart.firstChild);
    }

}(this, this.document));
