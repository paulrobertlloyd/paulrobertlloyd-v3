// Derived from http://jsfiddle.net/brianblakely/h3EmY/
(function (document) {
    'use strict';

    if ('content' in document.createElement('template')) {
        return false;
    }

    // Styling shim for old IE
    document.createElement('template');

    var templates = document.getElementsByTagName('template');

    for (var i = 0, j = templates.length; i < j; i = i + 1) {
        var template = templates[i];
        var childNodes = template.childNodes;
        var fragment = document.createDocumentFragment();

        while (childNodes[0]) {
            fragment.appendChild(childNodes[0]);
        }

        template.content = fragment;
    }
})(document);
