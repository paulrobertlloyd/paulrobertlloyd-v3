// = require vendor/fontfaceobserver/fontfaceobserver
// = require ./cookie

function fonts() {
  if (document.documentElement.className.indexOf('fonts-loaded') > -1) {
    return;
  }

  var regular = new FontFaceObserver('Calibre', {
    weight: 'normal',
    style: 'normal'
  });

  var italic = new FontFaceObserver('Calibre', {
    weight: 'normal',
    style: 'italic'
  });

  var semibold = new FontFaceObserver('Calibre', {
    weight: 700,
    style: 'normal'
  });

  Promise.all([
    regular.load(),
    italic.load(),
    semibold.load()
  ]).then(function () {
    document.documentElement.className += ' fonts-loaded';
    cookie('fonts-loaded', !0, 7);
  }).catch(function (err) {
    console.error(err);
  });
}
