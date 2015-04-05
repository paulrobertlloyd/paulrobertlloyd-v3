---
layout: page
title: Components
series: Styleguide
permalink: /styleguide/components
meta:
  Simple: Simple texual content
  HTML: |
    Values can also include HTML
    * Such a list
    * Like this one
---
## Charts

### Horizontal

<table class="c-chart c-chart--hbar">
    <tbody>
        <tr>
            <th colspan="2">Javascript: Bytes downloaded (requests)</th>
        </tr>
        <tr>
            <td class="c-chart__label">Before</td>
            <td class="c-chart__value"><span class="c-chart__value--percent" style="width:100%;">35.00 kB (2)</span></td>
        </tr>
        <tr>
            <td class="c-chart__label">After</td>
            <td class="c-chart__value"><span class="c-chart__value--percent" style="width:3.66%;">1.28 kB (1)</span></td>
        </tr>
    </tbody>
</table>

## Embed

### Youtube
{% embed https://www.youtube.com/watch?v=4ViLiXA0E70 %}

### Flickr
{% embed https://www.flickr.com/photos/paulrobertlloyd/6913342093/ %}

### Mapbox
{% embed https://a.tiles.mapbox.com/v4/paulrobertlloyd.map-tw61ntxz/attribution,zoompan.html?access_token=pk.eyJ1IjoicGF1bHJvYmVydGxsb3lkIiwiYSI6Ik54cHBhS0UifQ.bNN4HG8gg9JMj_Dr_hkdLg#5/40.5/-105.5 %}

### Speaker Deck
{% embed https://speakerdeck.com/paulrobertlloyd/this-is-for-everyone-speak-the-web %}

## Figure

The `.c-figure` component can be used to annotate illustrations, diagrams, photos, code listings, etc. Styles are provided for a number of different content types.

### Preformatted text
{% figure "<cite>Jabberwocky</cite> (first verse). Lewis Carroll, 1832-98" %}
<pre>
'Twas brillig, and the slithy toves
Did gyre and gimble in the wabe;
All mimsy were the borogoves,
And the mome raths outgrabe.
</pre>
{% endfigure %}

### Code block
{% figure "Hello World, in Ruby" %}
~~~ ruby
puts "Hello World"
~~~ 
{% endfigure %}

### Quote
{% figure "Winston Churchill, in <cite>[a speech to the House of Commons](http://hansard.millbanksystems.com/commons/1947/nov/11/parliament-bill#column_206)</cite>. 11th November 1947" %}
> Many forms of Government have been tried, and will be tried in this world of sin and woe. No one pretends that democracy is perfect or all-wise. Indeed, it has been said that democracy is the worst form of government except all those other forms that have been tried from time to time.
{% endfigure %}

### Tweet
{% figure c-figure--tweet "[@paulrobertlloyd, 3 September 2013](http://twitter.com/paulrobertlloyd/statuses/374836201972584448)" %}
> How I design: tenacity, panic, happy accidents and fast-approaching deadlines.
{% endfigure %}

### Images

#### `.c-figure`
{% figure "Single image, with supporting caption" %}
{% picture /styleguide/pattern_1.jpg %}
{% endfigure %}

#### `.c-figure--image-duo`
{% figure c-figure--image-duo "Two images, with supporting caption" %}
{% picture supporting /styleguide/pattern_1.jpg %}
{% picture supporting /styleguide/pattern_2.jpg %}
{% endfigure %}

#### `.c-figure--image-trio`
{% figure c-figure--image-trio "Three images, with supporting caption" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% endfigure %}

#### `.c-figure--image-quartet`
{% figure c-figure--image-quartet "Four images, with supporting caption" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% picture thumbnail /styleguide/pattern_4.jpg %}
{% endfigure %}

#### `.c-figure--image-quintet`
{% figure c-figure--image-quintet "Five images, with supporting caption" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% picture thumbnail /styleguide/pattern_4.jpg %}
{% picture thumbnail /styleguide/pattern_5.jpg %}
{% endfigure %}

### With right-aligned caption

#### `.c-figure.c-figure--caption-right`
{% figure c-figure--caption-right "Single image, with supporting caption to the right" %}
{% picture /styleguide/pattern_1.jpg %}
{% endfigure %}

#### `.c-figure--image-duo.c-figure--caption-right`
{% figure c-figure--image-duo c-figure--caption-right "Two images, with supporting caption to the right" %}
{% picture supporting /styleguide/pattern_1.jpg %}
{% picture supporting /styleguide/pattern_2.jpg %}
{% endfigure %}

#### `.c-figure--image-trio.c-figure--caption-right`
{% figure c-figure--image-trio c-figure--caption-right "Three images, with supporting caption to the right" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% endfigure %}

#### `.c-figure--image-quartet.c-figure--caption-right`
{% figure c-figure--image-quartet c-figure--caption-right "Four images, with supporting caption to the right" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% picture thumbnail /styleguide/pattern_4.jpg %}
{% endfigure %}

#### `.c-figure--image-quintet.c-figure--caption-right`
{% figure c-figure--image-quintet c-figure--caption-right "Five images, with supporting caption to the right" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% picture thumbnail /styleguide/pattern_4.jpg %}
{% picture thumbnail /styleguide/pattern_5.jpg %}
{% endfigure %}

## Misc

#### `.c-meta`
{% include meta.html %}

#### `.c-rating`
{% include rating.html score='1' %}
{% include rating.html score='2' %}
{% include rating.html score='3' %}
{% include rating.html score='4' %}
{% include rating.html score='5' %}

#### `.c-tag`
{% include tag.html tag="tag name" %}
