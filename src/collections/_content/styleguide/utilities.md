---
title: Utilities
series: styleguide
date: 2015-07-12T00:00:02Z
excerpt: Reusable classes with a single purpose and specific role.
---
## Content

### Visually hidden

The `.u-hidden`{: .language-css} utility class allows elements to be visually hidden, whilst ensuring they can still be accessed and real aloud by accessible software and other devices that place less emphasis on visual presentation.

## Layout

### Abreast

The `.u-abreast`{: .language-css} utility class uses [Quantity Queries](http://alistapart.com/article/quantity-queries-for-css) and flexbox to resize images based on the number of siblings they sit beside:

{% include figure.html
  src="styleguide/pattern_1.jpg,styleguide/pattern_2.jpg"
  preset="supporting"
  caption="Two images placed side-by-side, with supporting caption"
%}

{% include figure.html
  src="styleguide/pattern_1.jpg,styleguide/pattern_2.jpg,styleguide/pattern_3.jpg"
  preset="supporting"
  caption="Three images placed side-by-side, with supporting caption"
%}

{% include figure.html
  src="styleguide/pattern_1.jpg,styleguide/pattern_2.jpg,styleguide/pattern_3.jpg,styleguide/pattern_4.jpg"
  preset="supporting"
  caption="Four images placed side-by-side, with supporting caption"
%}

{% include figure.html
  src="styleguide/pattern_1.jpg,styleguide/pattern_2.jpg,styleguide/pattern_3.jpg,styleguide/pattern_4.jpg,styleguide/pattern_5.jpg"
  preset="supporting"
  caption="Five images placed side-by-side, with supporting caption"
%}

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
