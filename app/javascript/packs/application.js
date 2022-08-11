// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel';

import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;
$(document).ready(function(){
$('.owl-carousel').owlCarousel({
  dots: false,
  nav: true,
  autoplay: true,
  autoplayHoverPause: true,
  loop: true,
  responsive:{
    0:{
      items:1
     },
     850:{
      items:2
     },
    1300:{
     items:3
     }
   }
 })
});

import AOS from 'aos';
import 'aos/dist/aos.css';

document.addEventListener('DOMContentLoaded', function() {
  AOS.init({
    disable: false,
    startEvent: 'turbolinks:load',
    delay: 0, // values from 0 to 3000, with step 50ms
    duration: 400, // values from 0 to 3000, with step 50ms
    easing: 'ease', // default easing for AOS animations
    once: false, // whether animation should happen only once - while scrolling down
    mirror: false, // whether elements should animate out while scrolling past them // if you are using turbolinks
  });
});
