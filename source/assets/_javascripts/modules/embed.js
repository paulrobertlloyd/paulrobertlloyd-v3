// Progressively enhance links to embedded content
// Inspired by the code used on http://2014.dconstruct.org/
(function (win, doc) {
    'use strict';

    var embed = doc.getElementsByClassName('embed')[0],
        src,
        type;

    if (embed) {
        if (win.innerWidth > 400) {
            src = embed.getAttribute('data-embed-src');
            type = embed.getAttribute('data-embed-type');
            embed.className += ' embed--' + type;
            embed.innerHTML = '<iframe class="embed__iframe" src="' + src + '" width="500" height="300" frameborder="0" allowfullscreen></iframe>';
            embed.removeAttribute('data-embed-src');
            embed.removeAttribute('data-embed-type');
        }
    }

}(this, this.document));
