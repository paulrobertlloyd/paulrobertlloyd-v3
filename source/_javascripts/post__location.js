//= require shim/scopedQuerySelector

(function (win, doc) {
    'use strict';

    var postLocation = doc.querySelector('.post__location'),
        postMain = doc.querySelector('.post__main'),
        postStart = postMain.querySelector(':scope > p');

    if (postLocation) {
        postStart.insertBefore(postLocation, postStart.firstChild);
    }
}(this, this.document));
