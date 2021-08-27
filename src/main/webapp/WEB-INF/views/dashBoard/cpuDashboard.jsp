<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.project3.User.dto.UserDTO"%>
<%@ page import="kr.co.project3.pages.alarm.controller.alarmController"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/assets/js/sockjs.js"></script>
<script
	src="http://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/react@16.12/umd/react.production.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/react-dom@16.12/umd/react-dom.production.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/prop-types@15.7.2/prop-types.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script
	src="https://cdn.jsdelivr.net/npm/react-apexcharts@1.3.6/dist/react-apexcharts.iife.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.0.min.js"></script>

<meta charset="UTF-8">

<style>
 .data_layout {
	height: 100%;
	position: relative;
	padding-right: 30px;
	padding-left: 30px;
}

</style>

<script type="text/javascript">
	
<%String id = "";
UserDTO dto = (UserDTO) session.getAttribute("dto_info");
if (alarmController.empty(dto) != null) {
	id = dto.getId();
}%>

var id= '<%=id%>'
	var data1 = "";
	var sock2 = new SockJS('http://localhost:8080/handler2');
	var cpulist

	sock2.onopen = onOpen;
	sock2.onmessage = onMessage;
	sock2.onclose = onClose;
	function onClose() {
		sock2.close();
	}

	function onOpen() {
		console.log("client:connect");
		sock2.send("hello, server2!");

	};
	function onMessage(msg) {
		strdata = msg.data;
		cpulist = JSON.parse(strdata);

		//getChart(cpulist[0]['cpuusage']);

		var option_cpu = {
			series : [ cpulist[0]['cpuusage'] ],
			chart : {
				height : 350,
				type : 'radialBar',

			},
			plotOptions : {
				radialBar : {
					hollow : {
						size : '70%',
					}
				},
			},
			labels : [ 'CPU Usage' ],
		};

		var chart_usage = new ApexCharts(
				document.querySelector("#chart_usage"), option_cpu);
		chart_usage.render();

		var option_cpuuser = {
			series : [ cpulist[0]['cpuuser'] ],
			chart : {
				height : 350,
				type : 'radialBar',

			},
			plotOptions : {
				radialBar : {
					hollow : {
						size : '70%',
					}
				},
			},
			labels : [ 'CPU User' ],
		};

		var chart_user = new ApexCharts(document.querySelector("#chart_user"),
				option_cpuuser);
		chart_user.render();

		var option_cpusys = {
			series : [ cpulist[0]['cpusys'] ],
			chart : {
				height : 350,
				type : 'radialBar',

			},
			plotOptions : {
				radialBar : {
					hollow : {
						size : '70%',
					}
				},
			},
			labels : [ 'CPU SYS' ],
		};
		var chart_sys = new ApexCharts(document.querySelector("#chart_sys"),
				option_cpusys);
		chart_sys.render();
		
		var option_cpunice = {
				series : [ cpulist[0]['cpunice'] ],
				chart : {
					height : 350,
					type : 'radialBar',

				},
				plotOptions : {
					radialBar : {
						hollow : {
							size : '70%',
						}
					},
				},
				labels : [ 'CPU NICE' ],
			};
		var chart_nice = new ApexCharts(document.querySelector("#chart_nice"),
				option_cpunice);
		chart_nice.render();
		
		var option_cpuidle = {
				series : [ cpulist[0]['cpuidle'] ],
				chart : {
					height : 350,
					type : 'radialBar',

				},
				plotOptions : {
					radialBar : {
						hollow : {
							size : '70%',
						}
					},
				},
				labels : [ 'CPU IDLE' ],
			};
		

		var chart_idle = new ApexCharts(document.querySelector("#chart_idle"),
				option_cpuidle);
		chart_idle.render();
		
		var option_cpuiowait = {
				series : [ cpulist[0]['cpuiowait'] ],
				chart : {
					height : 350,
					type : 'radialBar',

				},
				plotOptions : {
					radialBar : {
						hollow : {
							size : '70%',
						}
					},
				},
				labels : [ 'CPU I/O Wait' ],
			};
		
		var chart_iowait = new ApexCharts(document
				.querySelector("#chart_iowait"), option_cpuiowait);
		chart_iowait.render();
		
		var option_cpusteal = {
				series : [ cpulist[0]['cpusteal'] ],
				chart : {
					height : 350,
					type : 'radialBar',

				},
				plotOptions : {
					radialBar : {
						hollow : {
							size : '70%',
						}
					},
				},
				labels : [ 'CPU Steal' ],
			};
		var chart_steal = new ApexCharts(
				document.querySelector("#chart_steal"), option_cpusteal);
		chart_steal.render();
		
		
		

		
		
		
		
	};
	
	
</script>
</head>
<body>

	<div class="data_layout" id="data_layout">

		<div class="row">

			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Cpu 사용량</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_usage"></div>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">CPU User 사용률</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_user"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">CPU System 사용률</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_sys"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">CPU Nice 사용률</h6>
					</div>
				
					<div class="card-body">
						<div id="chart_nice"></div>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">CPU IDLE</h6>
					</div>
				
					<div class="card-body">
						<div id="chart_idle"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">CPU I/O Wait</h6>
					</div>
					
					<div class="card-body">

						<div id="chart_iowait"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">CPU Steal 사용률</h6>
					</div>
					
					<div class="card-body">

						<div id="chart_steal"></div>
					</div>
				</div>
			</div>

		</div>


	</div>
<!-- 
	<script>
		var chart_usage = new ApexCharts(
				document.querySelector("#chart_usage"), option_cpu);
		chart_usage.render();

		var chart_user = new ApexCharts(document.querySelector("#chart_user"),
				options);
		chart_user.render();
		var chart_sys = new ApexCharts(document.querySelector("#chart_sys"),
				options);
		chart_sys.render();
		var chart_nice = new ApexCharts(document.querySelector("#chart_nice"),
				options);
		chart_nice.render();

		var chart_idle = new ApexCharts(document.querySelector("#chart_idle"),
				options);
		chart_idle.render();

		var chart_iowait = new ApexCharts(document
				.querySelector("#chart_iowait"), options);
		chart_iowait.render();

		var chart_steal = new ApexCharts(
				document.querySelector("#chart_steal"), options);
		chart_steal.render();
	</script>
 -->


</body>
</html>