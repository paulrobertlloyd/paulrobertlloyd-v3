function search() {
  var endpoint = '/archive/search.json';
  var pages = [];

  var searchForm = document.querySelector('.c-form--search');
  var searchInput = document.querySelector('.c-form--search .c-form__input');
  var searchSubmit = document.querySelector('.c-form--search .c-form__submit');

  // Set up results list
  var resultsList = document.createElement('ol');
  resultsList.setAttribute('class', 'c-list c-list--inline');

  function findResults(termToMatch, pages) {
    return pages.filter(item => {
      var regex = new RegExp(termToMatch, 'gi');
      return item.title.match(regex) || item.excerpt.match(regex);
    });
  }

  function displayResults() {
    var resultsArray = findResults(this.value, pages);
    var html = resultsArray.map(function (item) {
      return `
        <li class="c-list__item">
          <a href="${item.url}">${item.title}</a>
        </li>`;
    }).join('');

    if ((resultsArray.length === 0) || (this.value === '')) {
      resultsList.innerHTML = `<li class="c-list__item">Nothing matched your query</li>`;
    } else {
      resultsList.innerHTML = html;
    }
  }

  if (document.querySelector('.c-form--search')) {
    fetch(endpoint)
      .then(blob => blob.json())
      .then(data => pages.push(...data));

    searchForm.appendChild(resultsList);
    searchForm.setAttribute('action', '#search');
    searchForm.removeAttribute('method');
    searchSubmit.parentNode.removeChild(searchSubmit);

    searchInput.addEventListener('keyup', displayResults);
    searchInput.addEventListener('keypress', function (event) {
      if (event.keyCode === 13) {
        event.preventDefault();
      }
    });
  }
}
