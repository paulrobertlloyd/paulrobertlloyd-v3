(function (win, doc) {
  'use strict';

  function handleOffline () {
    var template = doc.querySelector('#offline-message-template');
    return doc.body.prepend(template.content.cloneNode(true));
  }

  function handleOnline () {
    var message = doc.querySelector('#offline-message');
    return message ? doc.body.removeChild(message) : null;
  }

  win.addEventListener('offline', handleOffline);
  win.addEventListener('online', handleOnline);

  win.addEventListener('load', function(e) {
    if (navigator.onLine) {
      handleOnline;
    } else {
      handleOffline;
    }
  });
}(this, this.document));
