// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "../stylesheets/application"


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)



////////// SWITCH LIGHT DARK MODE////////

function changeLightDark() {
   var element = document.getElementsById("minFullBrowserContainer");
   element.classList.toggle("dark-mode");
}


/////////////////////////////////////////

// SEARCH FOR CLIENTS TABLE
$(document).ready(function(){
  $("#searchClient").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#clientsTableBody tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});


// VALIDATION FORM FIELDS
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

///// DATETIME PICKER ///////

///// currency format /////
$(document).ready(function(){
    $("#alertModal").modal();
});




