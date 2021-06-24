const notificationCard = () => {
  const notification = document.querySelector(".notification-card");
  const button = document.querySelector('.click');
    $(notification).hide();
    $(button).click(function(e) {
    $(notification).slideDown();

    console.log("Hello")
  });
}

export {notificationCard};


