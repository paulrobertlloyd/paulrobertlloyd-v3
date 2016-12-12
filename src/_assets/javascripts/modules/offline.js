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

  // TODO: Rewrite arrow function as ES5
  // Also, message sometimes appears when online
  // win.addEventListener('load', event => {
  //   if (!navigator.onLine) {
  //     handleOffline();
  //   }
  // });
}(this, this.document));
