
// image api things that don't work yet:
// const setImage = (data) => {
//   console.log(data.results[0].url_fullxfull);
// };

// const getImage = (result) => {
//   fetch(`https://openapi.etsy.com/v2/listings/${result.listing_id}/images?api_key=${apiKey}`)
//   .then(response => response.json())
//   .then(data => setImage(data));
// };

const insertGifts = (data, list) => {
  data.results.forEach((result) => {
    try {
      // let img = getImage(result);
      const gift = `<div class="card w-50 m-0.75">
      <div class="card-body p-0">
        <h6 class="card-title text-truncate text-primary p-2 mb-0">${result.title}</h6>
      <p class="pl-2"><a href="/gifts/new?gift_url=${result.url}">Add this gift +</a></p>
      <p class="pl-2">£${result.price}</p>
      </div>
      </div>`;
      list.insertAdjacentHTML('afterbegin', gift);
    }
    catch(err) {
    }
  });
};


const callEtsyAPI = () => {
  const list = document.querySelector('.etsy_holder');
  const apiKey = document.querySelector('div[data-etsy-api-key]').dataset.etsyApiKey
  if (list) {
    console.log('calling etsy api')
      fetch(`https://openapi.etsy.com/v2/listings/active?api_key=${apiKey}`)
      .then(response => response.json())
      .then(data => insertGifts(data, list));
  }
}

export {callEtsyAPI};
