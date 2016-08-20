// Add .is-fixed to .c-navigation after certain page offset

(function (win, doc) {
  'use strict';

  var breakpoint   = win.getComputedStyle(doc.documentElement, '::after').getPropertyValue('content');
  var banner     = doc.querySelector('.c-banner');
  var bannerHeight = win.getComputedStyle(banner).height.split('px')[0];
  var navigation   = doc.querySelector('.c-navigation');
  var fixClass   = 'is-fixed';

  function stickyScroll() {
    if (win.pageYOffset > bannerHeight) {
      navigation.classList.add(fixClass);
    }

    if (win.pageYOffset < bannerHeight) {
      navigation.classList.remove(fixClass);
    }
  }

  // Only make navigation sticky at smallest breakpoint
  if (breakpoint.indexOf('s') !== -1) {
    win.onscroll = function () {
      stickyScroll ();
    };
  }

}(this, this.document));
