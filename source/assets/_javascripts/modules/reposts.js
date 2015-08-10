(function (root, factory) {
    'use strict';

    root.Reposts = factory();
}(this, function () {
    'use strict';

    var Reposts = function (reposts) {
        this.reposts = reposts;
        this.init();
    };

    Reposts.prototype = {
        init: function () {
            this.containerTemplate = document.querySelector('#template--reposts').content;
            this.repostTemplate = document.querySelector('#template--avatar').content;
            this.list = this.containerTemplate.querySelector('.c-page__section--reposts .c-list');
        },

        render: function () {
            this.reposts.sort(this.sort);
            this.reposts.forEach(this.process, this);

            return this.containerTemplate;
        },

        process: function (repost) {
            var author = repost.entry.properties.author[0].properties;
            var template = document.importNode(this.repostTemplate, true);
            var anchor = template.querySelector('a');
            var avatar = template.querySelector('img');

            anchor.setAttribute('href', author.url[0]);
            avatar.setAttribute('alt', author.name[0]);
            avatar.setAttribute('src', author.photo[0]);
            avatar.setAttribute('title', author.name[0] + ' shared this.');

            this.list.appendChild(template);
        },

        sort: function (a, b) {
            return new Date(a.created_at) - new Date(b.created_at);
        }
    };

    return Reposts;
}));
