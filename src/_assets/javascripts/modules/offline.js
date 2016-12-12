(function (win, doc) {
  'use strict';

  function handleOffline () {
    const template = doc.querySelector('#offline-message-template');
    return doc.body.prepend(template.content.cloneNode(true));
  }

  function handleOnline () {
    const message = doc.querySelector('#offline-message');
    return message ? doc.body.removeChild(message) : null;
  }

  win.addEventListener('offline', handleOffline);
  win.addEventListener('online', handleOnline);
  win.addEventListener('load', event => {
    if (!navigator.onLine) {
      handleOffline();
    }
  });
}(this, this.document));
