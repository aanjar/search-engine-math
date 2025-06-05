function doSearch() {
    const queryInput = document.getElementById('search-input');
    const resultsContainer = document.getElementById('results-container');
    const query = queryInput.value.trim();

    if (!query) {
        resultsContainer.innerHTML = '<p>Please enter a search keyword.</p>';
        return;
    }

    resultsContainer.innerHTML = '<p>Mencari...</p>';

    fetch("/api/search?q=" + encodeURIComponent(query))
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            renderSearchResults(data);
        })
        .catch(error => {
            console.error('Error fetching search results:', error);
            resultsContainer.innerHTML = '<p>Error fetching search results. Please try again.</p>';
        });
}

function renderSearchResults(data) {
    const resultsContainer = document.getElementById('results-container');
    resultsContainer.innerHTML = ''; // Clear previous results

    if (data.length === 0) {
        resultsContainer.innerHTML = '<p>No results found.</p>';
        return;
    }

    data.forEach(item => {
        const cardHtml = `
            <div class="card mb-3 result-card" onclick="showDetail(${item.id})">
                <div class="card-body">
                    <h5 class="card-title">${item.title}</h5>
                    <h6 class="card-subtitle mb-2 text-muted">
                        <a href="${item.url}" target="_blank">${item.url}</a>
                    </h6>
                    <p class="card-text">${item.snippet}</p>
                    <span class="badge bg-primary">PR: ${item.pagerank.toFixed(2)}</span>
                </div>
            </div>
        `;
        resultsContainer.innerHTML += cardHtml;
    });
}

function showDetail(id) {
    const resultsContainer = document.getElementById('results-container');
    const detailSection = document.getElementById('search-detail-section');

    resultsContainer.style.display = 'none';
    detailSection.style.display = 'block';
    detailSection.innerHTML = '<p>Loading detail...</p>';

    fetch("/api/detail/" + id)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            renderDetail(data);
        })
        .catch(error => {
            console.error('Error fetching detail:', error);
            detailSection.innerHTML = '<p>Error fetching detail. Please try again.</p>';
        });
}

function renderDetail(data) {
    const detailSection = document.getElementById('search-detail-section');
    detailSection.innerHTML = ''; // Clear loading message

    const backButton = document.createElement('button');
    backButton.className = 'btn btn-link mb-3';
    backButton.textContent = '← Kembali';
    backButton.onclick = backToResults;
    detailSection.appendChild(backButton);

    const titleElement = document.createElement('h2');
    titleElement.textContent = data.title;
    detailSection.appendChild(titleElement);

    const urlElement = document.createElement('p');
    urlElement.innerHTML = `<a href="${data.url}" target="_blank">${data.url}</a>`;
    detailSection.appendChild(urlElement);

    const pagerankElement = document.createElement('p');
    pagerankElement.innerHTML = `<small class="text-secondary">PageRank: ${data.pagerank.toFixed(2)}</small>`;
    detailSection.appendChild(pagerankElement);

    const contentElement = document.createElement('div');
    contentElement.innerHTML = data.content_full;
    detailSection.appendChild(contentElement);

    if (data.out_links && data.out_links.length > 0) {
        const outLinksHeader = document.createElement('h5');
        outLinksHeader.textContent = 'Outbound Links:';
        detailSection.appendChild(outLinksHeader);

        const outLinksList = document.createElement('ul');
        data.out_links.forEach(link => {
            const listItem = document.createElement('li');
            // Assuming out_links are relative or full URLs
            const fullUrl = link.startsWith('http') ? link : new URL(link, data.url).href; // Basic handling for relative links
            listItem.innerHTML = `<a href="${fullUrl}" target="_blank">${fullUrl}</a>`;
            outLinksList.appendChild(listItem);
        });
        detailSection.appendChild(outLinksList);
    }
}

function backToResults() {
    document.getElementById('search-detail-section').style.display = 'none';
    document.getElementById('results-container').style.display = 'block';
} 