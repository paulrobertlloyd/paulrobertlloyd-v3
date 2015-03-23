// Search posts and pages
// = require vendor/Simple-Jekyll-Search/dest/jekyll-search
(function (win, doc) {
    'use strict';

    if (doc.querySelector('.form--search')) {
        var searchForm = doc.querySelector('.form--search');
        var searchInput = doc.querySelector('.form--search .form__input');
        var searchResults = doc.createElement('div');

        searchForm.appendChild(searchResults);
        searchForm.setAttribute('action', '#search');
        searchForm.removeAttribute('method');
        searchInput.removeAttribute('name');
        searchResults.setAttribute('class', 'search-results');

        [].forEach.call(doc.querySelectorAll('.form--search .form__submit, .form--search .form__hidden'),
        function (e) {
            e.parentNode.removeChild(e);
        });

        SimpleJekyllSearch.init({
            searchInput: doc.querySelector('.form--search .form__input'),
            resultsContainer: doc.querySelector('.search-results'),
            template: '<span class="search-results__result">{type}: <a href="{url}">{title}</a></span>',
            noResultsText: '<p>Nothing matched your query</p>',
            dataSource: '/archive/search.json',
            limit: 10,
        });
    }

}(this, this.document));
