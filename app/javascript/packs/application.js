import "bootstrap";
import 'chart.js';

// $(document).on('ready',function(){
//     $('.progress .progress-bar').css("width",function() {
//       return $(this).attr("aria-valuenow") + "%";
//     })
//   })

$(".progress-bar").animate({
    width: "70%"
}, 1500);

const chart = () => {
  var canvas = document.getElementById('myChart');
  var dataChart = JSON.parse(canvas.dataset.data);
  // Chart.defaults.global.defaultFontColor = 'red';
  var ctx = canvas.getContext('2d');
  var chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'radar',

      // The data for our dataset
      data: {
          labels: ["Physiques, Chimies & Technologies",
           "Terre & Univers", "Les Vivants", "Sports & Santés",
            "Cultures & Sociétés", "Langues & Languages",
            "Mathématiques", "Histoires", "Techniques"],
          datasets: [{
              label: "",
              backgroundColor: 'rgba(39,174,96,0.3)',
              borderColor: 'rgb(39,174,96)',
              data: dataChart,
          }]
      },

      // Configuration options go here
      options: {
        scale: {
          pointLabels: {
            fontSize: 20
          }
        }
      }
  });
}
window.onload = chart();
