---
title: 'Peeking Behind the Curtain'
date: 2018-05-14T15:45:47+00:00
tags:
- microblog
---
On a recent project, I was asked to integrate [HubSpot](https://www.hubspot.com) into the redesigned site. Given the impending introduction of GDPR ([General Data Protection Regulation](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation)), I also needed to review the permissions required before this and other marketing and analytics scripts could set their cookies.

Turns out, I’ve been quite naive as to what some of these tools do. Logging into HubSpot to get the account credentials required for the script, I saw my name listed in the users who had signed up the newsletter. Moving into the detail view, I saw a rundown of all the various pages I had visited on the site and when. Tracking is typically anonymised to some extent (although how effective that is when combined with other datasets is [well documented](https://www.wired.com/2007/12/why-anonymous-data-sometimes-isnt/)), but I was completely unaware that signing up to the newsletter would give the site permission to track me to such an extent.

Beyond the illusion of being better informed about your customers, I fail to see how having this information is useful. I’m sure the marketing managers using this and similar products are accustomed to the nature and amount of data made available to them, but coming to this afresh, I felt pretty disgusted to be part of an industry that operates like this.

Thankfully, my annoyance was tempered by the fact that I also needed to implement a consent dialogue to inform users of the types of services being used and give them the option to opt-in or decline.

GDPR can’t come soon enough.
