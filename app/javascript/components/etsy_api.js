
// RIP this JS file. Long live Ruby.

 // image api things that don't work yet:
// const setImage = (data) => {
//   console.log('setting images')
//   console.log(data.results[0].url_fullxfull);
// };

// const getImage = (result) => {
//   console.log('getting images')
//   fetch(`https://openapi.etsy.com/v2/listings/${result.listing_id}/images?api_key=${apiKey}`)
//   .then(response => response.json())
//   .then(data => console.log(data.results[0].url_fullxfull));
// };

// const insertGifts = (data, list) => {
//   data.results.forEach((result) => {
//     try {
//       // let img = getImage(result);
//       const gift = `<div class="card w-50 m-0.75">
//       <div class="card-body p-0">
//         <h6 class="card-title text-truncate text-primary p-2 mb-0">${result.title}</h6>
//       <p class="pl-2"><a href="/gifts/new?gift_url=${result.url}">Add this gift +</a></p>
//       <p class="pl-2">£${result.price}</p>
//       </div>
//       </div>`;
//       list.insertAdjacentHTML('beforeend', gift);
//     }
//     catch(err) {
//     }
//   });
// };


// const callEtsyAPI = () => {
//   const list = document.querySelector('.etsy_holder');
//   if (list) {
//     const apiKey = document.querySelector('div[data-etsy-api-key]').dataset.etsyApiKey
//     console.log('calling etsy api')
//       fetch(`https://openapi.etsy.com/v2/listings/active?api_key=${apiKey}`)
//       .then(response => response.json())
//       .then(data => insertGifts(data, list));
//   }
// }

// export {callEtsyAPI};
