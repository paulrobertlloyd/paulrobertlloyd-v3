(function (win, doc) {
    'use strict';

    var postMain = doc.querySelector('.page__main .prose'),
        postLocation = doc.querySelector('.page__location');

    if (postMain && postLocation) {
        var postStart = postMain.querySelector(':scope > p');

        postStart.insertBefore(postLocation, postStart.firstChild);
    }
}(this, this.document));
