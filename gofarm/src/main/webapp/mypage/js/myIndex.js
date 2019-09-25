$(document).ready(function() {
	$('mileageViewDiv').on('click', function() {
		location.href='mileage.do';
	});
	
	
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';

	var ctx = document.getElementById("myAreaChart");
	//var alldata = JSON.stringify("${alldata}");
	var dto = JSON.parse('${alldata}');
	console.log(dto.length);
	var mileageArr = new Array();
	var dayArr = new Array();
	for (var i = 0; i < dto.length; i++) {
		//console.log(dto[i].m_total);
		mileageArr[i] = dto[i].m_total;
		dayArr[i] = dto[i].m_day;
		//console.log(mileageArr[i]);
	}
	var strarr = ["1", "1", "1", "1", "1" ];
	var numarr = [1,2,3,4,5];
	//console.log(labeldata);
	var myLineChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: dayArr,
	    datasets: [{
	      label: "Sessions",
	      lineTension: 0.3,
	      backgroundColor: "rgba(2,117,216,0.2)",
	      borderColor: "rgba(2,117,216,1)",
	      pointRadius: 5,
	      pointBackgroundColor: "rgba(2,117,216,1)",
	      pointBorderColor: "rgba(255,255,255,0.8)",
	      pointHoverRadius: 5,
	      pointHoverBackgroundColor: "rgba(2,117,216,1)",
	      pointHitRadius: 50,
	      pointBorderWidth: 2,
	      data: mileageArr,
	    }],
	  },
	  options: {
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false
	        },
	        ticks: {
	          maxTicksLimit: 7
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          max: 1000000,
	          maxTicksLimit: 5
	        },
	        gridLines: {
	          color: "rgba(0, 0, 0, .125)",
	        }
	      }],
	    },
	    legend: {
	      display: false
	    }
	  }
	});
});