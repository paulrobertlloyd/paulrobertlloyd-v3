// Progressively enhance links to embedded content
// Inspired by the code used on http://2014.dconstruct.org/
//
// Requires an element with the following markup:
// <p data-embed-src="[embed iframe url]" data-embed-type="[embed type]">
//     <a class="button" href="[embed url]">[Fallback button text]</a>
// </p>
(function (win, doc) {
    'use strict';

    // Embed.rb generates a <p> element, so look for those first
    var p = doc.getElementsByTagName('p');
    for (var i = 0; i < p.length; i = i + 1) {

        // If a <p> has the right attributes…
        if (p[i].hasAttribute('data-embed-src')) {
            var embed = p[i];
            var src;
            var type;

            // …and if the viewport is wider than 32em, embed!
            if (win.matchMedia('(min-width: 32em)')) {
                src = embed.getAttribute('data-embed-src');
                type = embed.getAttribute('data-embed-type');
                embed.className += ' c-embed--' + type;
                embed.innerHTML = '<iframe class="c-embed__iframe" src="' + src + '" width="500" height="300" frameborder="0" allowfullscreen></iframe>';
                embed.removeAttribute('data-embed-src');
                embed.removeAttribute('data-embed-type');
            }
        }
    }

}(this, this.document));
