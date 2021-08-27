<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<script type="text/javascript" src="resources/assets/js/sockjs.js"></script>
<script
	src="http://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://www.highchar
	
	
	ts.com/samples/static/highslide.css">
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<style type="text/css">
.title_table {
	font-size: 18px;
	color: #666666;
	font-weight: bolder;
}

#row_card {
	height: 40%;
}
#tbody{
	height:420px;
}
#dataTable {
	margin-left: 30px;
	width: 27%;
 	height: 550px; 
	/* height:300px; */
}

.chart-container {
	width: 300px;
	height: 200px;
	float: left;
	background: #f8f9fc;
}

.highcharts-background {
	background: #f8f9fc;
}

#line_chart {
	width: 1200px;
	height: 200px;
}

#server_info {
	width: 400px;
}

#alarm_info {
	width: 400px;
}

#figure_graph {
	float: left;
	width: 1100px;
	/* height: 100px; */
}

#core0_text {
	font-size: 18px;
}

#core0_div {
	font-size: 30px;
}

#core1_text {
	font-size: 18px;
}

#core1_div {
	font-size: 30px;
}

#core2_text {
	font-size: 18px;
}

#core2_div {
	font-size: 30px;
}

#core3_text {
	font-size: 18px;
}

#core3_div {
	font-size: 30px;
}

#level {
	width: 80px;
}

#card_container {
	width: 70%;
	height: 10%;
}

#card_container1 {
	width: 70%;
	height: 10%;
	bottom: 290px;
}
</style>
<script type="text/javascript">
	var data1 = "";
	var sock = new SockJS('http://localhost:8080/handler');
	var coreNameArr = [];
	var coreArr = [];

	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	function onClose() {
		sock.close();
	}

	function onOpen() {
		console.log("client:connect");
		sock.send("hello, server!");

	};

	var receiveCount = 0;
	var i = -10;
	function onMessage(msg) {

		strdata = msg.data;
		list = JSON.parse(strdata);

		for (var i = 0; i < 4; i++) {

			if (list[i]['corename'] == "0") {
				coreNameArr[0] = list[i]['corename'];
				coreArr[0] = list[i]['coreusage'];
			} else if (list[i]['corename'] == "1") {
				coreNameArr[1] = list[i]['corename'];
				coreArr[1] = list[i]['coreusage'];
			} else if (list[i]['corename'] == "2") {
				coreNameArr[2] = list[i]['corename'];
				coreArr[2] = list[i]['coreusage'];
			} else if (list[i]['corename'] == "3") {
				coreNameArr[3] = list[i]['corename'];
				coreArr[3] = list[i]['coreusage'];
			}

		}

		/* $("#core0_div").text(coreArr[0]).style.fontSize="30px"; */
		$("#core0_div").text(coreArr[0])
		$("#core1_div").text(coreArr[1]);
		$("#core2_div").text(coreArr[2]);
		$("#core3_div").text(coreArr[3]);

		document.getElementById('core0_bar').style.width = coreArr[0] + '%';
		document.getElementById('core1_bar').style.width = coreArr[1] + "%";
		document.getElementById('core2_bar').style.width = coreArr[2] + '%';
		document.getElementById('core3_bar').style.width = coreArr[3] + '%';

		if (receiveCount == 0) {
			chartCpu = Highcharts
					.chart(
							'container-cpu',
							Highcharts
									.merge(
											gaugeOptions,
											{
												yAxis : {
													min : 0,
													max : 100,
													title : {
														style : {
															fontSize : '20px',
															'font-weight' : "bold"
														},
														text : 'CPU'

													}
												},

												credits : {
													enabled : false
												},

												series : [ {
													name : 'CPU',
													data : [ list[0]['cpuusage'] ],
													dataLabels : {
														format : '<div style="text-align:center">'
																+ '<span style="font-size:25px">{y}</span><br/>'
																+ '<span style="font-size:12px;opacity:0.4">%</span>'
																+ '</div>'
													},
													tooltip : {
														valueSuffix : '%'
													}
												} ]

											}));

			chartMem = Highcharts
					.chart(
							'container-mem',
							Highcharts
									.merge(
											gaugeOptions,
											{
												yAxis : {
													min : 0,
													max : 100,
													title : {
														style : {
															fontSize : '20px',
															'font-weight' : "bold"
														},
														text : 'Memory'
													}
												},
												credits : {
													enabled : false
												},

												series : [ {
													name : 'Mem',
													data : [ list[0]['memusage'] ],

													dataLabels : {
														format : '<div style="text-align:center">'
																+ '<span style="font-size:25px">{y}</span><br/>'
																+ '<span style="font-size:12px;opacity:0.4">%</span>'
																+ '</div>'
													},
													tooltip : {
														valueSuffix : '%'
													}
												} ]

											}));

			chartDisk = Highcharts
					.chart(
							'container-disk',
							Highcharts
									.merge(
											gaugeOptions,
											{
												yAxis : {
													min : 0,
													max : 100,
													title : {
														style : {
															fontSize : '20px',
															'font-weight' : "bold"
														},
														text : 'Disk'
													}
												},
												credits : {
													enabled : false
												},

												series : [ {
													name : 'Disk',

													data : [ list[0]['diskusage'] ],
													dataLabels : {
														format : '<div style="text-align:center">'
																+ '<span style="font-size:25px">{y:.1f}</span><br/>'
																+ '<span style="font-size:12px;opacity:0.4">'
																+ '%'
																+ '</span>'
																+ '</div>'
													},
													tooltip : {
														valueSuffix : ' %'
													}
												} ]

											}));

			var chartNw = Highcharts
					.chart(
							'container-nw',
							Highcharts
									.merge(
											gaugeOptions,
											{
												yAxis : {
													min : 0,
													max : 5000000000,
													title : {
														style : {
															fontSize : '20px',
															'font-weight' : "bold"
														},
														text : 'Network'
													}
												},
												credits : {
													enabled : false
												},

												series : [ {
													name : 'Network',
													data : [ list[0]['nwusage'] ],
													dataLabels : {
														format : '<div style="text-align:center">'
																+ '<span style="font-size:15px">{y:.1f}</span><br/>'
																+ '<span style="font-size:12px;opacity:0.4">'
																+ '%'
																+ '</span>'
																+ '</div>'
													},
													tooltip : {
														valueSuffix : '%'
													}
												} ]

											}));
		}
		;

		if (receiveCount == 0) {

			Highcharts
					.chart(
							'line_chart',
							{

								chart : {
									type : 'spline',
									animation : Highcharts.svg,
									marginRight : 10,
									events : {
										load : function() {
											var series = this.series[0];
											setInterval(
													function() {

														var x = (new Date())
																.getTime(), y = list[0]['cpuusage'];
														series.addPoint(
																[ x, y ], true,
																true);

													}, 1000);
										}
									}
								},

								time : {
									useUTC : false
								},

								title : {
									style : {
										fontSize : '20px',
										'font-weight' : "bold"
									},
									text : 'cpu usage'
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										minAnnounceInterval : 15000,
										announcementFormatter : function(
												allSeries, newSeries, newPoint) {
											if (newPoint) {
												return 'New point added. Value: '
														+ newPoint.y;
											}
											return false;
										}
									}
								},

								xAxis : {
									type : 'datetime',
									tickPixelInterval : 150
								},

								yAxis : {
									title : {
										text : 'Value'
									},
									plotLines : [ {
										value : 0,
										width : 1,
										color : '#808080'
									} ]
								},

								tooltip : {
									headerFormat : '<b>{series.name}</b><br/>',
									pointFormat : '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
								},

								legend : {
									enabled : false
								},

								exporting : {
									enabled : false
								},

								series : [ {
									name : 'cpu usage',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime();
										var count = 0;

										for (i = -10; i <= 0; i += 1) {
											data.push({
												x : time + i * 1000,
												y : list[0]['cpuusage']
											});

										}

										return data;
									}())
								} ]
							})
		}
		;

		receiveCount++;

	};
</script>

</head>
<body>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/data.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/highcharts-3d.js"></script>


	<!-- static charts -->
	<script
		src="https://www.highcharts.com/samples/static/highslide-full.min.js"></script>
	<script
		src="https://www.highcharts.com/samples/static/highslide.config.js"
		charset="utf-8"></script>


	<div class="container-fluid">

		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

		</div>
		<div class="row">
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div id="core0_text"
									class="text-xs font-weight-bold text-primary text-uppercase mb-1">
									Core0</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div id="core0_div"
											class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
									</div>
									<div class="col">
										<div class="progress progress-sm mr-2">
											<div id="core0_bar" class="progress-bar bg-info"
												role="progressbar" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div id="core1_text"
									class="text-xs font-weight-bold text-success text-uppercase mb-1">
									Core1</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div id="core1_div"
											class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
									</div>
									<div class="col">
										<div class="progress progress-sm mr-2">
											<div id="core1_bar" class="progress-bar bg-info"
												role="progressbar" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div id="core2_text"
									class="text-xs font-weight-bold text-info text-uppercase mb-1">Core
									2</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div id="core2_div"
											class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
									</div>
									<div class="col">
										<div class="progress progress-sm mr-2">
											<div id="core2_bar" class="progress-bar bg-info"
												role="progressbar" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<!-- Pending Requests Card Example -->

			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card border-left-warning shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div id="core3_text"
									class="text-xs font-weight-bold text-warning text-uppercase mb-1">Core
									3</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div id="core3_div"
											class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
									</div>
									<div class="col">
										<div class="progress progress-sm mr-2">
											<div id="core3_bar" class="progress-bar bg-info"
												role="progressbar" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="row_card">


			<div class="card shadow mb-4" id="card_container">
				<div class="card-body">
					<figure class="highcharts-figure">

						<div id="container-cpu" class="chart-container"></div>
						<div id="container-mem" class="chart-container"></div>
						<div id="container-disk" class="chart-container"></div>
						<div id="container-nw" class="chart-container"></div>
					</figure>
				</div>
			</div>
			<!-- 	<div class="card shadow mb-4" id="card_container">
					<div class="card-body">

						<figure class="highcharts_figure1" id="figure_graph1">
							<div id="line_chart" class="graph"></div>
						</figure>
					</div>
				</div> -->


			<div id="dataTable" class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">서버 정보</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" width="100%" cellspacing="0">

							<c:forEach items="${list}" var="result">
								<tbody id="tbody">
									<tr>
										<td class="title_table">IP</td>
										<td><c:out value="${result.ip}" /></td>

									</tr>
									<tr>
										<td class="title_table">Hostname</td>
										<td><c:out value="${result.hostname}" /></td>

									</tr>
									<tr>
										<td class="title_table">코어 갯수</td>
										<td><c:out value="${result.corenum}" /></td>

									</tr>
									<tr>
										<td class="title_table">하드웨어</td>
										<td><c:out value="${result.hw}" /></td>

									</tr>
									<tr>
										<td class="title_table">Osver</td>
										<td><c:out value="${result.osver}" /></td>

									</tr>
									<tr>
										<td class="title_table">버전</td>
										<td><c:out value="${result.version}" /></td>

									</tr>

								</tbody>
							</c:forEach>

						</table>
					</div>
				</div>
			</div>

			<div class="card shadow mb-4" id="card_container1">
				<div class="card-body">

					<figure class="highcharts_figure1" id="figure_graph1">
						<div id="line_chart" class="graph"></div>
					</figure>
				</div>
			</div>

			<!-- </div> -->
		</div>
	</div>
	<script type="text/javascript">
		var gaugeOptions = {
			chart : {
				type : 'solidgauge'
			},

			title : null,

			pane : {
				center : [ '50%', '85%' ],
				size : '140%',
				startAngle : -90,
				endAngle : 90,
				background : {
					backgroundColor : Highcharts.defaultOptions.legend.backgroundColor
							|| '#EEE',
					innerRadius : '60%',
					outerRadius : '100%',
					shape : 'arc'
				}
			},

			exporting : {
				enabled : false
			},

			tooltip : {
				enabled : false
			},

			// the value axis
			yAxis : {
				stops : [ [ 0.1, '#55BF3B' ], // green
				[ 0.5, '#DDDF0D' ], // yellow
				[ 0.9, '#DF5353' ] // red
				],
				lineWidth : 0,
				tickWidth : 0,
				minorTickInterval : null,
				tickAmount : 2,
				title : {
					y : -70
				},
				labels : {
					y : 16
				}
			},

			plotOptions : {
				solidgauge : {
					dataLabels : {
						y : 5,
						borderWidth : 0,
						useHTML : true
					}
				}
			}
		};

		setInterval(function() {
			var point;

			if (receiveCount > 0) {
				//cpu 사용량
				if (chartCpu) {
					point = chartCpu.series[0].points[0];
					point.update(list[0]['cpuusage']);

				}

				//메모리 사용량
				if (chartMem) {
					point = chartMem.series[0].points[0];
					point.update(list[0]['memusage']);
				}

				//디스크 사용량
				if (chartDisk) {
					point = chartDisk.series[0].points[0];
					point.update(list[0]['diskusage']);
				}

				/*    if (chartRpm) {
				       point = chartRpm.series[0].points[0];
				       var inc = Math.random() - 0.5;
				       var newVal = point.y + inc;

				       if (newVal < 0 || newVal > 5) {
				           newVal = point.y - inc;
				       }

				       point.update(newVal);
				   } */
			}

		}, 3000);
	</script>
</body>
</html>


