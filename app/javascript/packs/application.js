import "bootstrap";
import 'chart.js';
// import 'jquery-ui';

// $(document).on('ready',function(){
//     $('.progress .progress-bar').css("width",function() {
//       return $(this).attr("aria-valuenow") + "%";
//     })
//   })

const chart = () => {
  var canvas = document.getElementById('myChart');
  var dataChart = JSON.parse(canvas.dataset.data);
  var chartLabels = JSON.parse(canvas.dataset.labels);
  Chart.defaults.global.defaultFontFamily = 'Roboto';
  Chart.defaults.global.legend = false;
  Chart.defaults.global.defaultFontSize = 16;
  var ctx = canvas.getContext('2d');
  var chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'bar',

      // The data for our dataset
      data: {
          labels: chartLabels,
          datasets: [{
              label: "",
              backgroundColor: 'rgba(39,174,96,0.9)',
              borderColor: 'rgb(39,174,96)',
              data: dataChart,
          }]
      },
      // Configuration options go here
      options: {
        scales: {
            xAxes: [{
                ticks: {
                  display: false //this will remove only the label
                },
                gridLines: {
                      // color: "rgba(0, 0, 0, 0)",
                }
            }],
            yAxes: [{
                gridLines: {
                  // color: "rgba(0, 0, 0, 0)",
                }
            }]
        }
      }
  });
}
window.onload = chart();


$(document).ready(function(){
  $(".buttton-image").click(function(){
    $(this).toggleClass("activated");
  });
  // Toggle see-more/see-less for histroy in user show
  $('.user-history').toggleClass("history-see-less", 1000);
  if ($('.user-history').hasClass('history-see-less')) {
          $("#see-more").text("Voir plus...");
      } else {
          $("#see-more").text(("Voir moins..."));
      }
});


// const btnHistorySeeMore.querySelector('#see-more');
// const toggleHistory = (event) => {
//   btnHistorySeeMore.classList.toggleClass('history-see-less')
//   btnHistorySeeMore.innerHTML = 'Voir moins...'
// };

// const listenToHistroyToggle = () => {
//   btnHistorySeeMore.addEventListener('click', toggleHistory);
// };

// listenToHistroyToggle();
