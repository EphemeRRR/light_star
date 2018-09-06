import "bootstrap";
import { videoToolsTabs } from "../video_tools_tabs/video_tools_tabs.js";
import 'chart.js';
import { chart } from "../chart/show_chart.js";
import 'popper.js';
// import 'jquery-ui';

videoToolsTabs();
chart();


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


