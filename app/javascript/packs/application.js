import "bootstrap";
import { videoToolsTabs } from "../video_tools_tabs/video_tools_tabs.js";
import { chart } from "../chart/show_chart.js";
import 'chart.js';
import 'popper.js';
// import 'jquery-ui';

// $(document).on('ready',function(){
//     $('.progress .progress-bar').css("width",function() {
//       return $(this).attr("aria-valuenow") + "%";
//     })
//   })
chart();
videoToolsTabs();

$(document).ready(function(){
  $(".buttton-image").click(function(){
    $(this).toggleClass("activated");
  });
  // Toggle see-more/see-less for histroy in user show
  // $('.user-history').toggleClass("history-see-less", 1000);
  // if ($('.user-history').hasClass('history-see-less')) {
  //         $("#see-more").text("Voir plus...");
  //     } else {
  //         $("#see-more").text(("Voir moins..."));
  //     }
});



// window.onload = chart();



// const btnHistorySeeMore.querySelector('#see-more');
// const toggleHistory = (event) => {
//   btnHistorySeeMore.classList.toggleClass('history-see-less')
//   btnHistorySeeMore.innerHTML = 'Voir moins...'
// };

// const listenToHistroyToggle = () => {
//   btnHistorySeeMore.addEventListener('click', toggleHistory);
// };

// listenToHistroyToggle();
