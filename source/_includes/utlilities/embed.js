/*
    Inspired by the code used on http://2014.dconstruct.org/
*/

(function (win, doc) {
    'use strict';
    if (!doc.getElementsByClassName || !win.getComputedStyle || !win.innerWidth) {
        // doesn't cut the mustard.
        return;
    }
    var embed = doc.getElementsByClassName('embed')[0],
        src;
    if (embed) {
        if (win.innerWidth > 400) {
            src = embed.getAttribute('data-src');
            embed.className += " js-enhanced"
            embed.innerHTML = '<iframe src="' + src + '" width="500" height="300" frameborder="0" allowfullscreen></iframe>';
        }
    }
}(this, this.document));
