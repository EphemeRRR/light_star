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
  var ctx = canvas.getContext('2d');
  var chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'radar',

      // The data for our dataset
      data: {
          labels: ["Categories", "Physiques, Chimies & Technologies",
           "Terre & Univers", "Les Vivants", "Sports & Santés",
            "Cultures & Sociétés", "Langues & Languages",
            "Mathématiques", "Histoires", "Techniques"],
          datasets: [{
              label: "Your favorite categories",
              backgroundColor: 'rgb(255, 99, 132)',
              borderColor: 'rgb(255, 99, 132)',
              data: [0, 20, 10, 5, 2, 20, 30, 45, 15, 10],
          }]
      },

      // Configuration options go here
      options: {}
  });
}
window.onload = chart();
