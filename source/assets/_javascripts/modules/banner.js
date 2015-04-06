// Add shadow to element on scroll
(function(win, doc) {
    'use strict';

    var addEvent = function () {
        return document.addEventListener ? function (a, c, d) {
            if (a && a.nodeName || a === window) {
                a.addEventListener(c, d, !1);
            } else if (a && a.length) {
                for (var b = 0; b < a.length; b = b + 1) {
                    addEvent(a[b], c, d);
                }
            }
        } : function (a, c, d) {
            if (a && a.nodeName || a === window) {
                a.attachEvent('on' + c, function () {
                    return d.call(a, window.event);
                });
            } else if (a && a.length) {
                for (var b = 0; b < a.length; b = b + 1) {
                    addEvent(a[b], c, d);
                }
            }
        };
    }();

    var start = 0;
    var step = 10;
    var max = 10;
    var color = 'rgba(0,0,0,0.2)';
    var top = doc.getElementsByClassName('c-banner')[0];
    var setShadow = function () {
        var scroll = (doc.documentElement.scrollTop) ? doc.documentElement.scrollTop : doc.body.scrollTop;
        var amount = Math.min((scroll - start) / step, max);
        top.style.boxShadow = '0 0 ' + amount + 'px ' + color;
    };

    addEvent(win, 'scroll', function () {
        setShadow();
    });

}(this, this.document));
