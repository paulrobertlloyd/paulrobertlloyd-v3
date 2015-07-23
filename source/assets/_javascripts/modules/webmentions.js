(function (root, factory) {
    'use strict';

    root.Webmentions = factory();
}(this, function () {
    'use strict';

    var objectToUrlParams = function (obj) {
        return Object.keys(obj).map(function (key) {
            return encodeURIComponent(key) + '=' + encodeURIComponent(obj[key]);
        }).join('&');
    };

    var Webmentions = function (options) {
        this.options = options;
        this.init();
    };

    Webmentions.prototype = {
        init: function () {
            this.likes = [];
            this.references = [];
            this.replies = [];
            this.reposts = [];
            this._get(this.options.endpoint + '?' + objectToUrlParams(this.options.params), this.processMentions.bind(this));
        },

        groupMentions: function (mention) {
            switch (mention.webmention_type) {
            case 'like':
                this.likes.push(mention);
                break;
            case 'reply':
                this.replies.push(mention);
                break;
            case 'repost':
                this.reposts.push(mention);
                break;
            default:
                this.references.push(mention);
            }
        },

        processMentions: function (response) {
            var mentions = JSON.parse(response);

            if (mentions.length) {
                var nodes = [];

                mentions.forEach(this.groupMentions, this);

                if (this.references.length || this.replies.length) {
                    var responses = this.references.concat(this.replies);

                    nodes.push(new Responses(responses).render());
                }

                if (this.likes.length) {
                    nodes.push(new Likes(this.likes).render());
                }

                if (this.reposts.length) {
                    nodes.push(new Reposts(this.reposts).render());
                }

                this.render(nodes);
            }
        },

        render: function (nodes) {
            var container = this.options.container;

            nodes.forEach(function (node) {
                container.appendChild(node);
            });
        },

        _get: function (url, callback) {
            var request = 'withCredentials' in new XMLHttpRequest() ? new XMLHttpRequest() : new XDomainRequest();
            var response = [];

            request.onload = function () {
                if (request.status === 200) {
                    response = request.response;
                } else if (request.contentType === 'application/json') {
                    response = request.responseText;
                }

                callback(response);
            };

            request.open('GET', url);
            request.send();
        }
    };

    return Webmentions;
}));
