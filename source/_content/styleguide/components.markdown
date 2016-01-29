---
title: Components
series: Style guide
date: '2015-07-12 00:00:03 +0000'
excerpt: Finite, discrete, implementation-specific parts of the interface.
meta:
  year: Ongoing
  role: Design and front-end development
  website: '[bradshawsguide.org](http://bradshawsguide.org)'
photos:
  - id: 1
    title: Quadriga atop the Brandenburg Gate
    date_created: '2015-02-23 18:09:21'
    model: Canon EOS 450D
    f_number: 5.0
    exposure_time: 1/50
    iso: 800
    focal_length: 41.0 mm
---
## Buttons
The `.c-button`{: .language-css} component class is used for buttons, which are typically used to submit form data.

<button class="c-button">Button</button> <input class="c-button" type="button" value="Input button"/> <input class="c-button" type="submit" value="Submit button"/>

## Charts
The `.c-chart`{: .language-css} component class is used for tabular content that has been visually formatted to appear in the form of a chart. Currently, only horizontal bar charts are supported (`.c-chart--hbar`{: .language-css}).

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
The `.c-embed--video`{: .language-css} modifier is used when embedding video content, typcially sourced from either Vimeo or YouTube.

{% include embed.html url="https://www.youtube.com/watch?v=4ViLiXA0E70" title="Example video" %}

### Photos
The `.c-embed--photo`{: .language-css} modifier is used when embedding photographic content, typically sourced from Flickr.

{% include embed.html url="https://www.flickr.com/photos/paulrobertlloyd/6913342093/" title="Example slideshow" %}

### Maps
The `.c-embed--map`{: .language-css} modifier is used when embedding photographic content, typically sourced from MapBox.

{% include embed.html url="https://a.tiles.mapbox.com/v4/paulrobertlloyd.map-tw61ntxz/attribution,zoompan.html?access_token=pk.eyJ1IjoicGF1bHJvYmVydGxsb3lkIiwiYSI6Ik54cHBhS0UifQ.bNN4HG8gg9JMj_Dr_hkdLg#5/40.5/-105.5" title="Example map" %}

### Slide decks
The `.c-embed--slidedeck`{: .language-css} modifier is used when embedding presentations, typically sourced from SpeakerDeck.

{% include embed.html url="https://speakerdeck.com/paulrobertlloyd/this-is-for-everyone-speak-the-web" id="314b1150d165013048455eac219e74d9" title="Example presentation" %}

## EXIF data
The `.c-exif`{: .language-css} component class is used to display the EXIF data found within an image file.

{% for photo in page.photos %}
{% include exif.html %}
{% endfor %}

## Screenshots
The `.c-screenshots`{: .language-css} component class is used to display a combintion of desktop, tablet and mobile phone screenshots.

{% assign screenshots = "projects/bradshaws_guide/desktop-a.png|projects/bradshaws_guide/tablet-portrait.png|projects/bradshaws_guide/phone.png" | split: "|" %}
{% include screenshots.html imageset=screenshots %}

## Meta information
The `.c-meta`{: .language-css} component is used to display short snippets of summary content.

{% include meta.html %}

## Ratings
The `.c-rating`{: .language-css} component is used to display a score between 0 and 5, perhaps as part of a review.

{% include rating.html score="3" %}

## Tags
The `.c-tag`{: .language-css} component is used to link related posts that cover similar topics.

{% include tag.html tag="travel" %}

## Forms
The `.c-form`{: .language-css} component class and child component classes, are used to display various forms used across the site.

### Contact
{% include form/contact.html %}

### Search
{% include form/search.html %}

### Webmention
{% include form/webmention.html %}
