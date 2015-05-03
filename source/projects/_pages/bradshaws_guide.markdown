---
layout: project
title: Bradshaw's Guide
date: '2013-04-16'
excerpt: Bringing George Bradshaw's Victorian railway guide to a new generation.
permalink: /projects/bradshaws_guide
theme: bradshaws-guide
hero: [desktop.png, tablet.png, phone.png]
meta:
  client: Personal project
  year: Ongoing
  role: Design and front-end development
---
Largely inspired by the popular BBC television series <cite>Great British Railway Journeys</cite>, _Bradshaw's Guide_ is a modern revival of George Bradshaw's 1866 handbook for tourists exploring Britain's railways.

In his TV travelogue, Michael Portillo explores Britain's railway network and, guided by Bradshaw's guidebook, looks at how the destinations have changed between Victorian and modern times. While you can buy reproductions of Bradshaw's handbook, it's over an inch thick -- pocket-sized by Victorian standards, but not in today's world of mobile phones. By making Bradshaw's work more widely accessible, tourists might feel encouraged to spend more time on the railways and commuters may discover the hidden gems they pass every day.

## Typography
{% figure "Typographic hierarchy derived from that used in book" %}
{% endfigure %}

Wanting to evoke the feel of the handbook's chaotic Victorian typography, I looked at how a range of typefaces were used to distinguish between different sections and place names. I distilled these down to two typefaces: Kameron for headings, a chunky slab serif that contrasted strongly with Linux Libertine, a delicate serif which I used for body copy.

## Responsive design
{% figure "Article shown on mobile and tablet" %}
{% endfigure %}

The design of the site adapts to the size of the display. Within smaller viewports the guide takes on the appearance of a mobile app; on tablet and desktop displays, a magazine-like layout is used.

## Open source
{% figure "Github pull request" %}
{% endfigure %}

Producing the guide involved correcting copy originating from an automated OCR process. Because the handbook exists in the public domain, I was keen to make its content available to as many people as possible, and allow others to build on the work I had done. The source code for the site is available on GitHub, meaning other developers can make improvements to the website or even create their own version of the guide.

## Integration with social networks
{% figure "A Foursquare tip from George Bradshaw" %}
{% endfigure %}

{% figure "A tweeted excerpt from George Bradshaw, with Twitter card integration" %}
{% endfigure %}

When I thought about ways people might discover the site, I realised that social media would be an opportunity to share highlights from the guide. On Foursquare, checking into a station could display a short excerpt, while [@bradshawsguide][1] on Twitter could share short thoughts about a place, with a link to the longer description on the site.

[1]: https://twitter.com/bradshawsguide

*[BBC]: British Broadcasting Corporation
