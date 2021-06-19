const flipCard = () => {
  const flip = document.getElementsByClassName("flip-card");
  if (flip) { 
    // Section for Front Card Arrow
    // console.log("Working on the Flip Card JS"); // Checking this is working on the right pages
    const arrowBtns = document.querySelectorAll(".arrow-btn");
    // console.log(arrowBtns); // Checking if al of the buttons are being listened to
    arrowBtns.forEach(arrowBtn => {
      arrowBtn.addEventListener('click', (event) => {
        event.preventDefault();
        // console.log(arrowBtn); // this is the element clicked
        const flipOut = arrowBtn.closest(".flip-card-front");
        // console.log(flipOut); // this is the div to Flip Out
        flipOut.classList.add("flip-out");
        flipOut.classList.add("hidden");
        flipOut.classList.remove("flip-in");
        // Working out the Parent Div
        const parentDiv = arrowBtn.closest(".flip-card");
        // Used to find the Div to flip in
        const flipIn = parentDiv.querySelector(".flip-card-back");
        // console.log(flipIn); // thi is the div to Flip In
        flipIn.classList.remove("flip-out");
        flipIn.classList.remove("hidden");
        flipIn.classList.add("flip-in");
      });
    });

    // Section for Back Card Arrow
    const backBtns = document.querySelectorAll(".back-btn");
    // console.log(backBtns); // Checking if al of the buttons are being listened to
    backBtns.forEach(backBtn => {
      backBtn.addEventListener('click', (event) => {
        event.preventDefault();
        // console.log(backBtn); // this is the element clicked
        const flipOut = backBtn.closest(".flip-card-back");
        // console.log(flipOut); // this is the div to Flip Out
        flipOut.classList.add("flip-out");
        flipOut.classList.add("hidden");
        flipOut.classList.remove("flip-in");
        // Working out the Parent Div
        const parentDiv = backBtn.closest(".flip-card");
        // Used to find the Div to flip in
        const flipIn = parentDiv.querySelector(".flip-card-front");
        // console.log(flipIn); // thi is the div to Flip In
        flipIn.classList.remove("flip-out");
        flipIn.classList.remove("hidden");
        flipIn.classList.add("flip-in");
      });
    });
  }
}

export {flipCard};