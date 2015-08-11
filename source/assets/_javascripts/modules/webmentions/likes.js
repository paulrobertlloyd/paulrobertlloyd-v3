// Webmentions - likes

(function (root, factory) {
    'use strict';

    root.Likes = factory();
}(this, function () {
    'use strict';

    var Likes = function (likes) {
        this.likes = likes;
        this.init();
    };

    Likes.prototype = {
        init: function () {
            this.containerTemplate = document.querySelector('#template--likes').content;
            this.likeTemplate = document.querySelector('#template--avatar').content;
            this.list = this.containerTemplate.querySelector('.c-section--likes .c-list');
        },

        render: function () {
            this.likes.sort(this.sort);
            this.likes.forEach(this.process, this);

            return this.containerTemplate;
        },

        process: function (like) {
            var author = like.entry.properties.author[0].properties;
            var template = document.importNode(this.likeTemplate, true);
            var anchor = template.querySelector('a');
            var avatar = template.querySelector('img');

            anchor.setAttribute('href', author.url[0]);
            avatar.setAttribute('alt', author.name[0]);
            avatar.setAttribute('src', author.photo[0]);
            avatar.setAttribute('title', author.name[0] + ' likes this.');

            this.list.appendChild(template);
        },

        sort: function (a, b) {
            return new Date(a.created_at) - new Date(b.created_at);
        }
    };

    return Likes;
}));
