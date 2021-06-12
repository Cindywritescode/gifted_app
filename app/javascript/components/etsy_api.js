const insertGifts = (data, list) => {
  data.results.forEach((result) => {
    const gift = `<p>${result.title}</p>`;
    list.insertAdjacentHTML('afterbegin', gift);
  });
};

const callEtsyAPI = () => {
  const list = document.querySelector('#etsy_holder');
  if (list) {
    console.log('calling etsy api')
      fetch("https://openapi.etsy.com/v2/listings/active?api_key=joxo65hgy17pmzfxhe2adsp0")
      .then(response => response.json())
      .then(data => insertGifts(data, list));

  }
}

export {callEtsyAPI};
