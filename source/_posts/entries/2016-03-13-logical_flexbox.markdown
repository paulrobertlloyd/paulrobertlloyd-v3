---
title: 'CSS Flexbox is Logical'
date: '2016-03-13 00:55:00 +0000'
location: Brighton, England
excerpt: 'Given a maturing specification, and related concerns regarding browser support and compatibility, I had largely been ignoring Flexbox. Yet with browser support for this module currently hovering around 96%, it''s now incumbent upon web developers like myself to learn how it works and start using it day-to-day.'
image:
  url: /2016/03/spock.jpg
  caption: 'Mr. Spock browsing the web on his tablet device. Photograph: [NBC Television](https://commons.wikimedia.org/wiki/File:Star_Trek_Spock.jpg)'
tags:
  - Web
---
Given a maturing specification, and related concerns regarding browser support and compatibility, I had largely been ignoring [CSS Flexible Box Layout][1]. Yet with browser support for this module -- aka Flexbox -- [currently hovering around 96%][2] (82% if using un-prefixed values) it's now incumbent upon web developers like myself to learn how it works and start using it day-to-day.

Like getting to grips with any new tool, only with continued exploration and experimentation am I starting to get an understanding of its various nuances and limitations. Yet, being finally able to discard the many counter-intuitive hacks I've gathered over the years, its hard not to create a layout using Flexbox without wearing a broad grin. Vertical centring? [Easy][3]. Equal height columns? [By default][4]. While Flexbox may not suitable for every situation, it solves a great number. And with [CSS Grids][5] just around the corner, web layout nirvana feels pretty damn close.

## Left is not right
Flexbox introduces a number of new terms, be they main and cross axes, or the various justification and alignment properties. [Mozilla has a good overview][6], but I've found [the guide on CSS Tricks][7] to be the most helpful. I suggest reading up on these terms if you're unfamiliar, before continuing with the rest of this article.

I want to draw your attention to two particular values used by Flexbox: `flex-start` and `flex-end`. At first these seemed fairly abstract, but that was until I needed to create a layout that could support both left-to-right and right-to-left languages. As it turns out, browsers do a lot of the heavy lifting here, be it via the [`dir`][8] attribute, or the [`<bdi>`][9] and [`<bdo>`][10] elements. However, this can easily be undermined with a few careless CSS rules: apply `text-align: left` to a passage of text, and it will appear left aligned, no matter what the document's text direction has been set to.

Having briefly immersed myself in the world of internationalisation, much like seeing a width defined in pixels, I can no longer see a physical positioning keyword like `left` or `right` without recognising that a series of assumptions are being made. Thankfully, because Flexbox uses the logical values `flex-start` and `flex-end`, any layout created with it will automatically align according to a document's text direction.

Well, almost.

## Illogical justification
Flexbox is most effective when creating micro layouts within parts of a page, positioning items in one dimension. Like for example, a page header:

{% figure caption:"Our header, with the site's name on the left, and navigation items on the right." class:"u-bleed" %}
{% picture showcase /2016/03/header-ltr.svg alt="" class="u-framed" %}
{% endfigure %}

We can markup this header using the following HTML:

```html
<body lang="en" dir="ltr">
    <header role="banner">
        <h1>
            <a rel="home" href="/en/">Starfleet</a>
        </h1>
        <nav role="navigation">
            <a href="/en/academy/">Academy</a>
            <a href="/en/command/">Command</a>
            <a href="/en/intelligence/">Intelligence</a>
            <a href="/en/security/">Security</a>
        </nav>
    </header>
</body>
```

and these CSS rules:

```css
* {
    font: menu;
    margin: 0;
}

a {
    padding: 1rem;
}

a[rel="home"] {
    background-color: blue;
    color: white;
}

header {
    background-color: gainsboro;
    display: flex;
}

h1,
nav {
    align-items: center;
    display: flex;
}

nav {
    margin-left: auto;
}

nav a {
    border-left: 1px solid white;
}
```

By giving the containing `<header>` the rule `display: flex`, its children will appear alongside each other in the same row (`flex-direction: row` is the default value for a flexbox). To move the navigation to the right, we can use [Flexbox's best kept secret][11]: by applying `margin-left: auto` to the `<nav>` element, its left-hand margin will take up any remaining space, thus pushing it all the way to the right.

*Whoa*{: title="That’s English for stop a horse!"}, ring the assumption alarm! By adding this value, we've made the assumption that the navigation will always appear on the right. Yet if we want to support right-to-left languages, switching the document's text direction will result in the following layout:

{% figure caption:"Our header as it appears when text direction is set right-to-left." class:"u-bleed" %}
{% picture showcase /2016/03/header-rtl-margin-left.svg alt="" class="u-framed" %}
{% endfigure %}

Because the left margin value hasn't changed, the navigation will still be pushed as far to the right as it can go. Clearly this is not what we want.

On the cross axis, we can align an individual item in a different direction to its siblings: if a container has `align-items: flex-start` (the default value), we can tell a child item to `align-self: flex-end`. With a corresponding property on the main axis (perhaps `justify-self`), we could avoid declaring a physical value. Unfortunately [such a rule doesn't exist][12], so we need to write the following instead:

```css
[dir="ltr"] nav {
    margin-left: auto; /* Move navigation to the right */
}

[dir="rtl"] nav {
    margin-right: auto; /* Move navigation to the left */
}
```

At first this seems like an oversight. To align items along the cross axis there are three properties: `align-content`, `align-items` and `align-self`. Yet to justify items along the main axis there is only one property: `justify-content`. Not having corresponding values threw me, and highlighted some misconceptions I had about the spec. So why can't we use a `justify-self` rule to align a single flexbox child along the main-axis? In answering this question on the www-style mailing list, [Tab Atkins responded][13]:

> Because there can be multiple children in that axis. The `*-self` properties only work if the child is all alone in that axis. When there are multiple boxes to be aligned, they can only be aligned en masse, with the `*-content` properties.

Thinking both axes were equal was to have the wrong understanding of how Flexbox works. This difference becomes clearer when you consider that items along the main axis can also wrap.

Returning to our header example, you'll notice another property containing a physical value: `border-left`. Again, we can make this work in both text-directions by writing following:

```css
nav a {
    border: 0 solid white;
}

[dir="ltr"] nav a {
    border-left-width: 1px;
}

[dir="rtl"] nav a {
    border-right-width: 1px;
}
```

With these adjustment in place, we get the desired result:

{% figure caption:"Our header now appears correctly when text direction is set right-to-left." class:"u-bleed" %}
{% picture showcase /2016/03/header-rtl.svg alt="" class="u-framed" %}
{% endfigure %}

## Logical values
Clearly, doing this for every property that features a physical value can make our CSS needlessly verbose. Enter the [CSS Logical Properties][14] module. Rather than use physical `left` or `right` values, this module allows us to use values similar to those we're using in Flexbox. Going back to my earlier example, instead of writing `text-align: left` we can write `text-align: start` -- a value that already [has good support across most browsers][15].

Applied to other properties, in the (hopefully not too distant) future, using logical properties means we could write the following to achieve the same result:

```css
nav {
    margin-inline-start: auto;
}

nav a {
    border-inline-start: 1px solid white;
}
```

[The full set of logical properties][17] is only supported by Firefox (41.0+) right now, with support in other browsers either patchy or non-existent (although [Autoprefixer][17] will add the relevant `-moz-` and `-webkit-` prefixes for the corresponding proprietary margin and padding properties).

Until then, I'll just cringe a little whenever I see the words `left` or `right` in a CSS file, and add physical positioning to my ever growing list of things we can't take for granted on the web.

[1]: https://www.w3.org/TR/css-flexbox-1/
[2]: http://caniuse.com/flexbox
[3]: https://philipwalton.github.io/solved-by-flexbox/demos/vertical-centering/
[4]: https://philipwalton.github.io/solved-by-flexbox/demos/holy-grail/
[5]: http://gridbyexample.com/
[6]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes
[7]: https://css-tricks.com/snippets/css/a-guide-to-flexbox/
[8]: https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir
[9]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdi
[10]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdo
[11]: https://medium.com/@samserif/bd3d892826b6
[12]: http://stackoverflow.com/questions/32551291/in-css-flexbox-why-are-there-no-justify-items-and-justify-self-properties
[13]: https://lists.w3.org/Archives/Public/www-style/2015Apr/0114.html
[14]: https://drafts.csswg.org/css-logical-props/
[15]: http://www.quirksmode.org/css/text/#t07
[16]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Logical_Properties
[17]: https://github.com/postcss/autoprefixer

*[aka]: also known as
*[CSS]: Cascading Style Sheets
