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
	padding-right: 30px;
	padding-left: 30px;
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
	var sock3 = new SockJS('http://localhost:8080/handler3');

	sock3.onopen = onOpen;
	sock3.onmessage = onMessage;
	sock3.onclose = onClose;
	function onClose() {
		sock3.close();
	}

	function onOpen() {
		//console.log("client:connect");
		sock3.send("hello, server3!");
		//alert("웹소켓3 연결");

	};
	function onMessage(msg) {
		strdata = msg.data;
		memlist = JSON.parse(strdata);
		if (receiveCount == 0) {

			Highcharts
					.chart(
							'chart_memnominal',
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
												y = memlist[0]['memnominal']
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
									name : 'Random data',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['memnominal']
											});
										}

										return data;
									}())
								} ]
							});

			Highcharts
					.chart(
							'chart_memactual',
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
												y = memlist[0]['memactual']
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
									name : 'Random data',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['memactual']
											});
										}
										return data;
									}())
								} ]
							});

			Highcharts
					.chart(
							'chart_swapusage',
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
												y = memlist[0]['swapusage'];
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
									name : 'Random data',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['swapusage']
											});
										}
										return data;
									}())
								} ]
							});

			Highcharts
					.chart(
							'chart_memfree',
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
												y = memlist[0]['memfree']
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
									max : 30000000,
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
									name : 'Random data',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['memfree']
											});
										}
										return data;
									}())
								} ]
							});

			Highcharts
					.chart(
							'chart_memshared',
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
												y = memlist[0]['memshared'];
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
									max : 30000000,
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
									name : 'Memory Shared',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['memshared']
											});
										}
										return data;
									}())
								} ]
							});

			Highcharts
					.chart(
							'chart_membuff',
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
												y = memlist[0]['membuff']
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
									max : 30000000,
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
									name : 'Memory Buffers',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['membuff']
											});
										}
										return data;
									}())
								} ]
							});

			Highcharts
					.chart(
							'chart_memable',
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
												y = memlist[0]['memable'];
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
									max : 30000000,
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
									name : 'Memory Available',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['memable']
											});
										}
										return data;
									}())
								} ]
							});
			Highcharts
			.chart(
					'chart_memtotal',
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
										y = memlist[0]['memtotal'];
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
							max : 30000000,
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
							name : 'Memory Available',
							data : (function() {
								// generate an array of random data
								var data = [], time = (new Date())
										.getTime(), i;

								for (i = -3; i <= 0; i += 1) {
									data.push({
										x : time + i * 60000,
										y : memlist[0]['memtotal']
									});
								}
								return data;
							}())
						} ]
					});

			Highcharts
			.chart(
					'chart_memused',
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
										y = memlist[0]['memused'];
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
							max : 30000000,
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
							name : 'Memory Available',
							data : (function() {
								// generate an array of random data
								var data = [], time = (new Date())
										.getTime(), i;

								for (i = -3; i <= 0; i += 1) {
									data.push({
										x : time + i * 60000,
										y : memlist[0]['memused']
									});
								}
								return data;
							}())
						} ]
					});


			Highcharts
					.chart(
							'chart_swaptotal',
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
												y = memlist[0]['swaptotal'];
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
									max : 30000000,
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
									name : 'Memory Swap Total',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['swaptotal']
											});
										}
										return data;
									}())
								} ]
							});
			Highcharts
					.chart(
							'chart_swapused',
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
												y = memlist[0]['swapused']
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
									max : 30000000,
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
									name : 'Memory Swap Used',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['swapused']
											});
										}
										return data;
									}())
								} ]
							});

			Highcharts
					.chart(
							'chart_swapfree',
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
												y = memlist[0]['swapfree']
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
									max : 30000000,
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
									name : 'Memory Swap Free',
									data : (function() {
										// generate an array of random data
										var data = [], time = (new Date())
												.getTime(), i;

										for (i = -3; i <= 0; i += 1) {
											data.push({
												x : time + i * 60000,
												y : memlist[0]['swapfree']
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
						<h6 class="m-0 font-weight-bold text-primary">Nominal Memory
							Used</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_memnominal"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Actual Memory
							Used</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_memactual"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory Swap
							Used(%)</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_swapusage"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory Free</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_memfree"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory Shared</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_memshared"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory Buffers
						</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_membuff"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory
							Available</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_memable"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory
							Total</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_memtotal"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory Used
							</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_memused"></div>

					</div>
				</div>
			</div>

		</div>


		<div class="row">
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory Swap
							Free</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_swapfree"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory Swap
							Total</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_swaptotal"></div>

					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Memory Swap
							Used</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="chart_swapused"></div>
					</div>
				</div>
			</div>
		</div>




	</div>
	<script type="text/javascript">
		
	</script>

</body>
</html>