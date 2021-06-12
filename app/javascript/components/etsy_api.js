
// const setImage = (data) => {
//   data.results[0].url_170x135
// };

// const getImage = (result) => {
//   fetch(`https://openapi.etsy.com/v2/listings/${result.listing_id}/images?api_key=joxo65hgy17pmzfxhe2adsp0`)
//   .then(response => response.json())
//   .then(data => setImage(data));
// };

const insertGifts = (data, list) => {
  data.results.forEach((result) => {
    try {
      // const img = getImage(result);
      const gift = `<div class="card w-50">
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
  if (list) {
    console.log('calling etsy api')
      fetch("https://openapi.etsy.com/v2/listings/active?api_key=joxo65hgy17pmzfxhe2adsp0")
      .then(response => response.json())
      .then(data => insertGifts(data, list));
  }
}

export {callEtsyAPI};
