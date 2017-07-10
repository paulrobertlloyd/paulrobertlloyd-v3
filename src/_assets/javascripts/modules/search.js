export default function () {
  const endpoint = '/archive/search.json';
  const pages = [];

  fetch(endpoint)
    .then(blob => blob.json())
    .then(data => pages.push(...data));

  function findResults(termToMatch, pages) {
    return pages.filter(item => {
      const regex = new RegExp(termToMatch, 'gi');
      return item.title.match(regex) || item.excerpt.match(regex);
    });
  }

  function displayResults(el) {
    const resultsArray = findResults(this.value, pages);
    const html = resultsArray.map(item => {
      return `
        <li class="c-list__item">
          <a href="${item.url}">${item.title}</a>
        </li>`;
    }).join('');

    if ((resultsArray.length === 0) || (this.value === '')) {
      el.innerHTML = `<li class="c-list__item">Nothing matched your query</li>`;
    } else {
      el.innerHTML = html;
    }
  }

  if (document.querySelector('.c-form--search')) {
    const searchForm = document.querySelector('.c-form--search');
    const searchInput = document.querySelector('.c-form--search .c-form__input');
    const searchSubmit = document.querySelector('.c-form--search .c-form__submit');

    // Set up results list
    const resultsList = document.createElement('ol');
    resultsList.setAttribute('class', 'c-list c-list--inline');

    // Adapt search form
    searchForm.appendChild(resultsList);
    searchForm.setAttribute('action', '#search');
    searchForm.removeAttribute('method');
    searchSubmit.parentNode.removeChild(searchSubmit);

    searchInput.addEventListener('keyup', displayResults(resultsList));
    searchInput.addEventListener('keypress', function (event) {
      if (event.keyCode === 13) {
        event.preventDefault();
      }
    });
  }
}
