// app/javascript/plugins/init_sweetalert.js
import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons.length > 0) {
    swalButtons.forEach(swalButton => {
      swalButton.addEventListener('click', () => {
        const name = swalButton.getAttribute("data-friend-name");
        const id = swalButton.getAttribute('data-friend-id');
        swal({
          title: "We fell out 🤬",
          text: "No more thoughtful presents for " + name + "!!!",
          buttons: [ "Cancel", true ],
          dangerMode: true,
          closeModal: true,
        }).then(value => {
          if (value) {
          const link = document.querySelector("#delete-" + id);
          link.click();
          }
        })
      });
    });
  }
};

export { initSweetalert };