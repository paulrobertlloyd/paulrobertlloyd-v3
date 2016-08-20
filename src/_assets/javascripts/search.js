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
    searchResults.setAttribute('class', 'c-list c-list--inline');

    [].forEach.call(doc.querySelectorAll('.c-form--search .c-form__submit, .c-form--search .c-form__hidden'),
    function (e) {
      e.parentNode.removeChild(e);
    });

    SimpleJekyllSearch ({
      searchInput: doc.querySelector('.c-form--search .c-form__input'),
      resultsContainer: doc.querySelector('.c-list'),
      searchResultTemplate: '<li class="c-list__item u-separate"><a href="{url}">{title}</a></li>',
      noResultsText: '<li class="c-list__item">Nothing matched your query</li>',
      json: '/journal/search.json',
      limit: 10,
    });
  }

}(this, this.document));
