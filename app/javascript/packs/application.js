import "bootstrap";
import 'chart.js';

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
        legend: {
          labels: {
            // This more specific font property overrides the global property
            defaultFontSize: 0;
          }
        }
      }
  });
}
window.onload = chart();


$(document).ready(function(){
  $(".buttton-image").click(function(){
    $(this).toggleClass("activated");
  });
});
