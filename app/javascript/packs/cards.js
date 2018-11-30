const demoButtons;

function start () {

  // Add event "click" to "demo buttons"
  demoButtons = document.querySelectorAll ('.js-modify');
  for (let i = 0; i < demoButtons.length; i++) {
    demoButtons[i].addEventListener ('click', toggleEffect);
  }

  // Add event "click" to "save buttons"
  const saveButtons = document.querySelectorAll ('.js-save');
  for (let i = 0; i < saveButtons.length; i++) {
    saveButtons[i].addEventListener ('click', toggleActive);
  }

}

// Toggle "effect" classes
function toggleEffect () {
  let target = document.querySelector (this.dataset.target);
      target.dataset.effect = this.dataset.effect;

  for (let i= 0; i < demoButtons.length; i++) {
    demoButtons[i].classList.remove ('active');
  }

  toggleActive.call (this);
}

// Toggle "active" class
function toggleActive () {
  this.classList.toggle ('active');
}

// Invoke "start ()" function
window.addEventListener ('load', start);
