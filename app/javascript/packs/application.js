// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap'
import "../stylesheets/application"
import { initMap } from '../adresses/gmaps';
global.initMap = initMap;
import 'bootstrap-select'

import $ from 'jquery';
global.$ = jQuery;

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)



////////// SWITCH LIGHT DARK MODE////////

/*  SET GLOBAL VAR  */
var globalDarkMode = 0;

var checkAndSetDMVar = function(){
    if (globalDarkMode == 1){
      $("#darkSwitch").prop('checked', true);
      /*document.getElementById("minFullBrowserContainer").classList.toggle("dark-mode");*/
      document.body.classList.toggle("dark-mode");
    }
    return
}

$(document).on('load',checkAndSetDMVar);
$(document).on('turbolinks:load',checkAndSetDMVar);

$(document).on("change", "#darkSwitch",function(){
     /*document.getElementById("minFullBrowserContainer").classList.toggle("dark-mode");*/
     document.body.classList.toggle("dark-mode");
     globalDarkMode = 1 - globalDarkMode;
});

/////////////////////////////////////////
//////    TOOL TIP ////////////

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});


///////////////////////////

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

///// currency format /////
$(document).ready(function(){
    $("#alertModal").modal();
});

////// FORM UI/UX /////

var formUiUx = function() {
  // Test for placeholder support
    $.support.placeholder = (function(){
        var i = document.createElement('input');
        return 'placeholder' in i;
    })();

    // Hide labels by default if placeholders are supported
    if($.support.placeholder) {
        $('.form-label').each(function(){
            $(this).addClass('js-hide-label');
        });  

        // Code for adding/removing classes here
        $('.form-group').find('input, textarea').on('keyup blur focus', function(e){
            
            // Cache our selectors
            var $this = $(this),
                $label = $this.parent().find("label");
          
            switch(e.type) {
              case 'keyup': {
                 $label.toggleClass('js-hide-label', $this.val() == '');
              } break;
              case 'blur': {
                if( $this.val() == '' ) {
                    $label.addClass('js-hide-label');
                } else {
                    $label.removeClass('js-hide-label').addClass('js-unhighlight-label');
                }
              } break;
              case 'focus': {
                if( $this.val() !== '' ) {
                    $label.removeClass('js-unhighlight-label');
                }
              } break;
              default: break;
            }
            // previous implementation with ifs
            /*if (e.type == 'keyup') {
                if( $this.val() == '' ) {
                    $parent.addClass('js-hide-label'); 
                } else {
                    $parent.removeClass('js-hide-label');   
                }                     
            } 
            else if (e.type == 'blur') {
                if( $this.val() == '' ) {
                    $parent.addClass('js-hide-label');
                } 
                else {
                    $parent.removeClass('js-hide-label').addClass('js-unhighlight-label');
                }
            } 
            else if (e.type == 'focus') {
                if( $this.val() !== '' ) {
                    $parent.removeClass('js-unhighlight-label');
                }
            }*/
        });
    } 
}

$(document).on('load',formUiUx);
$(document).on('turbolinks:load',formUiUx);

///////// DATETIME PICKER /////////



$(function() {
  $('#sale_client_id').selectpicker({
      dropupAuto: false
    });
});

