<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>알림 설정</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script>
	var check = $("input[type='checkbox']");
	check.click(function() {
		$("p").toggle();
	});
</script>





<style>
.block {
	width: 100%;
	height: 20px;
}

.settingBtn {
	background-position: center;
	position: absolute;
	z-index: 5;
	width: 45px;
	height: 35px;
	left: 48rem;
	border-radius: 4px;
	background: #185EE3;
	background-color: #185EE3;
	position: relative;
	border: none;
	cursor: pointer;
	transition: 0.5s;
	font-size: 18px;
	font-weight: 400;
	text-align: center;
	color: #ffffff;
}

.settingBtn1 {
	background-position: center;
	position: absolute;
	z-index: 5;
	width: 160px;
	height: 35px;
	left: 48rem;
	border-radius: 4px;
	background: #185EE3;
	background-color: #185EE3;
	position: relative;
	border: none;
	cursor: pointer;
	transition: 0.5s;
	font-size: 18px;
	font-weight: 400;
	text-align: center;
	color: #ffffff;
}

.switch-button {
	/* top: 1.8rem; */
	bottom: 0.3rem;
	position: relative;
	display: inline-block;
	width: 55px;
	height: 33px;
}

.switch-button input {
	opacity: 0;
	width: 0;
	height: 0;
}

.onoff-switch {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 5px;
	border-radius: 20px;
	background-color: #ccc;
	box-shadow: inset 1px 5px 1px #999;
	-webkit-transition: .4s;
	transition: .4s;
}

.onoff-switch:before {
	position: absolute;
	content: "";
	height: 25px;
	width: 25px;
	left: 4px;
	bottom: 4px;
	background-color: #fff;
	-webkit-transition: .5s;
	transition: .4s;
	border-radius: 20px;
}

.switch-button input:checked+.onoff-switch {
	background-color: #F2D525;
	box-shadow: inset 1px 5px 1px #E3AE56;
}

.switch-button input:checked+.onoff-switch:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

.slider {
	width: 100%;
	height: 20%;
	/* 후에 padding: 1.5rem 2rem 으로 수정합니다. 참고바랍니다. */
	padding: 1.5rem;
	/* 	padding-right:1.5rem;
	padding-bottom:0.5rem;
	padding-top:0.5rem; */
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
	position: relative;
	margin-bottom: 0.5rem;
}

input[type=range] {
	width: calc(100% - 2rem);
	top: 1rem;
	left: 1rem;
	position: absolute;
	border: none;
	pointer-events: none;
	z-index: 10;
	appearance: none;
	opacity: 0;
}

input::-webkit-slider-thumb {
	pointer-events: all;
	appearance: none;
	width: 2.5rem;
	height: 1.5rem;
	background-color: red;
}

.track {
	bottom: 5rem;
	position: relative;
	width: 100%;
	height: 0.5rem;
	margin-top: 5rem;
	background-color: #bdc3c7;
	border-radius: 0.5rem;
}

.range1 {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: #ff531f;
	border-radius: 0.5rem;
}

.range {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background-color: #ffc50e;
	border-radius: 0.5rem;
}

.thumb {
	position: absolute;
	top: 0;
	transform: translateY(-0.25rem);
	width: 1rem;
	height: 1rem;
	border: 3px solid #e9d391;
	background-color: #faf8d8;
	border-radius: 50%;
	background-position: center;
}

.left {
	left: 0;
}

.right {
	right: 0;
}

.selectValue {
	top: 2rem;
	width: 36px;
	height: 25px;
	left: 2rem;
	position: absolute;
	background: #ffc50e;
	color: #ffffff;
	border-radius: 6px;
	text-align: center;
	z-index: 1;
	line-height: 18px;
	padding: 5px 0;
	font-size: 18px;
	font-weight: bold;
	left: 480%;
	margin-left: -60px;
}

.selectValue::after {
	position: absolute;
	content: "";
	bottom: 100%;
	left: 50%;
	margin-left: -7px;
	border-width: 7px;
	border-style: solid;
	border-color: transparent transparent #ffc50e transparent;
}

.selectValue1 {
	top: 2rem;
	width: 36px;
	height: 25px;
	left: 2rem;
	position: absolute;
	background: #ff531f;
	color: #ffffff;
	border-radius: 6px;
	text-align: center;
	z-index: 1;
	line-height: 18px;
	padding: 5px 0;
	font-size: 18px;
	font-weight: bold;
	left: 480%;
	margin-left: -60px;
}

.selectValue1::after {
	position: absolute;
	content: "";
	bottom: 100%;
	left: 50%;
	margin-left: -7px;
	border-width: 7px;
	border-style: solid;
	border-color: transparent transparent #ff531f transparent;
}

.form-group {
	width: 300px;
	height: 100px;
	padding-bottom: 50px;
}

.form-control {
	height: 60px;
	border:
}

.freebox {
	width: 35px;
}
</style>
</head>
<body class="bg-gradient-primary">


	<%
	Integer cpu_check = (Integer) request.getAttribute("cpu_check");
	Integer mem_check = (Integer) request.getAttribute("mem_check");
	//	Integer nw_check = (Integer) request.getAttribute("nw_check");
	Integer disk_check = (Integer) request.getAttribute("disk_check");

	String cpu_warning = (String) request.getAttribute("cpu_warning");
	String cpu_danger = (String) request.getAttribute("cpu_danger");

	String mem_warning = (String) request.getAttribute("mem_warning");
	String mem_danger = (String) request.getAttribute("mem_danger");

	String disk_warning = (String) request.getAttribute("disk_warning");
	String disk_danger = (String) request.getAttribute("disk_danger");

	int netusernum = (Integer) request.getAttribute("netusernum");
	int portuser = (Integer) request.getAttribute("portuser");

	if (cpu_warning == null || cpu_danger == null || mem_warning == null || mem_danger == null || disk_warning == null
			|| disk_danger == null) {

		cpu_warning = "50";
		cpu_danger = "80";

		mem_warning = "50";
		mem_danger = "80";

		disk_warning = "50";
		disk_danger = "80";

		netusernum = 0;
		portuser = 0;
	}
	%>


	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<form class="box" action="alarm_threshold" method="post">
				<!-- 체크박스 개수 4개 -->

				<div class="card-header py-3">

					<h6 class="m-0 font-weight-bold text-primary">
						알림 설정 <input type="button" value="임계치 진단 받기" class="settingBtn1" />
						<input type="submit" value="저장" class="settingBtn">

					</h6>
				</div>
				<div class="block"></div>

				<h6 class="small font-weight-bold">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; CPU
					&nbsp;&nbsp;&nbsp;&nbsp; <label class="switch-button"> <input
						type="checkbox" name="check" value="cpu_check"
						<c:out value="${check_result['cpu_check']}"/>> <span
						class="onoff-switch"></span>
					</label>
				</h6>


				<div class="slider">
					<input type="range" id="cpu_warning" min="0" max="100"
						value="<%=cpu_warning%>" name="cpu_warning" /> <input
						type="range" id="cpu_danger" min="0" max="100"
						value="<%=cpu_danger%>" name="cpu_danger" />

					<div class="track">
						<div class="range1" id="cpu_range1"></div>
						<div class="range" id="cpu_range"></div>

						<div class="thumb left" id="cpuLeft">
							<div class="selectValue" id="cpuLeftValue"></div>
						</div>
						<div class="thumb right" id="cpuRight">
							<div class="selectValue1" id="cpuRightValue"></div>
						</div>
					</div>
				</div>

				<h6 class="small font-weight-bold">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Memory &nbsp;&nbsp;<label
						class="switch-button"> <input type="checkbox"
						value="mem_check" name="check"
						<c:out value="${check_result['mem_check']}"/>> <span
						class="onoff-switch"></span>
					</label>
				</h6>


				<div class="slider">
					<input type="range" id="mem_warning" min="0" max="100"
						value="<%=mem_warning%>" name="mem_warning" /> <input
						type="range" id="mem_danger" min="0" max="100"
						value="<%=mem_danger%>" name="mem_danger" />
					<div class="track">
						<div class="range1" id="mem_range1"></div>
						<div class="range" id="mem_range"></div>

						<div class="thumb left" id="memLeft">
							<div class="selectValue" id="memLeftValue"></div>
						</div>
						<div class="thumb right" id="memRight">
							<div class="selectValue1" id="memRightValue"></div>
						</div>
					</div>
				</div>



				<h6 class="small font-weight-bold">
					&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; Disk
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="switch-button">
						<input type="checkbox" value="disk_check" name="check"
						<c:out value="${check_result['disk_check']}"/>> <span
						class="onoff-switch"></span>
					</label>
				</h6>


				<div class="slider">
					<input type="range" id="disk_warning" min="0" max="100"
						value="<%=disk_warning%>" name="disk_warning" /> <input
						type="range" id="disk_danger" min="0" max="100"
						value="<%=disk_danger%>" name="disk_danger" />
					<div class="track">
						<div class="range1" id="disk_range1"></div>
						<div class="range" id="disk_range"></div>

						<div class="thumb left" id="diskLeft">
							<div class="selectValue" id="diskLeftValue"></div>
						</div>
						<div class="thumb right" id="diskRight">
							<div class="selectValue1" id="diskRightValue"></div>
						</div>
					</div>
				</div>

				<div class="row">
					<h6 class="small font-weight-bold">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;네트워크
						접속자수 &nbsp;&nbsp;</h6>
					<div class="form-group">
						<input type="text" class="form-control" name="netusernum"
							id="netusernum" value="<%=netusernum%>" placeholder="<%=netusernum%>">

					</div>

					<div class="freebox"></div>


					<h6 class="small font-weight-bold">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포트번호별 접속자수&nbsp;&nbsp;</h6>

					<div class="form-group">
						<input type="text" class="form-control" name="portuser"
							id="portuser" value ="<%=portuser%>" placeholder="<%=portuser%>">

					</div>

				</div>



			</form>
		</div>
	</div>



	<script>
	
	    
		
		var cpuLeftValue = document.getElementById("cpuLeftValue");
		var cpuRightValue = document.getElementById("cpuRightValue");

		var memLeftValue = document.getElementById("memLeftValue");
		var memRightValue = document.getElementById("memRightValue");

		var diskLeftValue = document.getElementById("diskLeftValue");
		var diskRightValue = document.getElementById("diskRightValue");
		

		var inputLeft_cpu = document.getElementById("cpu_warning");
		var inputRight_cpu = document.getElementById("cpu_danger");

		var inputLeft_mem = document.getElementById("mem_warning");
		var inputRight_mem = document.getElementById("mem_danger");

		var inputLeft_disk = document.getElementById("disk_warning");
		var inputRight_disk = document.getElementById("disk_danger");

		var cpuLeft = document.querySelector("#cpuLeft");
		var cpuRight = document.querySelector("#cpuRight");

		var memLeft = document.querySelector("#memLeft");
		var memRight = document.querySelector("#memRight");

		var diskLeft = document.querySelector("#diskLeft");
		var diskRight = document.querySelector("#diskRight");

		var cpuRange1 = document.querySelector("#cpu_range1");
		var cpuRange = document.querySelector("#cpu_range");

		var memRange1 = document.querySelector("#mem_range1");
		var memRange = document.querySelector("#mem_range");

		var diskRange1 = document.querySelector("#disk_range1");
		var diskRange = document.querySelector("#disk_range");


<!--값 받는 버튼-->
	
		cpuRightValue.innerHTML = inputRight_cpu.value;
		cpuLeftValue.innerHTML = inputLeft_cpu.value;

		memRightValue.innerHTML = inputRight_mem.value;
		memLeftValue.innerHTML = inputLeft_mem.value;

		diskLeftValue.innerHTML = inputLeft_disk.value;
		diskRightValue.innerHTML = inputRight_disk.value;
		

<!--현재값 입력-->	

		cpuRight.style.right = 100 - inputRight_cpu.value + "%";
		cpuRange.style.right = 100 - inputRight_cpu.value + "%";
		cpuRange1.style.left = inputRight_cpu.value + "%";
		
		cpuRange.style.left =inputLeft_cpu.value + "%";
		cpuLeft.style.left = inputLeft_cpu.value + "%";
		cpuRange1.style.left = inputRight_cpu.value + "%";
		
		memRight.style.right = 100 -  inputRight_mem.value + "%";
		memRange.style.right = 100 -  inputRight_mem.value + "%";
		memRange1.style.left =  inputRight_mem.value + "%";
		
		memRange.style.left = inputLeft_mem.value + "%";
		memLeft.style.left = inputLeft_mem.value + "%";
		memRange1.style.left = inputRight_mem.value + "%";
		
				
		diskRange.style.left = inputLeft_disk.value + "%";
		diskLeft.style.left = inputLeft_disk.value + "%";
		diskRange1.style.left = inputRight_disk.value + "%";
		
		diskRight.style.right = 100 -  inputRight_disk.value + "%";
		diskRange.style.right = 100 -  inputRight_disk.value + "%";
		diskRange1.style.left =  inputRight_disk.value + "%";

		
		inputRight_cpu.oninput = function() {
			cpuRightValue.innerHTML = this.value;

			cpuRight.style.right = 100 - this.value + "%";
			cpuRange.style.right = 100 - this.value + "%";

			cpuRange1.style.left = this.value + "%";

		}
		inputLeft_cpu.oninput = function() {

			cpuLeftValue.innerHTML = this.value;

			cpuRange.style.left = this.value + "%";
			cpuLeft.style.left = this.value + "%";

			cpuRange1.style.left = inputRight_cpu.value + "%";

		}
		inputRight_mem.oninput = function() {

			memRightValue.innerHTML = this.value;

			memRight.style.right = 100 - this.value + "%";
			memRange.style.right = 100 - this.value + "%";

			memRange1.style.left = this.value + "%";

		}
		inputLeft_mem.oninput = function() {
			memLeftValue.innerHTML = this.value;

			memRange.style.left = this.value + "%";
			memLeft.style.left = this.value + "%";
			memRange1.style.left = inputRight_mem.value + "%";

		}

		inputRight_disk.oninput = function() {

			diskRightValue.innerHTML = this.value;

			diskRight.style.right = 100 - this.value + "%";
			diskRange.style.right = 100 - this.value + "%";

			diskRange1.style.left = this.value + "%";

		}
		inputLeft_disk.oninput = function() {

			diskLeftValue.innerHTML = this.value;

			diskRange.style.left = this.value + "%";
			diskLeft.style.left = this.value + "%";
			diskRange1.style.left = inputRight_disk.value + "%";

		}

	</script>


</body>
</html>



