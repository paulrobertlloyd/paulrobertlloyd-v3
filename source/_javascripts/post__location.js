(function (win, doc) {
    'use strict';

    var postLocation = doc.querySelector('.post__location'),
        postStart = doc.querySelector('.post__main p:first-child');

    if (postLocation) {
        console.log(postLocation);
        console.log(postStart);
        postStart.insertBefore(postLocation);
    }
}(this, this.document));