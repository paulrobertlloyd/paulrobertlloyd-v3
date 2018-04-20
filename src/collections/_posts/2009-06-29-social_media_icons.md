---
title: Social Media Icons
date: '2009-06-29T00:18:09+0100'
excerpt: A set of standardised icons for popular social networking services and tools.
tags:
- Projects
- Social media icons
discussion: closed
---
I've often found myself requiring icons when linking to or referencing different social networks I'm a member of. Whilst there are a lot of icon sets available that can help me do this, most seem to be oversized and highly stylised. In the past I've used site favicons, but these can often be visually inconsistent.

With that in mind, and taking inspiration from the gorgeous icons used by [Tim van Damme][1] on his address card site, and the [Social Media Mini Iconpack][2] by Komodo media, I've created a selection of different icons each available in four different sizes (48×48, 32×32, 24×24 and 16×16).

For feedback and suggestions, please [submit an issue on GitHub][3].

[Download Social Media Icons][4]{: .c-button download="socialmediaicons-1.11.0.zip"} -- Version 1.11, 3.8Mb

*Licensed under a [Creative Commons Attribution-Share Alike 3.0 Licence][5]. I claim no right of ownership to the company logos used in these icons. Provision of these icons does not reflect endorsement of individual services.*

## Included icons

<style>
  .s-icons {
    display: flex;
    flex-wrap: wrap;
    font-size: 0.875rem;
  }
  .s-icons img {
    margin: 0.25rem 0.5rem 0.25rem 0;
  }
  .s-icons li {
    display: flex;
    align-items: center;
    flex-basis: 50%;
    white-space: nowrap;
    list-style: none;
  }
  @media screen and (min-width:37.5em) {
    .s-icons li {
      flex-basis: 33%;
    }
  }
</style>
{% capture icon %}<img src="https://raw.githubusercontent.com/paulrobertlloyd/socialmediaicons/master/ICON-48x48.png" height="24" width="24" alt="">{% endcapture %}
<ul class="s-icons">
  <li>{{ icon | replace:"ICON","500px" }} 500px</li>
  <li>{{ icon | replace:"ICON","aim" }} AIM</li>
  <li>{{ icon | replace:"ICON","amazon" }} Amazon</li>
  <li>{{ icon | replace:"ICON","adn" }} App.net</li>
  <li>{{ icon | replace:"ICON","behance" }} Behance</li>
  <li>{{ icon | replace:"ICON","bbcid" }} BBC iD</li>
  <li>{{ icon | replace:"ICON","creativecommons" }} Creative Commons</li>
  <li>{{ icon | replace:"ICON","delicious" }} Delicious</li>
  <li>{{ icon | replace:"ICON","deviantart" }} Deviant Art</li>
  <li>{{ icon | replace:"ICON","digg" }} Digg</li>
  <li>{{ icon | replace:"ICON","dribbble" }} Dribbble</li>
  <li>{{ icon | replace:"ICON","email" }} Email</li>
  <li>{{ icon | replace:"ICON","etsy" }} Etsy</li>
  <li>{{ icon | replace:"ICON","facebook" }} Facebook</li>
  <li>{{ icon | replace:"ICON","feed" }} Feed</li>
  <li>{{ icon | replace:"ICON","ffffound" }} Ffffound</li>
  <li>{{ icon | replace:"ICON","flickr" }} Flickr</li>
  <li>{{ icon | replace:"ICON","forrst" }} Forrst</li>
  <li>{{ icon | replace:"ICON","foursquare" }} Foursquare</li>
  <li>{{ icon | replace:"ICON","getsatisfaction" }} Get Satisfaction</li>
  <li>{{ icon | replace:"ICON","geotag" }} Geotag</li>
  <li>{{ icon | replace:"ICON","github" }} Github</li>
  <li>{{ icon | replace:"ICON","goodreads" }} Goodreads</li>
  <li>{{ icon | replace:"ICON","google" }} Google</li>
  <li>{{ icon | replace:"ICON","google+" }} Google+</li>
  <li>{{ icon | replace:"ICON","huffduffer" }} Huffduffer</li>
  <li>{{ icon | replace:"ICON","identica" }} Identi.ca</li>
  <li>{{ icon | replace:"ICON","imdb" }} IMDb</li>
  <li>{{ icon | replace:"ICON","instagram" }} Instagram</li>
  <li>{{ icon | replace:"ICON","lanyrd" }} Lanyrd</li>
  <li>{{ icon | replace:"ICON","lastfm" }} Last.fm</li>
  <li>{{ icon | replace:"ICON","linkedin" }} LinkedIn</li>
  <li>{{ icon | replace:"ICON","meetup" }} Meetup</li>
  <li>{{ icon | replace:"ICON","microsoft" }} Microsoft</li>
  <li>{{ icon | replace:"ICON","myspace" }} MySpace</li>
  <li>{{ icon | replace:"ICON","newsvine" }} Newsvine</li>
  <li>{{ icon | replace:"ICON","nikeplus" }} Nike+</li>
  <li>{{ icon | replace:"ICON","orkut" }} Orkut</li>
  <li>{{ icon | replace:"ICON","pinboard" }} Pinboard</li>
  <li>{{ icon | replace:"ICON","pinterest" }} Pinterest</li>
  <li>{{ icon | replace:"ICON","rdio" }} Rdio</li>
  <li>{{ icon | replace:"ICON","readability" }} Readability</li>
  <li>{{ icon | replace:"ICON","readernaut" }} Readernaut</li>
  <li>{{ icon | replace:"ICON","reddit" }} Reddit</li>
  <li>{{ icon | replace:"ICON","share" }} Share</li>
  <li>{{ icon | replace:"ICON","skype" }} Skype</li>
  <li>{{ icon | replace:"ICON","slideshare" }} SlideShare</li>
  <li>{{ icon | replace:"ICON","speakerdeck" }} Speaker Deck</li>
  <li>{{ icon | replace:"ICON","soundcloud" }} Soundcloud</li>
  <li>{{ icon | replace:"ICON","spotify" }} Spotify</li>
  <li>{{ icon | replace:"ICON","stackoverflow" }} Stack Overflow</li>
  <li>{{ icon | replace:"ICON","stumbleupon" }} StumbleUpon</li>
  <li>{{ icon | replace:"ICON","thisismyjam" }} This Is My Jam</li>
  <li>{{ icon | replace:"ICON","tumblr" }} Tumblr</li>
  <li>{{ icon | replace:"ICON","twitter" }} Twitter</li>
  <li>{{ icon | replace:"ICON","twitter-retweet" }} Twitter Retweet</li>
  <li>{{ icon | replace:"ICON","vcard" }} vCard</li>
  <li>{{ icon | replace:"ICON","vimeo" }} Vimeo</li>
  <li>{{ icon | replace:"ICON","website" }} Website</li>
  <li>{{ icon | replace:"ICON","wikipedia" }} Wikipedia</li>
  <li>{{ icon | replace:"ICON","xbox" }} Xbox Live</li>
  <li>{{ icon | replace:"ICON","xing" }} Xing</li>
  <li>{{ icon | replace:"ICON","yahoo" }} Yahoo!</li>
  <li>{{ icon | replace:"ICON","yelp" }} Yelp</li>
  <li>{{ icon | replace:"ICON","youtube" }} YouTube</li>
  <li>{{ icon | replace:"ICON","zerply" }} Zerply</li>
</ul>

[1]: http://timvandamme.com/
[2]: http://www.komodomedia.com/blog/2008/12/social-media-mini-iconpack/
[3]: https://github.com/paulrobertlloyd/socialmediaicons/issues
[4]: https://github.com/paulrobertlloyd/socialmediaicons/archive/1.11.0.zip
[5]: http://creativecommons.org/licenses/by-sa/3.0/

*[AIM]: AOL Instant Messnger
*[BBC]: British Broadcasting Corporation
*[IMDb]: Internet Movie Database
*[Mb]: Megabyte
*[OPML]: Outline Processor Markup Language
*[PNG]: Portable Network Graphic
