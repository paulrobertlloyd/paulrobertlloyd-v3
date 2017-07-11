export default function (name, value, days) {
  var expires;

  if (value === undefined) {
    var cookiestring = '; ' + document.cookie;
    var cookies = cookiestring.split('; ' + name + '=');
    if (cookies.length === 2) {
      return cookies.pop().split(';').shift();
    }
    return null;
  }

  if (value === false) {
    days = -1;
  }

  if (days) {
    var date = new Date();
    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    expires = '; expires=' + date.toGMTString();
  } else {
    expires = '';
  }

  document.cookie = name + '=' + value + expires + '; path=/';
}
