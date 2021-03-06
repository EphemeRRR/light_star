const chart = () => {
  var canvas = document.getElementById('myChart');
  if (canvas) {
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
                  ticks: {
                    beginAtZero: true
                  },
                  gridLines: {
                    // color: "rgba(0, 0, 0, 0)",
                  }
              }]
          }
        }
    });
  }
}

export { chart };
