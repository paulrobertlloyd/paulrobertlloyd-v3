---
title: Components
series: Style guide
date: '2015-07-12 00:00:03 +0000'
excerpt: Finite, discrete, implementation-specific parts of our UI.
meta:
  Simple: Simple texual content
  HTML: |
    Values can also include HTML
    * Such a list
    * Like this one
---
## Buttons
Buttons are normally used to submit form data, although on occasion it may be desired to have a link appear like a button too. In both cases, the `.c-button`{: .language-css} component class is used. Example:

<button class="c-button">Button</button> <input class="c-button" type="button" value="Input button"/> <a class="c-button" href="#">Link button</a>

## Charts
The `.c-chart`{: .language-css} component class is used for tabular content that has been visually formatted to appear in the form of a chart. Currently, only horizontal bar charts are supported (`.c-chart--hbar`{: .language-css}). The following example shows a size comparision:

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

## Embeds
The `.c-embed`{: .language-css} component class is used for embedded content.

### Videos
The `.c-embed--video`{: .language-css} modifier is used when embedding video content, typcially sourced from either Vimeo or YouTube:

{% embed https://www.youtube.com/watch?v=4ViLiXA0E70 %}

### Photos
The `.c-embed--photo`{: .language-css} modifier is used when embedding photographic content, typically sourced from Flickr:

{% embed https://www.flickr.com/photos/paulrobertlloyd/6913342093/ %}

### Maps
The `.c-embed--map`{: .language-css} modifier is used when embedding photographic content, typically sourced from MapBox:

{% embed https://a.tiles.mapbox.com/v4/paulrobertlloyd.map-tw61ntxz/attribution,zoompan.html?access_token=pk.eyJ1IjoicGF1bHJvYmVydGxsb3lkIiwiYSI6Ik54cHBhS0UifQ.bNN4HG8gg9JMj_Dr_hkdLg#5/40.5/-105.5 %}

### Slide decks
The `.c-embed--slidedeck`{: .language-css} modifier is used when embedding presentations, typically sourced from SpeakerDeck:

{% embed https://speakerdeck.com/paulrobertlloyd/this-is-for-everyone-speak-the-web %}

## EXIF data
The `.c-exif`{: .language-css} component class is used to display the EXIF data found within an image file.

{% include exif.html url='/assets/images/photos/2015-03-02-olympiastadion/02.jpg' %}

## Figures
The `.c-figure`{: .language-css} component class is used to annotate illustrations, diagrams, photos, code listings or provide a citation for an excerpted piece of content. The following examples show a section of preformatted text, a quotation and a tweet (`.c-tweet`{: .language-css}):

{% figure "<cite>Jabberwocky</cite> (first verse). Lewis Carroll, 1832-98" %}
<pre>
'Twas brillig, and the slithy toves
Did gyre and gimble in the wabe;
All mimsy were the borogoves,
And the mome raths outgrabe.
</pre>
{% endfigure %}

{% figure "Winston Churchill, in <cite>[a speech to the House of Commons](http://hansard.millbanksystems.com/commons/1947/nov/11/parliament-bill#column_206)</cite>. 11th November 1947" %}
> Many forms of Government have been tried, and will be tried in this world of sin and woe. No one pretends that democracy is perfect or all-wise. Indeed, it has been said that democracy is the worst form of government except all those other forms that have been tried from time to time.
{% endfigure %}

{% figure "[@paulrobertlloyd, 3 September 2013](https://twitter.com/paulrobertlloyd/status/374836201972584448)" %}
> How I design: tenacity, panic, happy accidents and fast-approaching deadlines.
{: .c-tweet}
{% endfigure %}

### Images
Images are the most typical use for the `.c-figure`{: .language-css} component class:

{% figure "Single image, with supporting caption" %}
{% picture /styleguide/pattern_1.jpg alt="Image 1" %}
{% endfigure %}

{% figure "The `.c-figure--image-duo`{: .language-css} modifier is used to display two images side-by-side" %}
{% picture supporting /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture supporting /styleguide/pattern_2.jpg alt="Image 2" %}
{% endfigure %}

{% figure "The `.c-figure--image-trio`{: .language-css} modifier is used to display three images side-by-side" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% endfigure %}

{% figure "The `.c-figure--image-quartet`{: .language-css} modifier is used to display four images side-by-side" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% picture thumbnail /styleguide/pattern_4.jpg alt="Image 4" %}
{% endfigure %}

{% figure "The `.c-figure--image-quintet`{: .language-css} modifier is used to display five images side-by-side" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% picture thumbnail /styleguide/pattern_4.jpg alt="Image 4" %}
{% picture thumbnail /styleguide/pattern_5.jpg alt="Image 5" %}
{% endfigure %}

### Images with a right-aligned caption
The `.c-figure--caption-right`{: .language-css} modifier moves the caption to the right at the largest breakpoint:

{% figure c-figure--caption-right "Single image, with supporting caption to the right" %}
{% picture /styleguide/pattern_1.jpg alt="Image 1" %}
{% endfigure %}

{% figure c-figure--caption-right "The `.c-figure--image-duo`{: .language-css} modifier is used to display two images side-by-side" %}
{% picture supporting /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture supporting /styleguide/pattern_2.jpg alt="Image 2" %}
{% endfigure %}

{% figure c-figure--caption-right "The `.c-figure--image-trio`{: .language-css} modifier is used to display three images side-by-side" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% endfigure %}

{% figure c-figure--caption-right "The `.c-figure--image-quartet`{: .language-css} modifier is used to display four images side-by-side" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% picture thumbnail /styleguide/pattern_4.jpg alt="Image 4" %}
{% endfigure %}

{% figure c-figure--caption-right "The `.c-figure--image-quintet`{: .language-css} modifier is used to display five images side-by-side" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% picture thumbnail /styleguide/pattern_4.jpg alt="Image 4" %}
{% picture thumbnail /styleguide/pattern_5.jpg alt="Image 5" %}
{% endfigure %}

## Screenshots
The `.c-screenshots`{: .language-css} component class is used to display a combintion of desktop, tablet and mobile phone screenshots.

{% assign screenshots = "projects/bradshaws_guide/desktop.png|projects/bradshaws_guide/tablet.png|projects/bradshaws_guide/phone.png" | split: "|" %}
{% include screenshots.html imageset=screenshots %}

## Meta information
{% include meta.html %}

## Ratings
{% include rating.html score="1" %}
{% include rating.html score="2" %}
{% include rating.html score="3" %}
{% include rating.html score="4" %}
{% include rating.html score="5" %}

## Tags
{% include tag.html tag="tag name" %}

## Forms
_TBD_
