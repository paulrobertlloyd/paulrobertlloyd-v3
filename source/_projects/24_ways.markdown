---
title: 24 ways
date: '2013-12-01'
excerpt: Award-winning redesign for popular advent calendar for web geeks.
featured: true
hero:
  - projects/24_ways/desktop-1.png
  - projects/24_ways/desktop-2.png
  - projects/24_ways/phone.png
meta:
  year: 2013
  role: Design and front-end development
  notes: 'Awarded best collaborative project at the net Awards 2014'
---
Each December, Drew McLellan and his small team publish _24 ways_, a daily dose of design and development goodness that delivers a little Christmas cheer to the web community.

The previous website was designed by Tim Van Damme in 2007. His innovative design pushed the limits of the medium, but six years later, and with an accumulated archive of hundreds of articles, it was fraying at the edges. Furthermore, the site failed to reflect the best practices its authors advocated, such as advanced web typography, colour contrast and CSS3 techniques. The layout was responsive (thanks to some retrospective hacking) but a fresh approach was needed to effectively deliver content to the broadening range of devices accessing the site.

{% figure "[Drew McLellan on rebuilding 24 ways](http://allinthehead.com/retro/366/rebuilding-24-ways)" %}
> I'm in the fortunate position of knowing lots of really great web designers – many of whom have been authors for 24 ways over the years. I figured I’d start with my top-choice dream person, and work down the list until I found someone who’d be prepared to do it.
>
> So I started by asking Paul Robert Lloyd, and he said yes.
{% endfigure %}

## Typography
{% figure "Type specimens for Merriweather and Lato" %}
{% endfigure %}

24 ways is not a commercial venture, and with little budget to spend on web fonts, I sought out open source typefaces. Lato, used for much of the interface as well as body copy, offered a contemporary take on the Swiss-inspired design readers were accustomed to. Headings and standfirsts were set in Merriweather, which gave the articles a more scholarly tone and a provided a degree of typographic contrast.

## Colour
{% figure "The colour palette adapts based on the year and day an article is published" %}
{% endfigure %}

Keen to exploit the very idea of 24 ways -- different articles, written by different authors, published over twenty-four days for almost nearly a decade -- I created a colour palette based on the publication's signature red, that would change over time based on these variables.

## Shape
{% figure "The diamond shape is evocative of stars and Christmas trees" %}
{% endfigure %}

Given the overuse of circles in popular web design, I was determined to use something a little more distinctive. The diamond shape not only subtly evoked the shape of a star, or even a stylised Christmas tree, but also helped create a visual tension on the page, framing author photos in an interesting and unique way.

## Responsive app-like interface
{% figure "Homepage with open menu (tablet)" %}
{% endfigure %}

{% figure "Article page (phone)" %}
{% endfigure %}

Where the previous design used a rigid template across all sections of the site, which often dominated the content, I created a series of templates each suited the task in hand. On article pages, the interface deliberately receded allowing readers to focus on the content. Index and collection pages took a different approach, showcasing twenty-four articles in a grid which evoked the feel of a calendar.

## Modern development practices
{% figure "Mark-up pattern using BEM-like naming convention" %}
{% endfigure %}

Beyond the responsive development, I was keen to employ other best practices. This included the use of BEM-like class names, modular components and conditional loading of non-essential page assets, such as comment threads. This improved the performance on the site, especially on mobile devices where bandwidth can be more constrained.

## What people said
{% figure c-figure--tweet "[@susanjrobertson](https://twitter.com/susanjrobertson/status/407673287729111040)" %}
> Really loving [@paulrobertlloyd](https://twitter.com/paulrobertlloyd)’s design for [@24ways](https://twitter.com/24ways). The more I read and poke around the more I discover that is awesome :)
{% endfigure %}

{% figure c-figure--tweet "[@davidlwarner](https://twitter.com/davidlwarner/status/407191676801662976)" %}
> Nice work on [@24ways](https://twitter.com/24ways)! Readable, usable, beautiful. Love the mobile nav menu.
{% endfigure %}

{% figure c-figure--tweet "[@laurakalbag](https://twitter.com/laurakalbag/status/407438919123611648)" %}
> The new [@24ways](https://twitter.com/24ways) design is lovely. Nice one [@paulrobertlloyd](https://twitter.com/paulrobertlloyd). (He likes his hamburgers with triple beef...)
{% endfigure %}

*[CSS3]: Cascading Style Sheets (Level 3)
*[BEM]: Block, Element, Modifier
