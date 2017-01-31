---
title: 'Designing Systems: Layers of Longevity'
series: designing_systems
date: '2017-01-31 12:00:00 +0000'
location: Bexhill-on-Sea, England
excerpt: 'In the second part of my three-part essay based on the talk I gave at Smashing Conference, I propose a model for thinking about design systems.'
tags:
  - Web
  - Design
  - Design Systems
---
_The second part of a three-part essay based on the talk I gave at [Smashing Conference][1]._

As we grow ever reliant on digital products, the designers behind them are being asked to create experiences that can work seamlessly across a multitude of platforms, and all without slowing delivery or impeding their maintainability. Design systems address this need.

_But what is a design system?_

![The layers of a design system. Radiating from a core set of principles, the next layer concerns guidance, the layer above that tools, with the final outer layer concerned with products.](/images/2017/01/design_system_onion.svg){: .u-pull-right} Definitions vary, and the term is used somewhat interchangeably, and often confused with related concepts like style guides. In attempting to define this emerging term, Nathan Curtis highlighted [the difference between the two][2]:

> A style guide is an artifact of design process. A design system is a living, funded product with a roadmap and backlog, serving an ecosystem.

I consider a design system in a similarly broad terms, namely that of an holistic collection of guidelines, tools and other artefacts that help an organisation deliver a coherent experience. Moreover, I imagine a complete system consisting of four layers, each concerned with a particular role and purpose, and I describe these below.

## Principles
Much like Frank Pick's [test for fitness of use][3], a set of high-level design principles form the core of a design system from which the subsequent layers radiate. Experience designer Kate Rutter [described design principles][4] as:

> short, insightful phrases that act as guiding lights and support the development of great product experiences [that] enable you to be true to your users and true to your strategy over the long term.

Produced early during the development of a design system -- and absolved of any particular implementation or interface concerns -- these principles can help stakeholders coalesce around a set of ideals and assumptions. In later stages, they can help teams make decisions, and later still be used to test whether the products of a system meet these goals.

It's never too late to think about design principles. In fact, if you have an existing series of products, you can use those to seek out consistent themes that run through them, and examine what works and what doesn't. The important thing to remember when developing principles is that they should be unique to your organisation; everyone wants their product to be easy to use -- what makes yours different?

Jared Spool has written in more detail about [creating meaningful principles][5] that can inform design decisions, and Jeremy Keith maintains [a collection of principles][6] if you are looking for inspiration.

## Guidance
<object class="u-aside" height="100%" width="100%" data="/images/2017/01/design_system_onion.svg#r2" type="image/svg+xml"></object> With a set of guiding principles in place, you can then look to the creation of guidelines. These artifacts document how different practitioners can embody these facets in their own work.

Designers often look to *brand identity guidelines*. These might cover everything from logo usage (variants, spacing, placement) to typography, colour, texture, iconography, photography etc., and essentially describe how an organisation presents itself visually. The renewed interest in mid-to-late 20th-century brand manuals means we can refer to guidelines produced for the [New York City Transit Authority][7], [British Rail][8], [Nasa][9] and [more][10]. While brand consultants no longer deliver heavy tomes like this, the guidance they offer should be no less exhaustive.

Writers on the other hand seek out *style guides* which, in the original sense of the term, cover nomenclature and grammatical choices. *Tone of voice* guidelines are concerned less about words, more about sentences and how an organisation verbally communicates. This guidance is especially useful since having a distinctive voice can help a product stand out from the crowd.

Developers may also establish *coding conventions* to ensure everyone on a team is writing consistent, predictable and maintainable code. The correct answer to the question "tabs or spaces" isn't your own personal preference, but what the team has collectively opted to use.

Designers, writers and developers all find collaboration easier once they've agreed upon a set of fundamental rules. Establishing shared vocabularies like these ensures everyone involved is using the same language.

### Developing a shared vocabulary
In her article <cite>[From Pages to Patterns][11]</cite>, Charlotte Jackson described a workshop exercise which encourages a collaborative approach to naming interface components:

1. First, cut up an interface into its component parts, and group together those that appear visually similar.
2. Have every member of the team come up with a name for each component, individually and in secret.
3. Once everyone has thought of a name, revealed these to the group.

If multiple people suggest the same name for a component, this will likely be a good name for it. If not, the follow-up discussion should prove just as useful.

Once you've decided what things are called, make sure you record these decisions down somewhere, too. When I joined the [Guardian][12], my colleagues would talked about *pixies* and *super-pixies*, *bentos* and *mini-bentos,* and other odd names which gave no hint to their meaning (it turns out these were container types used on the homepage). While arriving at esoteric names like this can be fun and build camaraderie within a team, they can inadvertently exclude members who joined after they were coined. It's for this reason that I recommend [deferring to obvious and descriptive terms][13] whenever possible.

### Building a system through collaboration
The idea of working together to build a shared understanding brings to mind Mark Boulton's suggestion that [design systems should adopt Postel's Law][14], such that:

> being liberal in accepting things into the system, and being liberal about how you go about that, ensures you don't police the system. You collaborate on it.

The most recognisable piece of design created during Frank Pick's leadership of London Transport, the Underground map, was not instigated by him or any other manager of the company, but was put forward by a young draftsman working on the network called Harry Beck.

{% figure caption:"Harry Beck holds a copy of his diagram for the London Underground; he seems rightly chuffed with his idea!" class:"u-bleed" %}
{% include image.html preset="showcase" path="2017/01/beck.jpg" %}
{% endfigure %}

Realising that passengers cared more about the connections between the various lines below ground than they did the layout above, Beck did away with any geographical accuracy, and instead drew the tube lines on vertical, horizontal and diagonal axes, marking each intersection with a diamond.

_It's not the features that matter, but the connections_. I'll return to that thought in part three.

## Tools
<object class="u-aside" height="100%" width="100%" data="/images/2017/01/design_system_onion.svg#r3" type="image/svg+xml"></object> The tools that go beyond low-level guidance (the 'what'), and enable people to implement these rules in a meaningful way (the 'how'), are the concern of the penultimate layer.

Two tools often mentioned in any discussion of design systems are _visual design languages_ -- the application of the brand identity guidelines with a focus on composition, order and placement -- and _component libraries_. Understandably, it is the later of these that has garnered the most attention within our industry as they deal with modularised front-end code (ideally alongside documentation and usage examples).

### Conceptual models
While these tools draw the most focus, perhaps it is conceptual models that are more useful. As way of example, let me describe one such model we used at the Guardian.

First, some context. As part of an extensive redesign project, one goal was to improve the discovery of different types content across the website. To achieve this however meant taking into account a number of conflicting needs. While readers wanted a predictable means of finding their favourite content, editors wanted to flag certain stories from across the different sections of the website. At the same time, while the design team wanted to create a distinctive layout infused with Guardian's renowned graphic design values, this at times this appeared to be in conflict with the engineering team's desire to build a product that wasn't overly complex or difficult to maintain.

Somewhere in the middle, a solution needed to be found.
Enter, [the container model][15], a systematic approach to page composition in which **items** (each representing a story) could be arranged into a number of different horizontal **slices**, which themselves could be combined to create **containers**.

{% figure %}
![The container model: items, slices and containers](/images/2017/01/container_model.svg)
{% endfigure %}

Building containers by combining items and slices provided an incredible amount of flexibility _and_ reduced the amount of code needed to support it. Each container could revolve around a particular theme, say people in the news, videos or a featured news story. That containers were self-contained meant they could be shared across different pages and in varying positions, too. For example the 'most popular stories' container could be shown midway on the homepage, and also at the foot of every article page.

This model went someway to addressing flexibility desired, yet further models were needed to deal with incredible variation often a component of effective editorial design. Tonality, newsworthiness, curation methods, information density, pacing and device considerations, all presented the design team with a near endless array of concerns to be addressed and reasoned with.

{% figure caption:"A section front on the Guardian website" class:"u-bleed" %}
{% include image.html preset="showcase" path="2017/01/guardian_front.png" class="u-framed" %}
{% endfigure %}

Working with so many moving pieces became a struggle, and everyone on the team had a go at solving this puzzle in different ways. In the end, a solution was found, although I suspect the imposition of a six-week deadline was the most effective tool for reaching a conclusion!

In <cite>[101 Things I learned in Architecture School][16]</cite>, Mark Frederick describes a learning process which he calls the 'three levels of knowing':

* **Simplicity**: the world view of a child, fully engaged in his own experience, and happily unaware of what lies beneath the surface of immediate reality.

* **Complexity**: the world view of an adult, in which there is an awareness of the complexity, but an inability to discern the patterns and connections.

* **Informed simplicity**: an enlightened world view, in which a person has developed the ability to recognise and create patterns within complex mixtures.

{% figure caption:"
* **Simplicity**: 3 elements used to  create 3 spaces;
* **Complexity**: 12 elements used to create 12 spaces;
* **Informed simplicity**: 3 elements combined to create 12 spaces." %}
![The three levels of knowing](/images/2017/01/three_levels_of_knowing.svg)
{% endfigure %}

This perfectly encapsulates the process we went though at the Guardian, and one I've experience many times since. Only by working with the different pieces long enough and playing with different combinations, can you devise the system (or _systems_) required to model the underhand complexity.

## Products
<object class="u-aside" height="100%" width="100%" data="/images/2017/01/design_system_onion.svg#r4" type="image/svg+xml"></object> As demonstrated in part one, a system has to survive contact with reality. Writing about the GE's design system, Predix [Jeff Crossman noted that][17]:

> A design system should not simply be a collection of user interface components along with some design theory. It should demonstrate how design patterns have been applied in real products and document how other teams have extended patterns for specific use cases.

Jeff make an important point; the products of a design system will be the ultimate arbiters of its success. Beyond the immediate success (or failure) of these products, as they evolve to meet the changing needs of our customers, so the systems supporting them will need revision also. The products that emanate from a design system are an essential constituent, existing at its surface and yet feeding back to the layers below.

### Accounting for change
Frank Pick departed London Transport in 1941, and over the years that followed, fashions changed and so did priorities. Pick's success in managing the design of London's transport was thanks to the support he received from the Underground's chairman, Lord Ashfield. Yet in the decades following the departure of both Pick and Lord Ashfield, and with growing private car ownership and declining passenger numbers and revenue, cost became prioritised over quality, and a period of neglect followed.

{% figure caption:"The Underground in 1997 -- very different from how it looks today. Photograph: [Kirk Bauer](http://pics.kaybee.org/Vacations/Europe1997/England/London/tube2.jpg)" class:"u-pull-right" %}
{% include image.html preset="supporting" path="2017/01/underground_1997.jpg" %}
{% endfigure %}

Thankfully, the last 15 years have seen these factors reverse, and the network is again getting the attention it deserves. New lines are being built, such as the Elizabeth line, and existing stations are being upgraded and repaired.

Transport for London are managing this renewal by following what they term the [Station Design Idiom][18], a set of 9 design principles to underpin design across the Underground network. These are referred to on every project, from small-scale repairs, to major refurbishments and new stations. As part of the idiom, a new map gives contractors a station-by-station guide to the different architectural styles used throughout the network, ensuring they use paint colours and finishes that match the original architectural style of each station, rather than impose a single style across the network.

By deliberately maintaining a diversity of styles, Transport for London have chosen to make the network's design history an integral part of their design system. This seems like a pragmatic, reasonable, and materially honest approach.

{% figure caption:"The Station Design Idiom map and flashcard" class:"u-bleed" %}
{% include image.html preset="showcase" path="2017/01/station_design_idiom.jpg" class="u-framed" %}
{% endfigure %}

In architecture, there's a concept called shearing layers. In <cite>[How Buildings Learn][19]</cite>, Stewart Brand expanded on Frank Duffy's idea that different timescales can be seen to effect a building, noting that:

> a building properly conceived is several layers of longevity of built components.

At the surface, it is our products that are likely to change more frequently, maybe even daily. And as product strategies change to meet an evolving understanding of our users, so the tools that we create to support them will need to adapt also.

To return to the original question -- what is a design system? -- perhaps the answer is this: layers of longevity surrounding a number of agreed conventions and tooling.

[1]: /talks/smashing_conference_freiburg_2016
[2]: https://medium.com/eightshapes-llc/74dcfffef935
[3]: /2017/01/designing_systems_part_1
[4]: http://web.archive.org/web/20100318024044/http://www.adaptivepath.com/ideas/essays/archives/001123.php
[5]: https://articles.uie.com/creating-design-principles/
[6]: https://principles.adactio.com/
[7]: https://standardsmanual.com/products/nyctacompactedition
[8]: https://britishrailmanual.com
[9]: https://standardsmanual.com/products/nasa-graphics-standards-manual
[10]: https://www.uniteditions.com/products/manuals-1-design-identity-guidelines
[11]: http://alistapart.com/article/from-pages-to-patterns-an-exercise-for-everyone
[12]: https://www.theguardian.com
[13]: https://24ways.org/2014/naming-things/
[14]: http://markboulton.co.uk/journal/design-systems-and-postels-law
[15]: http://next.theguardian.com/blog/container-model-blended-content/
[16]: http://www.101thingsilearned.com/Architecture/101TILArchitecture.html
[17]: https://medium.com/ge-design/8236d47b0891
[18]: http://content.tfl.gov.uk/station-design-idiom-2.pdf
[19]: https://en.wikipedia.org/wiki/How_Buildings_Learn
