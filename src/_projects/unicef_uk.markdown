---
title: UNICEF UK
date: '2013-07-01'
excerpt: Mobile-first redesign for leading children's charity
featured: true
screenshots:
  - projects/unicef_uk/phone.png
  - projects/unicef_uk/phablet.png
  - projects/unicef_uk/tablet-portrait.png
meta:
  year: 2013
  agency: Clearleft
  role: Design and front-end development
---
[UNICEF UK][1] raises funds to protect children and the defend their rights worldwide. With mobile devices accounting for 20% of site visits and growing, a limited mobile version of its website had been produced, yet much of the information about their vital work remained on a desktop-orientated site.

Given a constrained budget, the software that managed content on the desktop was to be retained, meaning the mobile site would have to replicate the same pages and information architecture. [Working alongside Ben Sauer at Clearleft][2], my primary task was to ensure this content and architecture could be understood by users on smaller screens. The site also needed to degrade gracefully on older mobile devices, and take into account the often imperfect nature of cellular connectivity. Put simply, we needed to employ mobile-first design principles with desktop-first content, rationalising and simplifying where possible.

## Searching for Patterns
We asked key stakeholders on the project to dissect the homepage and a key internal page, placing component parts in order of importance. Working with UNICEF's content editor, we pulled out common patterns, noting those which were essential and those that were superfluous. The relevant patterns were then sketched on a whiteboard where we imagined how they would adapt on smaller screens. These were then used as the basis for the front-end build. This pattern-based approach allowed us to simplify what was already there, rather than start again from scratch.

{% figure caption:"Prioritising homepage components, highlighting common patterns on desktop site and breaking them down into responsive patterns we could use on the mobile site" class:"u-extend u-abreast" %}
{% include image.html preset="supporting" path="projects/unicef_uk/homepage_prioritisation.jpg" alt="Homepage prioritisation" class="u-framed" %}
{% include image.html preset="supporting" path="projects/unicef_uk/pattern_identification.jpg" alt="Pattern identification" class="u-framed" %}
{% include image.html preset="supporting" path="projects/unicef_uk/pattern_definition.jpg" alt="Pattern definition" class="u-framed" %}
{% endfigure %}

## Translating UNICEF's Brand Guidelines to the Web
We placed considerable attention on ensuring the performance of the site didn't suffer at the cost of excessive design. UNICEF's brand guidelines helped in this respect, with the identifiable logo, cyan brand colour and emotive photography combining to create a strong identity.

{% figure class:"u-bleed" %}
![Palette and fonts](/images/projects/unicef_uk/palette.svg)
{% endfigure %}

The brand guidelines suggested using Verdana for digital applications, but I opted to use the Roboto typeface instead. Close in appearance to UNICEF's brand font Univers, Roboto was specifically designed for Android, so we knew it would render well on mobile screens. Its condensed nature also allowed for more comfortable line lengths on narrower screens.

## Navigation
{% figure caption:"Navigation appears in a slide-out menu" class:"u-pull-right" %}
<object height="100%" width="100%" data="/images/projects/unicef_uk/mobile_menu.svg" type="image/svg+xml"></object>
{% endfigure %}

We experimented with different ways of simplifying wayfinding around the site. By removing layers of navigation and advocating the inclusion of more links within body copy, we were able to reduce unnecessary interactions and invoke fewer taps. Moving the breadcrumb navigation to a slide-out menu meant users could orientate themselves within the site.

## Mobile-First Design
The underlying design language encompassed a variety of content types and clearly delineated between areas of navigation and content. Although a mobile-focused project, we had a secondary ambition to design an experience that was better than the desktop site -- even on larger screens. In time, it is hoped this responsive mobile design will form the foundation of a fully responsive site, accessible from all devices, large or small.

[1]: http://unicef.org.uk
[2]: http://clearleft.com/made/unicef

*[HTML]: HyperText Markup Language
*[UK]: United Kingdom
*[UNICEF]: The United Nations Children's Fund
