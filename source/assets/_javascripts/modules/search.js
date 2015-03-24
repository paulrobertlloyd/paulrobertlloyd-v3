// Search posts and pages
// = require vendor/Simple-Jekyll-Search/dest/jekyll-search
(function (win, doc) {
    'use strict';

    if (doc.querySelector('.form--search')) {
        var searchForm = doc.querySelector('.form--search');
        var searchInput = doc.querySelector('.form--search .form__input');
        var searchResults = doc.createElement('ol');

        searchForm.appendChild(searchResults);
        searchForm.setAttribute('action', '#search');
        searchForm.removeAttribute('method');
        searchInput.removeAttribute('name');
        searchResults.setAttribute('class', 'list list--inline list--inline--separated list--results');

        [].forEach.call(doc.querySelectorAll('.form--search .form__submit, .form--search .form__hidden'),
        function (e) {
            e.parentNode.removeChild(e);
        });

        SimpleJekyllSearch.init({
            searchInput: doc.querySelector('.form--search .form__input'),
            resultsContainer: doc.querySelector('.list--results'),
            searchResultTemplate: '<li class="list__item list__item--{type}"><a href="{url}">{title}</a></li>',
            noResultsText: '<li>Nothing matched your query</li>',
            dataSource: '/archive/search.json',
            limit: 10,
        });
    }

}(this, this.document));
