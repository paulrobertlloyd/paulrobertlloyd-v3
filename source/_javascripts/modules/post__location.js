//= require shim/scopedQuerySelector

(function (win, doc) {
    'use strict';

    var postMain = doc.querySelector('.post__main'),
        postLocation = doc.querySelector('.post__location');

    if (postMain && postLocation) {
        var postStart = postMain.querySelector(':scope > p');

        postStart.insertBefore(postLocation, postStart.firstChild);
    }
}(this, this.document));
