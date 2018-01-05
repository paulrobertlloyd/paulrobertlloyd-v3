// Progressively enhance links to embedded content
//
// Requires an element with the following markup:
// <div data-embed-src="[embed iframe url]" data-embed-type="[embed type]">
//   <p><a class="button" href="[embed url]">[Fallback button text]</a></p>
// </div>

export default function () {
  var embeds = document.querySelectorAll('[data-embed-src]');

  for (var i = 0; i < embeds.length; i += 1) {
    var embed = embeds[i];
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
