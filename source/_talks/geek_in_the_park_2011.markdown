---
title: The Web Native Designer
date: '2011-08-13 20:00:00 +0100'
excerpt: 'When print design can lay claim to a history stretching back to the middle ages, it''s no surprise that we''ve applied its methods to the web. As this comparatively new medium approches the same level of ubiquity of paper, it''s underlying technologies adapting to meet this need, but the design process needs to mature too.'
link: http://speakerdeck.com/u/paulrobertlloyd/p/the-web-native-designer-august-2011
embed:
  id: 4e47f175a6aa8f00010073ae
meta:
  event: 'Geek in the Park 2011'
  location: 'Leamington Spa, England'
  resources: '[Notes](/downloads/2011/08/the_web_native_designer.pdf)'
---
## Web Versus Native
Web versus native has become a common argument in development circles. Here, the word native is used to describe experiences built for mobile devices, designed to take advantage of the platforms they sit on. Yet the omission of native from the other side of this argument is puzzling -- surely applications and content on the web should feel part of that platform too?

Maybe we should rephrase this argument as 'Web Native versus Device Native'. Or maybe it's just a pointless argument. Instead of picking one over the other, we should understand the strengths and weaknesses of each before deciding which will satisfy the needs of a project. You may find a combination of approaches is most suitable.

In this presentation I'll look at the strengths of the web and how we should design for this platform.

## The Web: A Brief Reminder
In August the web celebrated it's 20th birthday, but having reached this milestone, have we forgetten the web's unique qualities?

Asked to name three technologies that form the core of the web, many would suggest HTML, CSS and Javascript. In terms of the true foundational pieces, then really we're talking about HTML, HTTP and URIs.

It's easy to get excited by new CSS techniques or the latest JavaScript frameworks, but these are merely additions we can apply to web pages for when they appear in certain environments.

### Universal and Linkable
Last year in [an article for Scientific American][1], Tim Berners-Lee wrote:

> The primary design principle underlying the Web's usefulness and growth is universality... it should be accessible from any kind of hardware that can connect to the Internet: stationary or mobile, small screen or large.

Similarly, Ben Ward restated the principles behind the web in his post [Understand the Web][2]:

> Want to know if your 'HTML application' is part of the web? Link me into it. Not just link me *to* it; link me *into* it. Not just to the black-box front page. Link me to a piece of content... That is the web: The beautiful interconnection of navigable content.

At it's simplest, the web is linked addressable content, accessible from any device. Your app may be built using web technologies, but if you can't provide URLs pointing to specific resources, if I can't link to or bookmark its content, then it's not part of the web.

After twenty years the web is a robust and well supported platform. Untouched by CSS or JavaScript well structured markup is accessible, responsive and cross platform by default. The very first website is no longer available, but an [archived version][3] is; you can access this in any browser and on any device. That a website built twenty years ago works better than many of those built today is a little embarrassing.

### Bad Examples
Many of today's services cited as great examples of the web are actually breaking it. Twitter uses JavaScript dependant URLs, whilst services like Facebook and Disqus are equally reliant on JavaScript. Holes are now appearing in the fabric of the web.

In June, Venkat Panchapakesan, Vice President of Engineering at Google wrote about their [plans to only support modern browsers across Google Apps][4]:

> As of August 1st, we will discontinue support for the following browsers and their predecessors: Firefox 3.5, Internet Explorer 7, and Safari 3. In these older browsers you may have trouble using certain features and eventually these **apps may stop working entirely**.

Many web developers celebrated this news, but shouldn't they have been disgusted at such a decision? After all, what is an email application but a list of messages and mailboxes; a compose screen made up of input fields, a textarea and submit button? I'm over simplifying, but if Google's products were built using Progressive Enhancement, then announcements like this wouldn't be needed and everybody -- regardless of their browser -- could access their services.

So let's look at the tools we're using everyday and think about how we can use them better. We'll start with the foundational layer: HTML.

## HTML
We tend to think of the web as a visual medium, but the web has no regard for visual presentation. Websites can be viewed in anything from a text browser like Lynx, or even in new services like Instapaper and Readability, which purposely strip away all visual design. Search engine crawlers don't see your design either.

If pages can appear without visual design or layout, where should we start? Content. It's the only constant we have, not having any device dependancies -- certainly if video, audio and images provide textual alternatives. Content the single thing that defines the markup and ultimately it's the thing we're delivering to users -- so it better be good!

Mark Boulton has written about [a content centric workflow][5] being the key to good design for the web:

> It's becoming increasingly unrealistic to impose a best-fit 'page' when the variables are so far-reaching and are only getting more so. In order to embrace designing native layouts for the web -- whatever the device -- we need to shed the notion that we create layouts from a canvas in. We need to flip it on its head, and create layouts from the content out.

When we take a content first approach, we can use content to guide our design decision. What's a good size to ensure this text remains readable? How long can this line go before it comes too difficult to read? What's the essential information needed here? What content isn't flexible -- ad units and infographics for example.

Asking questions like this can inform the basis of your design, but to do so you need to be using real content. Rather than designing buckets in which to pour in content, temporarily filled with Lorem Ipsum, I use real content whenever possible. If I don't have real content, I'll use something representative. Lorem Ipsum says to the client "we can come back to this later", but representative content can spark off a discussion about whether it's appropriate or what should be said in that space.

Design with real content and you're soon presented with the horrible realities; long usernames or columns of text that don't have matching heights just two examples.

## CSS
When available, we can improve the user experience by using presentation and layout to reflect a brand, improve readability or to create the right mood and expectations. Yet we must be mindful that in adding such presentation, we risk breaking the web's inherent adaptability. That's why developments like [Responsive Web Design][6] are so encouraging. These allow us to preserve the underlying fluidity whilst utilising layouts that can adapt to meet differing user needs.

Responsive Design is chiefly concerned with layout, and media queries can only query the display characteristics of a viewport. There are other aspects of how a user may experience a website that we need to account for too; input methods, bandwidth and even the environment a user may find herself. These qualities are harder to test for, and some may never be known.

Indeed, since we've started along the road of responsive design, we've quickly run into questions of context, and rightly so. For some this has lead to misplaced assumptions; mobile users are on the move using low bandwidth small screen devices, whilst desktop users are time rich and are connected to a broadband connection. Is this still true? Mat Marquis [tweeted][7] earlier this year:

> Mobile users want to see our menu, hours and delivery number, desktop users definitely want to see this one megabyte PNG of somebody smiling at a salad.

As mobile devices have become more capable, the line between mobile and desktop has blurred considerably. If anything, we've realised that our existing desktop experiences, gorging on large screen estate and presumed super-fast network connections are the ones requiring optimisation. As we make judgements about how pages should adapt, we should be careful not to remove content or functionality based on these false assumptions -- not without careful user research.

Responsive web design is not a silver bullet, and we need further means of being able to adapt the experience to fit different needs. But it is a step in the right direction.

### Experiment and share your findings
It's easy to think that Responsive Design is a new technique, that can be bolted-on to our existing design process, but it represents a fundamental shift away from current practices. There's still lots to learn, mistakes to make, knowledge to be shared -- so share it!

Like many people I've been experimenting with responsive design on my personal blog. Perhaps the most interesting thing I learnt from the experience was the need to test my design on as many devices as possible; resizing your browser just doesn't cut it. Field test your design when out and about, in different environments. You may be surprised what issues you find.

## JavaScript
Finally we have our behavioural layer. This is often the part that is breaking the web most, as developers build products from this layer inwards.

It's easy to quote high percentage numbers for users with JavaScript enabled, but this is a fools game. Remember those applications that disregard your visual design? They are likely to strip it of any behaviour too. What happens when your website is viewed over a low bandwidth with poor connectivity? What if JavaScript fails to load? What if an error makes a script unresponsive?
 
Rather than think of fallbacks, we should think of enhancements. Maps are a perfect example. Nearly every map provider allows embedding of static maps. Include these in your page first, and only in the presence of working JavaScript replace with an interactive version.

## Weren't you meant to be talking about design?
So far I've talked about content, HTML, media-quries, JavaScript? I thought this talk was about design? It is! All these factors require design thought; again remember that the web is not solely a visual medium. The design of your URL scheme is just as important as any page layout.

We need to stop thinking in terms of siloed roles, with designers over here, the developers over there. I would go as far to suggest that these two terms are interchangeable anyway; a graphic designer may develop a design language, a developer may design a database schema.

Instead we should be looking more at each others spread of skills and where they overlap. Mark Otto recently wrote about the ['T-shaped' designer][8]:

> As a T-shaped designer one should have experience across the multiple disciplines with a focus or preference for one or two. Being T-shaped means you can shift yourself and **provide value at just about any stage or type of project** -- like sketching, wire-framing, visual design, and code.

Having a broader skillset has always been beneficial on the web, but as we build more adaptable websites it'll become even harder to work in isolation. The design process needs to become more collaborative; both at the beginning of a project; understanding your user's and client's needs, right through to the end of an engagement. That means working in tandem with the development focused members of your team. Only through iteration, testing, trial and error -- involving both designers and developers -- can we create the products to which we aspire.

[1]: http://www.scientificamerican.com/article.cfm?id=long-live-the-web
[2]: http://benward.me/blog/understand-the-web/
[3]: http://www.w3.org/History/19921103-hypertext/hypertext/WWW/TheProject.html
[4]: http://gmailblog.blogspot.com/2011/06/our-plans-to-support-modern-browsers.html
[5]: http://www.markboulton.co.uk/journal/comments/a-richer-canvas
[6]: http://www.alistapart.com/articles/responsive-web-design/
[7]: https://twitter.com/wilto/status/63284673723375616
[8]: http://www.markdotto.com/2011/04/15/fatten-up-those-ts/

*[CSS]: Cascading Style Sheets
*[HTML]: HyperText Markup Language
*[HTTP]: HyperText Transfer Protocol
*[Mb]: Megabyte
*[PDF]: Portable Document Format
*[PNG]: Portable Network Graphic
*[URI]: Uniform Resouce Indicator
*[URL]: Uniform Resouce Locator
