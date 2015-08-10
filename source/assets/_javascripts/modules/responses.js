(function (root, factory) {
    'use strict';

    root.Responses = factory();
}(this, function () {
    'use strict';

    var Responses = function (responses) {
        this.responses = responses;
        this.init();
    };

    Responses.prototype = {
        init: function () {
            this.containerTemplate = document.querySelector('#template--responses').content;
            this.referenceTemplate = document.querySelector('#template--reference').content;
            this.replyTemplate = document.querySelector('#template--reply').content;
            this.list = this.containerTemplate.querySelector('.c-page__section--responses .c-page__section__main');
        },

        render: function () {
            this.responses.sort(this.sort.bind(this));
            this.responses.forEach(this.process, this);

            return this.containerTemplate;
        },

        process: function (response) {
            var type = response.webmention_type;
            var entry = response.entry.properties;
            var template = document.importNode(type === 'reply' ? this.replyTemplate : this.referenceTemplate, true);
            var author = this._normalizeAuthor(response);
            var avatar = template.querySelector('.c-item__avatar');
            var url = this._normalizeUrl(response);
            var published = new DateFormatter(this._normalizePublishedDate(response));
            var pubdate = template.querySelector('.c-item__pubdate');

            template.querySelector('.c-item--comment').setAttribute('id', 'response-' + response.id);
            template.querySelector('.c-item__author-url').setAttribute('href', author.url);
            template.querySelector('.c-item__author').textContent = author.name;

            pubdate.setAttribute('datetime', published.toIso8601());
            pubdate.innerHTML = published.toFormattedString();

            if (author.photo) {
                avatar.setAttribute('src', author.photo);
            } else {
                avatar.parentNode.removeChild(avatar);
            }

            if (type === 'reply') {
                template.querySelector('.c-item__main').innerHTML = entry.content[0].replace(/<p class="u-mention">.*<\/p>/g, '').replace(/^\s+|\s+$/g, '').replace(/(?:\n\n)+/g, '<br/><br/>');
                template.querySelector('.c-item__permalink').setAttribute('href', url);
            } else {
                template.querySelector('.c-item__link').setAttribute('href', url);
                template.querySelector('.c-item__title').textContent = entry.name[0];
            }

            this.list.appendChild(template);
        },

        sort: function (a, b) {
            return new Date(this._normalizePublishedDate(a)) - new Date(this._normalizePublishedDate(b));
        },

        _normalizeAuthor: function (obj) {
            var author = obj.entry.properties.author;
            var domain = obj.source.match(/^https?:\/\/(.[^\/]+)\//);
            var data = {
                name: domain[1],
                url: domain[0]
            };

            if (typeof author !== 'undefined') {
                var name = author[0].properties.name;
                var url = author[0].properties.url;
                var photo = author[0].properties.photo;

                if (typeof name !== 'undefined') {
                    data.name = name[0];
                }

                if (typeof url !== 'undefined') {
                    data.url = this._relativeToAbsoluteUrl(url[0], obj.source);
                }

                if (typeof photo !== 'undefined') {
                    data.photo = this._relativeToAbsoluteUrl(photo[0], obj.source);
                }
            }

            return data;
        },

        _normalizePublishedDate: function (obj) {
            var normalizedPublishedDate = obj.created_at;
            var entry = obj.entry;

            if (typeof entry !== 'undefined' && typeof entry.properties.published !== 'undefined') {
                normalizedPublishedDate = entry.properties.published[0];
            }

            return normalizedPublishedDate;
        },

        _normalizeUrl: function (obj) {
            var url = obj.entry.properties.url;

            return typeof url !== 'undefined' ? this._relativeToAbsoluteUrl(url[0], obj.source) : obj.source;
        },

        _relativeToAbsoluteUrl: function (url, sourceUrl) {
            if (!/^https?:\/\//.test(url)) {
                url = sourceUrl.match(/^(https?:\/\/(?:.[^\/]+))\/?/)[1] + url;
            }

            return url;
        }
    };

    return Responses;
}));
