import AOS from 'aos';
import 'aos/dist/aos.css';

$(function() {
    AOS.init({
    disable: false,
    delay: 0, // values from 0 to 3000, with step 50ms
    duration: 400, // values from 0 to 3000, with step 50ms
    easing: 'ease', // default easing for AOS animations
    once: false, // whether animation should happen only once - while scrolling down
    mirror: false, // whether elements should animate out while scrolling past them // if you are using turbolinks
  });
});

document.addEventListener("turbolinks:load", function() {
  AOS.refreshHard()
});
