---
layout: presentation
title: The Web Native Designer
date: '2011-03-08 10:00:00 +0000'
location: London, England
event: APA Digital Breakfast
excerpt: Slides and referenced transcript from my talk at APA''s Digital Breakfast
images:
- talks/2011-03-08-apa_digital_breakfast/6.png
slides:
- format: png
  notes: |
    I had intended to reprise [a previous talk about styleguides](/talks/2010/11/multipack_presents), but as I reviewed my slides, I started to think more about today's theme: Web Design Trends.

    Always a popular topic, discussion often revolves around new technologies and the latest fashions. Watching the latest trends can be fun, but be careful not to focus too much on what everyone else is doing. While can be helpful to learn about HTML5 or the latest JavaScript libraries, you should be thinking about design in terms of a particular project or brief.

    So today I will focus on the underlying trends around how we work, how we communicate with clients and our colleagues, and how we're starting to respect the web as a medium in its own right.
- format: png
  notes: |
    For much of its short existence, the web has been treated as if it were the printed page, and you can see this is some of the terms we use. Words such as 'page', but also phrases like 'above the fold'. Such misappropriation isn't new. During the early development of television for example, it was often referred to as 'radio with pictures'.
- format: png
  notes: |
    In a recent article, [Paul Ford wrote](http://www.ftrain.com/wwic.html):

    > People in the newspaper industry saw the web as a newspaper. People in TV saw the web as TV, and people in book publishing saw it as a weird kind of potential book. But the web is not just some kind of magic all-absorbing meta-medium. It's its own thing.

    There is now a growing acceptance that the web works best when it's treated on it's own terms.

    I believe there are three particular aspects of the web that I think make it unique.
- format: png
  notes: |
    **It's dynamic.** Clients often commission redesigns once every two or three years, but this is to ignore a fantastic opportunity, as the web gives you unparalleled access to your users, meaning you can get a tremendous amount of feedback (either directly or indirectly) about how your site is performing and how well it meets their needs. Such dynamism has its downsides too; we have yet to think of any reliable method of preserving historically relevant content. The web almost exists with a complete ignorance of the past.
- format: png
  notes: |
    **It's adaptable.** The fluidity of the web is an important aspect for designers to recognise. Many have felt this all too acutely when trying to design websites that maintain pixel level precision across different browsers. The web works best when you embrace its fluidity. As we see a proliferation of devices with varying design constraints, we're now seeing this fluidity as a strength, not a weakness.
- format: png
  notes: |
    **It's systematic.** Fundamentally the web is a technology, borne of logic, rules and systems. There are key concepts such as URLs and hypertext that we need to understand and design for. The web is not only a visual medium either. Indeed it's quite possible that most content isn't consumed by humans at all; think of Google's spidering tools, or assistive software such as screen readers, none of which pay credence to visual design.
- format: png
  notes: |
    In [A Dao of Web Design](http://www.alistapart.com/articles/dao/), Jon Allsopp wrote:

    > It's time to throw out the rituals of the printed page, and to engage with the medium of the web and its own nature.

    You might think this is a recent article, but Jon wrote this in 2000 -- it's taken us almost a decade to recognise his foresight.
- format: png
  notes: |
    So while it may have taken us some time to get here, as the web has matured, so have us practitioners. We have built up a body of experience, and our methods are undergoing a period of reappraisal. We have studied and applied techniques that have existed in print and assessed how well they apply online. We've seen how users react and interact with websites, and starting to get a better understanding of the platform we design for.
- format: png
  notes: |
    **Content.** While in many cases content is still an afterthought, with existing copy dumped into a template, designers are starting to recognise its importance. First, we need to write copy specifically for the web. This doesn't mean less copy, but the right amount should be presented at appropriate parts of a user's journey. Large amounts of copy should be easy to skim, with headings, lists and breaks used to chunk-up content.
- format: png
  notes: |
    As much as long form copy is important, as the web is an interactive, communicative medium, so [microcopy](https://www.flickr.com/groups/microcopy/) plays an important role too. These little pieces of text can indicate a desired behaviour, or give a website its own personality and tone of voice.
- format: png
  notes: |
    We can also see content appear outside the context of the website, thanks to RSS readers and tools like [Readability](https://www.readability.com/) and [Instapaper](http://www.instapaper.com/) that remove surrounding distractions (and design) from a text.
- format: png
  notes: |
    **Layout.** Grids have long been a fundamental tenant of print design, but only recently have web designers started to learn about how they work and embrace them in their own work.
- format: png
  notes: |
    It's thanks to the web that this knowledge has been [so easily shared](http://www.thegridsystem.org/), benefiting developers as much as designers, who have created frameworks that make implementing grid-based designs easier.

    Yet these grids still assume a fixed width. This print-based assumption doesn't align well with the flexible and fluid nature of the web, leading web native designers to think about how grids and layouts can adapt to differing device constraints, be that width, font-size, resolution or a host of other variables.
- format: png
  notes: |
    New techniques like [Responsive Design](http://www.alistapart.com/articles/responsive-web-design/) are being advocated by designers like [Ethan Marcotte](http://ethanmarcotte.com/). His website provides a good example of how this approach works, with its layout and other aspects of its visual design changing depending on the constraints of a device.
- format: png
- format: png
- format: png
  notes: |
    The [Eden Spiekermann](http://edenspiekermann.com/) website is another example I'm fond of.
- format: png
- format: png
- format: png
  notes: |
    There are plenty more examples on the [mediaqueri.es](http://mediaqueri.es) website. Note that these layouts haven't been designed to fit a set of predefined widths. Rather, they have been designed to adapt to the space available. This content-out approach not only suggests a key change in how we approach design on the web, but again reinforces the importance of content.

    You can also see how a strong visual language, from which a palette of elements can be chosen from, is essential for designs that can appear in a number of different formats.
- format: png
  notes: |
    While we have only started to appreciate the inconsistent and adaptable nature of web layouts, we've learnt to appreciate this more with web typography. Here we face a limited font choice, with perhaps only six web safe fonts that can be used with any certainty (and [even then there can be issues with rendering consistency](http://blog.mhurrell.co.uk/post/2946358183/updating-the-helvetica-font-stack)).
- format: png
  notes: |
    This limitation has encouraged us to concentrate on the aspects of typography we can control; capitalisation, kerning and leading. The 2008 website for the [Seed Conference](http://seedconference.com/) is still probably the best example of this.
- format: png
  notes: |
    We also think in a web native way in terms of the units of measure we choose to use. Where print uses fixed point sizes, and screen design uses fixed pixels, the web works best when you use relative units like the `em` (relative to the base font size) or percentages (where a width is relative to its parent container).
- format: png
  notes: |
    Now, you might be getting an appreciation of not only the different challenges we face designing for the web, but the number of different specialisms that apply. And yet, practitioners are often dived into just two camps -- designers and developers -- between which unnecessary boundaries have been placed.

    This is a false division. Any boundaries should be removed.
- format: png
  notes: |
    As much as a visual language has to be developed, a database needs to be designed. In fact, I would go so far as to suggest these terms are interchangeable, each as necessary as the other. Development is the act of reproducing a design.

    Rather than be divided into two camps, instead the different specialisms should be encouraged to atain a broad understanding of all aspects of web design. For example, a developer can know as much about good microcopy as a designer has an understanding of databases.
- format: png
  notes: |
    When I was preparing this talk, I actually started to think perhaps there is a division, between those who care, and those who don't. Designers will often ask for more time to complete a project, whilst developers will want to ship a product as soon as it works. However, if left to designers in search of unattainable perfections, products would never ship. Developers might cite budgets and timelines, but this is often a result of processes that place all responsibility for delivery on their shoulders, often without them having little understanding of a project or involvement early on.
- format: png
  notes: |
    Some companies are now taking an agile development approach, where designers and developers ideally work side-by-side working on small iterations that be can be tested and improved upon -- although in my own experience I have yet to see this grand unified theory work in practice.
- format: png
  notes: |
    The fact is that no process is foolproof, and certainly when there is limited communication between everyone working on a product. The best projects occur when everybody is involved at every stage, each understanding the goals of the project and the problems that need to be solved.

    This is especially true when building websites, and certainly when designers use static visual mock-ups that convey no sense of the interactivity or flexibility required on the web. That's why communication between those designing and those implementing is crucial. As we wish to create more responsive websites, designers need to be involved in assessing how well a design adapts. Yet they can't reasonably design every variation without seeing it behave in the wild. A designer/developer partnership is essential.
- format: png
  notes: |
    This is why I think style guides can be an important addition to how we work on the web; especially on big projects with a large number of stakeholders. When it's important to ensure a universal understanding amongst many people working on a project, such guidelines can ensure consistency and promote a common working language.

    One example I've been following with interest is the BBC's [Global Experience Language](http://www.bbc.co.uk/gel/), a set of guidelines for anyone creating digital experiences for the BBC on the web. This project is founded upon ten design principles that summarise the common goals and priorities, which can be used to weigh up design choices that might arise later in any given project.
- format: png
  notes: |
    There is a common visual language, consisting of font usage, grids and layout variations and a predefined set of icons to choose from. An interesting aspect of this project is the cultural map; key parts of the website adhere to these guidelines closer than websites for programmes which need to reflect their own brand guidelines as well.
- format: png
  notes: |
    There is also a pattern library, which documents different interactions and behaviours of common elements to be used across the site. This library which can be added to as new components are found to be needed across a their different web properties.

    These all build towards a common foundation which can provide an element of predictability; developers can build with a set of known assumptions in mind and separate agencies or groups can build different websites yet have them work as part of a greater whole.
- format: png
  notes: |
    Whilst the GEL guidelines still advocate a fixed width, as I mentioned earlier, such a strong visual language is essential when creating websites that can appear in different contexts.

    It's only a matter of time before the BBC embraces responsive design, especially as creating bespoke websites for different devices will soon prove too costly.
- format: png
  notes: |
    In essence, GEL is an example of systems level thinking. Design principles define common goals whilst a visual language and design patterns provide building blocks from which new websites can be created. And once we start to think in terms of systems, so designers can become native to the web.
---
The APA represents publishers who produce magazines and editorial content for brand-based consumer magazines. This 'Digital Breakfast' event focused on the theme of Web Design Trends.

*[APA]: Association of Publishing Agencies
