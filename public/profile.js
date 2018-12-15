  function postReveal() {
    console.log('works?');
    this.classList.add('hidden')
    let postForm = document.querySelector('.post-form');
    postForm.classList.remove('hidden');
    let block = document.querySelector('#block-title');
    block.innerHTML = 'New Post'
    postForm.scrollIntoView({behavior: "smooth"});

  }

  function cancelPost() {
    let postForm = document.querySelector('.post-form');
    postForm.classList.add('hidden');
    postButton.classList.remove('hidden')
    let block = document.querySelector('#block-title');
    block.innerHTML = 'Your Posts'
    block.scrollIntoView({behavior: "smooth"});
  }
  var postButton = document.querySelector("button[name = 'post-reveal']");
  postButton.addEventListener('click', postReveal);

  var cancelButton = document.querySelector("button[name = 'cancel']");
  cancelButton.addEventListener('click', cancelPost)

  var btns = document.getElementsByClassName('options-btn');

  for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener('click', popup)
  }
  function popup() {
    console.log('popup?');
    var popup = document.querySelector('.pop-up');
    var over = document.querySelector('.overlay')
    popup.style.visibility = 'visible';
    over.style.visibility = 'visible';

  }
