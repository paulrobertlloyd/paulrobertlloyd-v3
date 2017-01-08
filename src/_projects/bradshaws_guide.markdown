---
title: Bradshaw's Guide
date: '2013-04-16'
excerpt: Digital revival for much loved Victorian railway guide
featured: true
screenshots:
  - projects/bradshaws_guide/desktop-a.png
  - projects/bradshaws_guide/tablet-portrait.png
  - projects/bradshaws_guide/phone.png
meta:
  year: Ongoing
  role: Design and front-end development
  website: '[bradshawsguide.org](http://bradshawsguide.org)'
---
Largely inspired by the popular BBC television series <cite>Great British Railway Journeys</cite>, [Bradshaw's Guide][1] is a modern revival of George Bradshaw's 1866 handbook for tourists exploring Britain's railways.

In his TV travelogue, Michael Portillo explores Britain's railway network and, guided by Bradshaw's guidebook, looks at how the destinations have changed between Victorian and modern times. While you can buy reproductions of Bradshaw's handbook, it's over an inch thick -- pocket-sized by Victorian standards, but not in today's world of mobile phones. By making Bradshaw's work more widely accessible, tourists might feel encouraged to spend more time on the railways and commuters may discover the hidden gems they pass every day.

## Typography
Wanting to evoke the feel of the handbook's chaotic Victorian typography, I looked at how a range of typefaces were used to distinguish between different sections and place names. I distilled these down to two typefaces: Kameron for headings, a chunky slab serif that contrasted strongly with Linux Libertine, a delicate serif which I used for body copy.

{% figure class:"u-bleed" %}
{% include image.html path="projects/bradshaws_guide/palette.svg" alt="Palette and fonts" %}
{% endfigure %}

## Open Source
{% figure caption:"Github pull request" %}
{% endfigure %}

Producing the guide involved correcting copy originating from an automated OCR process. Because the handbook exists in the public domain, I was keen to make its content available to as many people as possible, and allow others to build on the work I had done. The [source code for the site][2] is available on GitHub, meaning others can make improvements to the website or even create their own version of the guide.

## Integration With Social Networks
{% figure caption:"A Foursquare tip from George Bradshaw" %}
{% endfigure %}

When I thought about ways people might discover the site, I realised that social media would be an opportunity to share highlights from the guide. [On Foursquare][3], checking into a station could display a short excerpt, while [@bradshawsguide][4] on Twitter could share short thoughts about a place, with a link to the longer description on the site.

[1]: http://bradshawsguide.org
[2]: https://github.com/paulrobertlloyd/bradshawsguide
[3]: https://foursquare.com/bradshawsguide
[4]: https://twitter.com/bradshawsguide

*[BBC]: British Broadcasting Corporation
