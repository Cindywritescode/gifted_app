const notificationCard = () => {
  const notification = document.querySelector(".notification-card");
  const button = document.querySelector('.click');
  const audio = document.querySelector("audio")
    $(notification).hide();
    $(button).click(function playAudio() {
    $(notification).slideDown();
     audio.play();
     console.log("Hello")
  });
}

export {notificationCard};


