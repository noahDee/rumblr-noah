console.log('JS linked');


function buttonHide() {
  if (this.classList == 'login-button'){
    document.querySelector('.login-form').classList.remove('hidden');
  } else if (this.classList == 'signup-button') {
    document.querySelector('.signup-form').classList.remove('hidden');
  }

  let buttons = document.querySelectorAll("button[type = 'button']");
  for (var i = 0; i < buttons.length; i++) {
    buttons[i].classList.add('hidden')
  }
}

var signupButton = document.querySelector('.signup-button');
var loginButton = document.querySelector('.login-button');
signupButton.addEventListener('click', buttonHide);
loginButton.addEventListener('click', buttonHide);

window.onload = function () {
  let splash = document.querySelector('.small');
  splash.style.opacity = '1';
}
