// Search posts and pages
// = require vendor/Simple-Jekyll-Search/dest/jekyll-search
(function (win, doc) {
    'use strict';

    if (doc.querySelector('.c-form--search')) {
        var searchForm = doc.querySelector('.c-form--search');
        var searchInput = doc.querySelector('.c-form--search .c-form__input');
        var searchResults = doc.createElement('ol');

        searchForm.appendChild(searchResults);
        searchForm.setAttribute('action', '#search');
        searchForm.removeAttribute('method');
        searchInput.removeAttribute('name');
        searchResults.setAttribute('class', 'c-link-list o-list o-list--inline');

        [].forEach.call(doc.querySelectorAll('.c-form--search .c-form__submit, .c-form--search .c-form__hidden'),
        function (e) {
            e.parentNode.removeChild(e);
        });

        SimpleJekyllSearch.init({
            searchInput: doc.querySelector('.c-form--search .c-form__input'),
            resultsContainer: doc.querySelector('.o-list'),
            searchResultTemplate: '<li class="c-link-list__item o-list__item o-list__item--{type}"><a href="{url}">{title}</a></li>',
            noResultsText: '<li class="o-list__item">Nothing matched your query</li>',
            dataSource: '/archive/search.json',
            limit: 10,
        });
    }

}(this, this.document));
