---
title: 'Beyond Style Guides'
date: '2015-12-16 19:30:00 +0000'
link: https://24ways.org/2015/beyond-the-style-guide/
tags:
  - Writing
  - 24 ways
---
[Drew][1] was kind enough to let me write for [24 ways][2] again this year, so I took this as an opportunity to write an article around a series of thoughts that had been languishing in my drafts folder for much too long.

These mostly centered around modular design, in particular the growing use of front-end style guides. I also wished to reference '<cite>[Design Machines][3]</cite>', Travis Gertz's fantastic article from earlier in the year. It seems frameworks like Bootstrap, Foundation and Google's Material Design, while desirable and beautiful, may be contributing to an homogenisation of design on the web. We can do better.

I also wished to write about the role I think CSS preprocessors can play, one that's more considered and focused. I believe they are perfect for expressing the attributes of a visual design language in code.

Such is the power of preprocessors like Sass, that without exercising restraint, we can get drawn into creating endless abstractions, with even the most fundamental aspects of CSS [drawn into the mixin][4]. Much like jQuery (and those frameworks I mentioned earlier), we can soon find ourselves dependant such tools, possibly long after their useful life span, and to the extent that simpler, more effective alternatives get ignored.

Thinking of Sass an an intermediary between CSS and a visual language is one way I try to keep my reliance on Sass in check: if you see a mixin or variable in my CSS, it should relate to an attribute in my design system.

* * *

So I end this year much like I did the last, with one final article on a topic of interest. Unlike last year, I'm tempted to spend less time writing long pieces like this, and instead focus more of my time on making things -- my list of [abandoned][5]/[neglected][6]/potential side projects can only grow so long.

*[CSS]: Cascading Style Sheets

[1]: http://allinthehead.com
[2]: https://24ways.org/2015/
[3]: https://louderthanten.com/articles/story/design-machines
[4]: https://css-tricks.com/snippets/sass/bem-mixins/
[5]: https://github.com/paulrobertlloyd/barebones
[6]: https://github.com/paulrobertlloyd/bradshawsguide
