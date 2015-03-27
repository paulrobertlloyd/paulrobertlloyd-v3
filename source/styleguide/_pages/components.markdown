---
layout: page
title: Components
series: Styleguide
excerpt: A guide to the mark-up styles used throughout this site.
permalink: /styleguide/components
meta:
  client: Dennis Publishing
  year: 2011
  role: Design
  notes: |
    * Named Digital Edition of the Year at the PPA Awards 2011
    * Average rating of four stars in the App Store
---
## Meta
{% include components/meta.html %}

## Rating
{% include components/rating.html score='1' %}
{% include components/rating.html score='2' %}
{% include components/rating.html score='3' %}
{% include components/rating.html score='4' %}
{% include components/rating.html score='5' %}

## Tag
{% include components/tag.html tag="tag name" %}

## Footnote
This is some text with a footnote.[^1]

[^1]: And this is the footnote.
