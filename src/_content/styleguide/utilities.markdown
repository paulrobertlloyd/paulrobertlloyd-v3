---
title: Utilities
series: Style guide
date: '2015-07-12 00:00:02 +0000'
excerpt: Reusable classes with a single purpose and specific role.
style: |
    .example--block {
        display: block;
        background-color: rgba(0, 0, 0, 0.2);
        height: 3.5rem;
        font-weight: normal;
    }
---
## Content

### Visually hidden
The `.u-audible`{: .language-css} utility class allows elements to be visually hidden, whilst ensuring they can still be accessed and real aloud by accessible software and other devices that place less emphasis on visual presentation.

### Small caps
The `.u-caps`{: .language-css} utility class is added automatically to a string of UPPERCASE letters.

### Ampersands
The `.u-amp`{: .language-css} utility class is added automatically when an ampsersand (&) appears in a run of text.

### Icons
The `.u-icon`{: .language-css} utility class is used to show an icon or glyph before a span of text, for example this <span class="u-icon" data-icon="&#9733;" aria-hidden="true">star</span>.

## Layout

### Abreast
The `.u-abreast`{: .language-css} utility class uses [Quantity Queries](http://alistapart.com/article/quantity-queries-for-css) and flexbox to resize images based on the number of siblings they sit beside:

{% figure caption:"Two images placed side-by-side, with supporting caption" class:"u-abreast" %}
{% picture supporting /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture supporting /styleguide/pattern_2.jpg alt="Image 2" %}
{% endfigure %}

{% figure caption:"Three images placed side-by-side, with supporting caption" class:"u-abreast" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% endfigure %}

{% figure caption:"Four images placed side-by-side, with supporting caption" class:"u-abreast" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% picture thumbnail /styleguide/pattern_4.jpg alt="Image 4" %}
{% endfigure %}

{% figure caption:"Five images placed side-by-side, with supporting caption" class:"u-abreast" %}
{% picture thumbnail /styleguide/pattern_1.jpg alt="Image 1" %}
{% picture thumbnail /styleguide/pattern_2.jpg alt="Image 2" %}
{% picture thumbnail /styleguide/pattern_3.jpg alt="Image 3" %}
{% picture thumbnail /styleguide/pattern_4.jpg alt="Image 4" %}
{% picture thumbnail /styleguide/pattern_5.jpg alt="Image 5" %}
{% endfigure %}

### Container
The `.u-container`{: .language-css} utility class is used for macro layout control, constraining major structural components like `.c-banner`{: .language-css} and `.c-contentinfo`{: .language-css}.

### Align right
**.u-align-right**{: .u-align-right.example--block } The `.u-align-right`{: .language-css} utility class is used to align an element to the right. Typically used within prose.

### Align left
**.u-align-left**{: .u-align-left.example--block } The `.u-align-left`{: .language-css} utility class is used to align an element to the left. Typically used within prose.

### Pull right
**.u-pull-right**{: .u-pull-right.example--block } The `.u-pull-right`{: .language-css} utility class pulls an element to the right. Typically used within prose.

### Pull left
**.u-pull-left**{: .u-pull-left.example--block } The `.u-pull-left`{: .language-css} utility class pulls an element to the left. Typically used within prose.

### Aside
**.u-aside**{: .u-aside.example--block } The `.u-aside`{: .language-css} utility class pull sidebar content to the left of the main content. Typically used for meta or page navigation components.

### Extend
**.u-extend**{: .u-extend.example--block }

On wider breakpoints, the `.u-extend`{: .language-css} utility class extends an element to the full width of the main container. Typically used within prose.

### Bleed
**.u-bleed**{: .u-bleed.example--block }

On narrow breakpoints, the `.u-bleed`{: .language-css} utility class ensures an element bleeds to edges of the viewport. Typically used within prose.
