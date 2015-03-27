---
layout: page
title: Figures
series: Styleguide
excerpt: A guide to the mark-up styles used throughout this site.
permalink: /styleguide/figures
---
The `figure` element can be used to annotate illustrations, diagrams, photos, code listings, etc. Styles are provided for a number of different content types.

## Preformatted text
{% figure "<cite>Jabberwocky</cite> (first verse). Lewis Carroll, 1832-98" %}
<pre>
'Twas brillig, and the slithy toves
Did gyre and gimble in the wabe;
All mimsy were the borogoves,
And the mome raths outgrabe.
</pre>
{% endfigure %}

## Code block
{% figure "Hello World, in Ruby" %}
~~~ ruby
puts "Hello World"
~~~ 
{% endfigure %}

## Quote
{% figure "Winston Churchill, in <cite>[a speech to the House of Commons](http://hansard.millbanksystems.com/commons/1947/nov/11/parliament-bill#column_206)</cite>. 11th November 1947" %}
> Many forms of Government have been tried, and will be tried in this world of sin and woe. No one pretends that democracy is perfect or all-wise. Indeed, it has been said that democracy is the worst form of government except all those other forms that have been tried from time to time.
{% endfigure %}

## Tweet
{% figure figure--tweet "[@paulrobertlloyd, 3 September 2013](http://twitter.com/paulrobertlloyd/statuses/374836201972584448)" %}
> How I design: tenacity, panic, happy accidents and fast-approaching deadlines.
{% endfigure %}

## Images

#### `.figure`
{% figure "Single image, with supporting caption" %}
{% picture /styleguide/pattern_1.jpg %}
{% endfigure %}

#### `.figure--image-duo`
{% figure figure--image-duo "Two images, with supporting caption" %}
{% picture supporting /styleguide/pattern_1.jpg %}
{% picture supporting /styleguide/pattern_2.jpg %}
{% endfigure %}

#### `.figure--image-trio`
{% figure figure--image-trio "Three images, with supporting caption" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% endfigure %}

#### `.figure--image-quartet`
{% figure figure--image-quartet "Four images, with supporting caption" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% picture thumbnail /styleguide/pattern_4.jpg %}
{% endfigure %}

#### `.figure--image-quintet`
{% figure figure--image-quintet "Five images, with supporting caption" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% picture thumbnail /styleguide/pattern_4.jpg %}
{% picture thumbnail /styleguide/pattern_5.jpg %}
{% endfigure %}

### With right-aligned caption

#### `.figure.figure--caption-right`
{% figure figure--caption-right "Single image, with supporting caption to the right" %}
{% picture /styleguide/pattern_1.jpg %}
{% endfigure %}

#### `.figure--image-duo.figure--caption-right`
{% figure figure--image-duo figure--caption-right "Two images, with supporting caption to the right" %}
{% picture supporting /styleguide/pattern_1.jpg %}
{% picture supporting /styleguide/pattern_2.jpg %}
{% endfigure %}

#### `.figure--image-trio.figure--caption-right`
{% figure figure--image-trio figure--caption-right "Three images, with supporting caption to the right" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% endfigure %}

#### `.figure--image-quartet.figure--caption-right`
{% figure figure--image-quartet figure--caption-right "Four images, with supporting caption to the right" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% picture thumbnail /styleguide/pattern_4.jpg %}
{% endfigure %}

#### `.figure--image-quintet.figure--caption-right`
{% figure figure--image-quintet figure--caption-right "Five images, with supporting caption to the right" %}
{% picture thumbnail /styleguide/pattern_1.jpg %}
{% picture thumbnail /styleguide/pattern_2.jpg %}
{% picture thumbnail /styleguide/pattern_3.jpg %}
{% picture thumbnail /styleguide/pattern_4.jpg %}
{% picture thumbnail /styleguide/pattern_5.jpg %}
{% endfigure %}
