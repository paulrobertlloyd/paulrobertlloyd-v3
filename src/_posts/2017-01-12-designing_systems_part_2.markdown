---
title: 'Designing Systems: Layers of Longevity'
series: designing_systems
date: '2017-01-12 12:00:00 +0000'
location: Bexhill-on-Sea, England
excerpt: 'In the second part of my three-part essay based on the talk I gave at Smashing Conference, I propose a model for thinking about design systems.'
image:
  url:
  caption:
tags:
  - Web
  - Design
  - Design Systems
---
_The second part of a three-part essay based on the talk I gave at [Smashing Conference][1]_.

As we become ever reliant on digital products, designers and developers are being asked to deliver coherent experiences that can support a multitude of platforms -- all without sacrificing development efficiency and maintainability.

Design systems answer this need -- but what is a 'design system'? When I've asked friends and colleagues this question, nobody has given the same answer. Maybe that's fine; we're all still trying to figure this stuff out, after all.

I tend to consider a design system in the broadest sense, that of an holistic collection of guidelines, tools and other artefacts, that can help an organisation deliver coherent products. I like to imagine a design system as constituting a series of layers, each concerned with a particular role and purpose, like so:

{% figure caption:"The layers of a design system" %}
<object height="100%" width="100%" data="/images/2017/01/design_system_onion.svg" type="image/svg+xml"></object>
{% endfigure %}

## Principles
Much like Frank Pick's [test for fitness of use][2], these layers radiate from a core set of design principles. User experience designer Kate Rutter once [described design principles][3] as:

> short, insightful phrases that act as guiding lights and support the development of great product experiences [that] enable you to be true to your users and true to your strategy over the long term.

Produced early during the development of a design system -- and absolved of any particular implementation or interface concerns -- design principles can help stakeholders coalesce around a set of ideals and assumptions. In later stages, they can help teams make decisions, and later still be used to test whether the final product meets these goals.

If you're redesigning an existing project, formulating a set of principles can also help you examine what works and what doesn't; if your organisation has a number of products, you can seek out any consistent themes that run through them. The important thing to consider when developing principles is that these should be unique to your organisation. Everyone wants their product to be easy to use; what makes yours different from the competition?

Once defined, while reviewed periodically, your principles should remain fairly static. Consider them the constitution for your design system.

## Guidance
<object class="u-aside" height="100%" width="100%" data="/images/2017/01/design_system_onion.svg#guidance" type="image/svg+xml"></object> With a set of guiding principles in place, only then can we look to create a guidelines and artefacts that document how different practitioners should embody these principles in their own work.

### Designers
*Brand identity guidelines* cover everything from logo usage (variants, spacing, placement) to fonts, colour palettes, textures, iconography, photography etc. and form the backbone of how we think about an organisation presents itself. A renewed interest in brand identity manuals of the past has meant we can now refer to those produced for the [New York City Transit Authority][4], [British Rail][5], [Nasa][6] and [more][7]. While brand consultants may no longer deliver tomes like these, the guidance they offer should be no less exhaustive.

### Writers
*Style guides* -- in the original sense of the term -- cover preferred usage of particular words and grammatical choices, and are useful for content-heavy publications like newspapers and government information. *Tone of voice* guidelines are less concerned about words, but more about the sentences, and how an organisation verbally communicates with its customers. This guidance is especially useful since having a distinctive voice can help your product stand out from the crowd.

### Developers
While a product's underlying code may not be seen by users, technical guidance such as *coding conventions* will ensure this remains consistent, predictable and maintainable. The correct answer to the question "tabs or spaces" isn't your own personal preference, but what the team has collectively chosen to use.

### Shared vocabularies
While the intended audiences may differ, these artefacts all help to establish a vocabulary that can be understood among everyone involved in the design, development and marketing of a product.

This vocabulary may be intimidating to those not familiar with it. When I started at the Guardian, people talked about *pixies* and *super-pixies*, *bentos* and *mini-bentos,* odd names which gave no hint to their meaning (it turns out these were containers used on the homepage). Using esoteric names like this can be fun and build camaraderie. But they inadvertently create a barrier to entry for anyone new to the system such as new employees or external contractors.

For this reason, at the start of a project, it's useful for everyone involved to agree on what things are called, be they internal project names or industry-wide terms and abbreviations. In her article <cite>[From Pages to Patterns](http://alistapart.com/article/from-pages-to-patterns-an-exercise-for-everyone)</cite>, Charlotte Jackson describes a workshop exercise which encourages a collaborative approach to naming interface components:

1. First, cut up an interface into its component parts, and group together those that are visually similar.
2. Have every member of the team come up with a name for each component, individually and in secret.
3. Once everyone has thought of a name, they are revealed to the group.

If multiple people have suggested the same name for a component, then that'll be a good candidate for its name. If not, the follow-up discussion will prove just as useful. Beyond working together to decide what things are called, make sure you record your decisions somewhere, too.

### Build through collaboration
The idea of working together to build a shared understanding brings to mind a recent article by Mark Boulton. He suggested that a successful design system should adopt Postel's Law:

> being liberal in accepting things into the system, and being liberal about how you go about that, ensures you don't police the system. You collaborate on it.

I'm sure Frank Pick would agree. After all, the most recognisable piece of design created during his tenure managing London Transport, the Underground map, was not instigated by him, but rather a young engineering draftsman working on the network called Harry Beck.

{% figure caption:"Harry Beck holds a copy of his diagram for the London Underground; he seems rightly chuffed with his little idea!" class:"u-bleed" %}
{% include image.html preset="showcase" path="2017/01/beck.jpg" %}
{% endfigure %}

Beck realised passengers cared little about the geography above ground, but cared more about the connections between the various lines. Beck did away with geographical accuracy and features (apart from the River Thames), and drew the various tube lines on vertical, horizontal and diagonal axes, marking intersections with a diamond shape.

_It's not the features that matter, but the connections_. I'll return to that thought in part three.

## Tools
<object class="u-aside" height="100%" width="100%" data="/images/2017/01/design_system_onion.svg#tools" type="image/svg+xml"></object> The penultimate layer in a complete design system concerns tooling. These tools go beyond low-level guidance (the 'what'), and enable people to implement these rules in a meaningful way (the 'how'). Two tools often mentioned in discussion about design systems are:

* **Visual design languages:** Similar to brand identity guidelines, these concentrate more on the application of brand identity, and provide guidance on composition, order and placement.

* **Component libraries:** These abstract front-end code into a series of modules, often alongside documentation and usage examples. Larger organisations may need to build bespoke software to manage their components, but a number of open source alternatives are just as powerful. One I've used a lot is Fractal, built by Mark Perkins at Clearleft. I urge you to check it out if you haven't already -- it's really nice!

But I want to talk about a different kind of tool we used at the Guardian, called the container model. First, some context. As part of the responsive redesign project, a central aim was to improve the discovery of different types content across the website. However, this needed to account for the sometimes conflicting needs between different stakeholders:

* *Readers* wanted predictable means of finding content.
* *Editors* wanted to promote certain stories.
* The *creative director* wanted a distinctive design infused with Guardian's renowned print design values.
* *Developers* wanted a system that wouldn't be overly complex or hard to maintain.

Somewhere in the middle, a solution needed to be found. Enter, the container model. This provided a systematic approach to page composition, where in **items** (each representing a single story) could be arranged within a number of different horizontal **slices** which themselves can be combined to create **containers**.

{% figure caption:"The container model" %}
{% endfigure %}

Each container would revolve around a particular theme, say people in the news, videos or a particular news story. Building containers by combining items and slices provided an incredible amount of flexibility, and reduced the amount of code needed to maintain it. As containers are self-contained, they could be shared across different pages and in varying positions. For example the 'most popular stories' container could be shown both on the homepage, and at the foot of each article.

This seems straight forward, but the model only solved part of the problem given the ultimate flexibility desired. The type of story might require differing presentation, while its newsworthiness could affect its size and position. Containers could be curated manually or dynamically, which may affect their internal hierarchy. The overall pacing of a page was also a concern, as was creating a solution that worked across a range of viewports.

To juggle so many moving pieces became a struggle, and practically everyone on the team had a go at solving this puzzle. In the end, we managed to find a solution; partly because the team suddenly faced a six-week deadline for shipping something!

Re-reading _101 Things I learned in Architecture School_, a fantastic little book by Mark Frederick, I spotted a lesson that I think relates to the work we do on the web. He talks about there being three levels of knowing:

* **Simplicity:** the world view of a child, fully engaged in his own experience, and happily unaware of what lies beneath the surface of immediate reality.

* **Complexity:** the world view of an adult, in which there is an awareness of the complexity, but an inability to discern the patterns and connections.

* **Informed simplicity:** an enlightened world view, in which a person has developed the ability to recognise and create patterns within complex mixtures.

![The three levels of knowing]()

This perfectly encapsulates an experience I've become all too familiar with when developing design systems; only by working with the different pieces long enough, and trying out different combinations, will you uncover the underlying system required to manage the degree of complexity.

### Managing change
This poster above, shown across the London Underground last year, shows how the roundel logo has evolved over the last century. Frank Pick departed London Transport in 1941, and over the years that followed, fashions changed and did priorities.

Pick's success in managing the design of London's transport was in part due to the support he received from the Underground's chairman, Lord Ashfield. He was willing to support Pick's various endeavours, knowing that they achieved results. But in the decades following the departure of both Pick and Lord Ashfield, and with greater private car ownership and declining passenger numbers and revenue, managers began to prioritise price over quality -- and it showed!

![A photo of the Underground taken in 1997 – very different from how it looks today.]()

Thankfully, the last 15 years have seen those factors reverse, and the network is again getting the attention it deserves. New lines are being built, such as the Elizabeth line, and existing stations are being upgraded and repaired.

The way Transport for London are managing this renewal is really interesting. One of the tools they've introduced is the Station Design Idiom, a set of 9 new design principles that underpin design across the Underground network.

These principles are referred to on every project, from small-scale repairs, to major refurbishments and new stations. Forming part of the idiom, a new map that gives contractors a station-by-station guide to the different architectural styles used throughout the network, ensuring they use the right paint colours and finishes.

![The station design idiom map]()

Rather than attempt to impose a single style across the network, Transport for London have decided to celebrate the past instead. By deliberately maintaining a diversity of styles, they've chosen to make them an integral part of a broader design system. This seems like a pragmatic, and reasonable approach to me.

## Products
<object class="u-aside" height="100%" width="100%" data="/images/2017/01/design_system_onion.svg#products" type="image/svg+xml"></object> the final layer in our design system, is the products that emanate from it. Jeff Crossman, a former product designer at GE wrote:

> A design system should not simply be a collection of user interface components along with some design theory. It should demonstrate how design patterns have been applied in real products and document how other teams have extended patterns for specific use cases.

Jeff touches on an important point here; the products of a design system will be the ultimate arbiters of its success. Beyond the immediate success (or failure) of these products, as they evolve to meet the changing needs of our customers, so the systems supporting them will need revision as well.

In architecture, there's this concept called shearing layers. Coined by architect Frank Duffy this describes the different timescales that effect a building. He stated that:

> Our basic argument is that there isn't any such thing as a building. A building properly conceived is several layers of longevity of built components.

At the surface, it is our products that are likely to change more frequently, maybe even daily. As our product strategies change to meet an evolving understanding of our users, so the tools that we built to support them will need to adapt. And while our principles should be remain fairly consistent, much like the United States constitution, they should remain open to periodic amendment and review.

So, to return to the original question, maybe there's no such thing as a design system, only layers of longevity surrounding a number of agreed conventions and tooling.

[1]: /talks/smashing_conference_freiburg_2016
[2]: /2017/01/designing_systems_part_1
[3]: http://web.archive.org/web/20100318024044/http://www.adaptivepath.com/ideas/essays/archives/001123.php
[4]: https://standardsmanual.com/products/nyctacompactedition
[5]: https://britishrailmanual.com
[6]: https://standardsmanual.com/products/nasa-graphics-standards-manual
[7]: https://www.uniteditions.com/products/manuals-1-design-identity-guidelines
