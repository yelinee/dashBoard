<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/assets/js/webix.js" type="text/javascript"></script>
<link rel="STYLESHEET" type="text/css"
	href="resources/assets/css/webix.css">
<script src="resources/assets/js/testdata.js"></script>
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
	href="https://www.highcharts.com/samples/static/highslide.css">
<meta charset="EUC-KR">
<style>
.data_layout {
	height: 100%;
	position: relative;
	padding-left: 30px;
	padding-ight: 30px;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 320px;
	max-width: 800px;
	margin: 1em auto;
}

#container {
	height: 400px;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}
</style>
<script type="text/javascript">
	var receiveCount = 0;
	var sock4 = new SockJS('http://localhost:8080/handler4');

	sock4.onopen = onOpen;
	sock4.onmessage = onMessage;
	sock4.onclose = onClose;
	function onClose() {
		sock4.close();
	}

	function onOpen() {
		//console.log("client:connect");
		sock4.send("hello, server4!");
		//alert("웹소켓4 연결");

	};
	function onMessage(msg) {
		strdata = msg.data;
		disklist = JSON.parse(strdata);

		if (receiveCount == 0) {
			Highcharts
					.chart(
							'chart_diskusage',
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(), // current time
												y = memlist[0]['diskusage']
												series.addPoint([ x, y ], true,
														true);
											}, 60000);
										}
									}
								},

								time : {
									useUTC : false
								},
								credits : {
									enabled : false
								},

								title : {
									text : ''
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										//minAnnounceInterval : 15000,
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
									max : 100,
									min : 0,
									title : {
										text : ''
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
									name : 'Disk Used(%)',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : disklist[0]['diskusage']
											});
										}

										return data;
									}())
								} ]
							});
			Highcharts
					.chart(
							'chart_disksize',
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(), // current time
												y = disklist[0]['disksize'];
												series.addPoint([ x, y ], true,
														true);
											}, 60000);
										}
									}
								},

								time : {
									useUTC : false
								},
								credits : {
									enabled : false
								},

								title : {
									text : ''
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										//minAnnounceInterval : 15000,
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
									max : 300000000,
									min : 0,

									title : {
										text : ''
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
									name : 'Disk Size',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;
										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : disklist[0]['disksize']
											});
										}

										return data;
									}())
								} ]
							});
			
			Highcharts
					.chart(
							'chart_diskused',
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(), // current time
												y = memlist[0]['diskused'];
												series.addPoint([ x, y ], true,
														true);
											}, 60000);
										}
									}
								},

								time : {
									useUTC : false
								},
								credits : {
									enabled : false
								},

								title : {
									text : ''
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										//minAnnounceInterval : 15000,
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
									max : 300000000,
									min : 0,
									title : {
										text : ''
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
									name : 'Disk Used',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : disklist[0]['diskused']
											});
										}

										return data;
									}())
								} ]
							});
			Highcharts
					.chart(
							'chart_diskio',
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(), // current time
												y = disklist[0]['diskio'];
												series.addPoint([ x, y ], true,
														true);
											}, 60000);
										}
									}
								},

								time : {
									useUTC : false
								},
								credits : {
									enabled : false
								},

								title : {
									text : ''
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										//minAnnounceInterval : 15000,
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
									max : 10000,
									min : 0,
									title : {
										text : ''
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
									name : 'Disk I/O',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : disklist[0]['diskio']
											});
										}

										return data;
									}())
								} ]
							});
			Highcharts
					.chart(
							'chart_diskread',
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(), // current time
												y = disklist[0]['diskread'];
												series.addPoint([ x, y ], true,
														true);
											}, 60000);
										}
									}
								},

								time : {
									useUTC : false
								},
								credits : {
									enabled : false
								},

								title : {
									text : ''
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										//minAnnounceInterval : 15000,
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
									max : 10000,
									min : 0,
									title : {
										text : ''
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
									name : 'Disk Read Bps',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : disklist[0]['diskread']
											});
										}

										return data;
									}())
								} ]
							});
			Highcharts
					.chart(
							'chart_diskwrite',
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(), // current time
												y = disklist[0]['diskwrite'];
												series.addPoint([ x, y ], true,
														true);
											}, 60000);
										}
									}
								},

								time : {
									useUTC : false
								},
								credits : {
									enabled : false
								},

								title : {
									text : ''
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										//minAnnounceInterval : 15000,
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
									max : 10000,
									min : 0,
									title : {
										text : ''
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
									name : 'Disk Write Bps',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : disklist[0]['diskwrite']
											});
										}

										return data;
									}())
								} ]
							});
			Highcharts
					.chart(
							'chart_disktime',
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(), // current time
												y = disklist[0]['disktime'];
												series.addPoint([ x, y ], true,
														true);
											}, 60000);
										}
									}
								},

								time : {
									useUTC : false
								},
								credits : {
									enabled : false
								},

								title : {
									text : ''
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										//minAnnounceInterval : 15000,
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
									max : 100,
									min : 0,
									title : {
										text : ''
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
									name : 'Disk Time',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : disklist[0]['disktime']
											});
										}

										return data;
									}())
								} ]
							});
			Highcharts
					.chart(
							'chart_diskwait',
							{
								chart : {
									type : 'spline',
									animation : Highcharts.svg, // don't animate in old IE
									marginRight : 10,
									events : {
										load : function() {

											// set up the updating of the chart each second
											var series = this.series[0];
											setInterval(function() {
												var x = (new Date()).getTime(), // current time
												y = disklist[0]['diskwait'];
												series.addPoint([ x, y ], true,
														true);
											}, 60000);
										}
									}
								},

								time : {
									useUTC : false
								},
								credits : {
									enabled : false
								},

								title : {
									text : ''
								},

								accessibility : {
									announceNewData : {
										enabled : true,
										//minAnnounceInterval : 15000,
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
									max : 100,
									min : 0,
									title : {
										text : ''
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
									name : 'Disk Wait',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : disklist[0]['diskwait']
											});
										}

										return data;
									}())
								} ]
							});

		}
		receiveCount++;
	}
</script>
</head>
<body>

	<div class="data_layout">

		<div class="row">
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Disk Used(%)</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_diskusage"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Disk Size</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_disksize"></div>

					</div>
				</div>
			</div>
			
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Disk Used</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_diskused"></div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Disk I/O</h6>
					</div>
					<div class="card-body">
						<div id="chart_diskio"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
				
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Disk Read Bps</h6>
					</div>
				
					<div class="card-body">
						<div id="chart_diskread"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
				
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Disk Write Bps
						</h6>
					</div>
			
					<div class="card-body">
						<div id="chart_diskwrite"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Disk Time</h6>
					</div>
				
					<div class="card-body">
						<div id="chart_disktime"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Disk Wait</h6>
					</div>
				
					<div class="card-body">
						<div id="chart_diskwait"></div>

					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>