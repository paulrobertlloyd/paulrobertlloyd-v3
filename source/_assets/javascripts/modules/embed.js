// Progressively enhance links to embedded content
// Inspired by the code used on http://2014.dconstruct.org/
//
// Requires an element with the following markup:
// <div data-embed-src="[embed iframe url]" data-embed-type="[embed type]">
//   <p><a class="button" href="[embed url]">[Fallback button text]</a></p>
// </div>

(function (win, doc) {
  'use strict';

  var div = doc.getElementsByTagName('div'); // Embed.rb generates a <div> element, so look for those first

  for (var i = 0; i < div.length; i = i + 1) {

    // If a <div> has the right attributes…
    if (div[i].hasAttribute('data-embed-src')) {
      var embed = div[i];
      var type = embed.getAttribute('data-embed-type');
      var src = embed.getAttribute('data-embed-src');
      var title = embed.getAttribute('data-embed-title');

      embed.className += ' c-embed--' + type;
      embed.innerHTML = '<iframe class="c-embed__iframe" src="' + src + '" width="500" height="300" frameborder="0" title="' + title + '" allowfullscreen></iframe>';
      embed.removeAttribute('data-embed-src');
      embed.removeAttribute('data-embed-type');
      embed.removeAttribute('data-embed-title');
    }
  }

}(this, this.document));
