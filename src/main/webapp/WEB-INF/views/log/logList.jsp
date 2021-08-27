<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Custom styles for this page -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<style>

/* Default */
input[type=text], input[type=password] {
	font-family: "Malgun Gothic", "맑은 고딕", Dotum, "돋움", Arial, sans-serif;
}

* {
	margin: 0;
	padding: 0;
	font-family: "Malgun Gothic", "맑은 고딕", Dotum, "돋움", Arial, sans-serif;
}

body {
	font-size: 12px;
	color: #555;
	background: transparent;
	-webkit-user-select: none;
	-moz-user-select: none;
	-webkit-text-size-adjust: none;
	-moz-text-size-adjust: none;
	-ms-text-size-adjust: none;
}

ol, ul {
	list-style: none;
}

table {
	table-layout: fixed;
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

caption {
	overflow: hidden;
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	text-indent: -999em;
}

img, fieldset {
	border: 0;
}

legend {
	height: 0;
	visibility: hidden;
}

em, address {
	font-style: normal;
}

img {
	border: 0 none;
	vertical-align: middle;
}

a {
	color: #555;
	text-decoration: none;
}

input, select {
	margin: 0;
	padding: 0;
	vertical-align: middle;
}

button {
	margin: 0;
	padding: 0;
	font-family: inherit;
	border: 0 none;
	background: transparent;
	cursor: pointer;
}

button::-moz-focus-inner {
	border: 0;
	padding: 0;
}

header, footer, aside, nav, section, article {
	display: block;
}

.clearfix {
	*zoom: 1;
}

.clearfix:after {
	content: "";
	display: block;
	clear: both;
	overflow: hidden;
}

/* Search */
.searchBox {
	border: none;
}

.searchBox tbody th {
	padding: 20px 10px 20px 35px;
	font-size: 14px;
	font-weight: bold;
	text-align: left;
	vertical-align: top;
	border: 4px;;
	background: #E6E6E6;
}

.searchBox tbody td {
	padding: 12px 10px 12px 25px;
	border: 4px;
	background-color: #F2F2F2;
}

.searchDate {
	overflow: hidden;
	margin-bottom: 10px;
	*zoom: 1;
}

.searchDate:after {
	display: block;
	clear: both;
	content: '';
}

.searchDate li {
	position: relative;
	float: left;
	margin: 0 7px 0 0;
	margin-right:
}

.searchDate li .chkbox2 {
	display: block;
	text-align: center;
}

.searchDate li .chkbox2 input {
	position: absolute;
	z-index: -1;
}

.searchDate li .chkbox2 label {
	border-radius: 6px;
	display: block;
	width: 72px;
	height: 26px;
	font-size: 14px;
	font-weight: bold;
	color: #fff;
	text-align: center;
	line-height: 25px;
	text-decoration: none;
	cursor: pointer;
	background: #a5b0b6;
	display: block;
}

.searchDate li .chkbox2.on label {
	background: #ec6a6a;
}

.demi {
	display: inline-block;
	margin: 0 1px;
	vertical-align: middle;
}

.inpType {
	padding-left: 6px;
	height: 24px;
	line-height: 24px;
	border: 1px solid #dbdbdb;
}

.btncalendar {
	display: inline-block;
	width: 22px;
	height: 22px;
	background: url(images/btn_calendar.gif) center center no-repeat;
	text-indent: -999em;
}

#card {
	left: 20px;
	margin-left: 20px;
	width: 95%;
}

#number {
	background-color: #4a5a96;
	font-weight: 900;
	color: white;
	width: 45px;
	text-align: center;
}

#deviceTime {
	background-color: #4a5a96;
	font-weight: 900;
	color: white;
	text-align: center;
	width: 160px;
}

#recieveTime {
	background-color: #4a5a96;
	font-weight: 900;
	color: white;
	text-align: center;
	width: 160px;
}

#logLevel {
	background-color: #4a5a96;
	font-weight: 900;
	color: white;
	text-align: center;
	width: 85px;
}

#type {
	background-color: #4a5a96;
	font-weight: 900;
	color: white;
	text-align: center;
	width: 95px;
}

#pName {
	background-color: #4a5a96;
	font-weight: 900;
	color: white;
	text-align: center;
	width: 105px;
}

#message {
	background-color: #4a5a96;
	font-weight: 900;
	color: white;
	text-align: center;
	width: 300px;
}

td {
	text-align: center;
}

#num {
	color: white;
	font-weight: bolder;
	background-color: #b5c0dd;
}

#messageRe {
	text-align: left;
}

.th {
	height: 15px;
}

img {
	margin-bottom: 9px;
	width: 20px;
	height: 20px;
	width: 20px;
}

.col-sm-12 col-md-7 {
	position: relative;
	align: center;
}

.page-item.active .page-link {
	border-color: white;
}

.page-link {
	bottom: 5px;
	height: 35px;
	border-color: white;
}

.pagination {
	right: 50px;
}

#page_num {
	background-color: #4a5a96;
}
</style>



<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="card shadow mb-4" id="card">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">로그 목록</h6>
		</div>



		<div class="card-body">

			<form action="list_date" method="post">
				<table class="searchBox">
					<caption>조회</caption>
					<colgroup>
						<col width="123px">
						<col width="*">
					</colgroup>

					<tbody>

						<tr>
							<th>조회기간</th>
							<td>
								<ul class="searchDate">
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType1" onclick="setSearchDate('0d')" />
											<label for="dateType1">당일</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType2" onclick="setSearchDate('3d')" />
											<label for="dateType2">3일</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType3" onclick="setSearchDate('1w')" />
											<label for="dateType3">1주</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType4" onclick="setSearchDate('2w')" />
											<label for="dateType4">2주</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType5" onclick="setSearchDate('1m')" />
											<label for="dateType5">1개월</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType6" onclick="setSearchDate('3m')" />
											<label for="dateType6">3개월</label>
									</span></li>
									<li><span class="chkbox2"> <input type="radio"
											name="dateType" id="dateType7" onclick="setSearchDate('6m')" />
											<label for="dateType7">6개월</label>
									</span></li>
								</ul>

								<div class="clearfix">
									<!-- 시작일 -->
									<span class="dset"> <input type="date"
										class="datepicker inpType" name="from" id="from"
										id="searchStartDate"> <a href="#none"
										class="btncalendar dateclick">달력</a>
									</span> <span class="demi">~</span>
									<!-- 종료일 -->
									<span class="dset"> <input type="date"
										class="datepicker inpType" name="to" id="to"> <a
										href="#none" class="btncalendar dateclick">달력</a>
									</span> <input type="submit" class="btn btn-primary" value="조회" />

								</div>
							</td>
						</tr>
					<tbody>
				</table>
			</form>

			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th id="number">NO</th>
							<th id="deviceTime">보낸 시간</th>
							<th id="recieveTime">받은 시간</th>
							<th id="logLevel">로그 레벨</th>
							<th id="type">이벤트 타입</th>
							<th id="pName">프로그램 이름</th>
							<th id="message">로그 메세지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${LogList}" var="result">
							<c:set var="num" value="${num+1}" />
							<tr>
								<td class="th" id="num"><c:out value="${num}" /></td>
								<td class="th"><c:out value="${result.deviceTime}" /></td>
								<td class="th"><c:out value="${result.receivedAt}" /></td>
								<td class="th"><c:out value="${result.priority}" /></td>
								<td class="th"><c:out value="${result.facility}" /></td>
								<td class="th"><c:out value="${result.programname}" /></td>
								<td class="th" id="messageRe"><c:out
										value="${result.message}" /></td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
			</div>
			<div class="col-sm-12 col-md-7">
				<div class="dataTables_paginate paging_simple_numbers">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">

							<li class="paginate_button page-item previous"
								id="dataTable_previous"><a
								href='<c:url value="logList?page=${pageMaker.startPage-1 }"/>'><i
									class="page-link"> <img
										src="resources/assets/img/arrow_left_icon.png"></i></a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage }" var="pageNum">
							<li class="paginate_button page-item active"><a
								class="page-link" id="page_num"
								href='<c:url value="logList?page=${pageNum}"/>'><i
									class="fa">${pageNum}</i></a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							<li class="paginate_button page-item next" id="dataTable_next">

								<a href='<c:url value="logList?page=${pageMaker.endPage+1 }"/>'><i
									class="page-link"> <img
										src="resources/assets/img/arrow_right_icon_133719.png">
								</i></a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>


		</div>
	</div>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- datepicker 한국어로 -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	<script>
		$(document).ready(
				function() {

					//datepicker 한국어로 사용하기 위한 언어설정
					$.datepicker.setDefaults($.datepicker.regional['ko']);

					// Datepicker			
					$(".datepicker").datepicker(
							{
								showButtonPanel : true,
								dateFormat : "yy-mm-dd",
								onClose : function(selectedDate) {

									var eleId = $(this).attr("id");
									var optionName = "";

									if (eleId.indexOf("StartDate") > 0) {
										eleId = eleId.replace("StartDate",
												"EndDate");
										optionName = "minDate";
									} else {
										eleId = eleId.replace("EndDate",
												"StartDate");
										optionName = "maxDate";
									}

									$("#" + eleId).datepicker("option",
											optionName, selectedDate);
									$(".searchDate").find(".chkbox2")
											.removeClass("on");
								}
							});

					//시작일.
					$('#searchStartDate').datepicker(
							"option",
							"onClose",
							function(selectedDate) {
								// 시작일 datepicker가 닫힐때
								// 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
								$("#searchEndDate").datepicker("option",
										"minDate", selectedDate);
								$(".searchDate").find(".chkbox2").removeClass(
										"on");
							});

					//종료일.
					$('#searchEndDate').datepicker(
							"option",
							"onClose",
							function(selectedDate) {
								// 종료일 datepicker가 닫힐때
								// 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
								$("#searchStartDate").datepicker("option",
										"maxDate", selectedDate);
								$(".searchDate").find(".chkbox2").removeClass(
										"on");
							});

					$(".dateclick").dateclick(); // DateClick
					$(".searchDate").schDate(); // searchDate

				});

		// Search Date
		jQuery.fn.schDate = function() {
			var $obj = $(this);
			var $chk = $obj.find("input[type=radio]");
			$chk.click(function() {
				$('input:not(:checked)').parent(".chkbox2").removeClass("on");
				$('input:checked').parent(".chkbox2").addClass("on");
			});
		};

		// DateClick
		jQuery.fn.dateclick = function() {
			var $obj = $(this);
			$obj.click(function() {
				$(this).parent().find("input").focus();
			});
		}

		function setSearchDate(start) {

			var num = start.substring(0, 1);
			var str = start.substring(1, 2);

			var today = new Date();

			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var day = today.getDate();

			var endDate = $.datepicker.formatDate('yy-mm-dd', today);
			$('#searchEndDate').val(endDate);

			if (str == 'd') {
				today.setDate(today.getDate() - num);
			} else if (str == 'w') {
				today.setDate(today.getDate() - (num * 7));
			} else if (str == 'm') {
				today.setMonth(today.getMonth() - num);
				today.setDate(today.getDate() + 1);
			}

			var startDate = $.datepicker.formatDate('yy-mm-dd', today);
			$('#searchStartDate').val(startDate);

			// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
			$("#searchEndDate").datepicker("option", "minDate", startDate);

			// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
			$("#searchStartDate").datepicker("option", "maxDate", endDate);

		}
	</script>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
</body>

</body>
</html>