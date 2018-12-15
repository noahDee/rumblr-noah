function buttonHide() {
  if (this.classList == 'delete-button'){
    document.querySelector('.delete-form').classList.remove('hidden');
  } else if (this.classList == 'tags-button') {
    document.querySelector('.tags-form').classList.remove('hidden');
  } else if (this.classList == 'photo-button') {
    document.querySelector('.photo-form').classList.remove('hidden');
  }

  let buttons = document.querySelectorAll("#option");
  for (var i = 0; i < buttons.length; i++) {
    buttons[i].classList.add('hidden')
  }
}

var deleteButton = document.querySelector('.delete-button');
var tagButton = document.querySelector('.tags-button');
var photoButton = document.querySelector('.photo-button');
deleteButton.addEventListener('click', buttonHide);
tagButton.addEventListener('click', buttonHide);
photoButton.addEventListener('click', buttonHide);

let cancelButtons = document.querySelectorAll("button[name = 'cancel']");
for (var i = 0; i < cancelButtons.length; i++) {
  cancelButtons[i].onclick = function() {
    location.href = "/settings";
  }
}
