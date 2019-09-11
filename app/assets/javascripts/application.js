// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

const list = document.querySelectorAll(".filter")

list.forEach((item) => {
  item.addEventListener("click", (event) => {
    document.querySelectorAll('.btn').forEach((btn) => {
      if (btn.id === `${item.id}-price`) {
      //  console.log('hola')
      //  console.log(`${btn.id}`)
        btn.classList.remove('hide')
      //  console.log('hello')
      } else {
        btn.classList.add('hide')
     }  })
  })
});
