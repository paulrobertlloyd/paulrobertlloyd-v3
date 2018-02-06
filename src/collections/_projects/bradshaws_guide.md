---
title: Bradshaw's Guide
date: '2018-01-02'
excerpt: Digital revival of a much loved Victorian railway guide
featured: true
screenshots:
  - projects/bradshaws_guide/desktop-a.png
  - projects/bradshaws_guide/tablet-portrait.png
  - projects/bradshaws_guide/phone.png
meta:
  year: Ongoing
  role: Design and front-end development
  website: '[bradshaws.guide](https://bradshaws.guide)'
---
Largely inspired by the popular BBC television series <cite>Great British Railway Journeys</cite>, [Bradshaw's Guide][1] is a modern revival of George Bradshaw's 1866 handbook for tourists exploring Britain's railways.

In his TV travelogue, Michael Portillo explores Britain's railway network and, guided by Bradshaw's guidebook, looks at how the destinations have changed between Victorian and modern times. While you can buy reproductions of Bradshaw's handbook, it's over an inch thick -- pocket-sized by Victorian standards, but not in today's world of mobile phones. By making Bradshaw's work more widely accessible, tourists might feel encouraged to spend more time on the railways and commuters may discover the hidden gems they pass every day.

## Typography

The original handbook used an eclectic range of typefaces, often to distinguish between different content types, sometimes for aesthetic purposes. I wanted to reflect this usage, but also take into account the constraits of the medium. I settled on four typefaces: Trocchi, a bold serif, for headings and display copy and Scotch Text, a delicate Scotch roman for body copy. League Gothic also makes an appearance. While not historically accurate, this reflects the block lettering used in the advertisements contained within the printed guide. Finally, the default system typeface is used for labels and UI elements.

{% include figure.html
  src="projects/bradshaws_guide/palette.svg"
  class="u-bleed"
%}

## Open source

Producing the guide involved correcting copy originating from an automated OCR process. Because the handbook exists in the public domain, I was keen to make its content available to as many people as possible, and allow others to build on the work I had done. The [source code for the site][2] is available on GitHub, meaning others can make improvements to the website or even create their own version of the guide.

## Integration with social networks

When I thought about ways people might discover the site, I realised that social media would be an opportunity to share highlights from the guide. [On Foursquare][3], checking into a station could display a short excerpt, while [@bradshawsguide][4] on Twitter could share short thoughts about a place, with a link to the longer description on the site.

[1]: https://bradshaws.guide
[2]: https://github.com/bradshawsguide
[3]: https://foursquare.com/bradshawsguide
[4]: https://twitter.com/bradshawsguide

*[BBC]: British Broadcasting Corporation
