(function (win, doc) {
  'use strict';

  const endpoint = '{{ "search.json" | relative_url }}';
  const pages = [];

  fetch(endpoint)
    .then(blob => blob.json())
    .then(data => pages.push(...data))

  function findResults(termToMatch, pages) {
    return pages.filter(item => {
      const regex = new RegExp(termToMatch, 'gi');
      return item.title.match(regex) || item.content.match(regex);
    });
  }

  function displayResults() {
    const resultsArray = findResults(this.value, pages);
    const html = resultsArray.map(item => {
      return `
        <li class="c-list"><a href="${item.url}">${item.title}</a></li>`;
    }).join('');
    if ((resultsArray.length == 0) || (this.value == '')) {
      searchResults.innerHTML = `<p>Sorry, nothing was found</p>`;
    } else {
      searchResults.innerHTML = html;
    }
  }

  const searchForm = doc.querySelector('.c-form--search');
  const searchInput = doc.querySelector('.c-form--search .c-form__input');
  const searchResults = doc.createElement('ol');

  searchForm.appendChild(searchResults);
  searchForm.setAttribute('action', '#search');
  searchForm.removeAttribute('method');
  searchInput.removeAttribute('name');
  searchResults.setAttribute('class', 'c-list c-list--inline c-list--search');

  [].forEach.call(doc.querySelectorAll('.c-form--search .c-form__submit, .c-form--search .c-form__hidden'),
  function (e) {
    e.parentNode.removeChild(e);
  });

  searchInput.addEventListener('keyup', displayResults);
  searchInput.addEventListener('keypress', function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
    }
  });

}(this, this.document));
