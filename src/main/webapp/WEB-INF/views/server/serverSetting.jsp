<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale = 1">
<!-- <link rel = "stylesheet" href= "https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">   -->

<style>
.container {
	margin-top: 80px;
	width: 90%;
}

h6 {
	top: 20px;
	position: absolute;
	padding-left: 20px;
	font-size: 18px;
	font-weight: 900;
}

label {
	padding-top: 20px;
	margin-left: 60px;
	font-size: 17px;
	font-weight: 900;
	color: black;
}

.form-control {
	width: 85%;
	margin-left: 50px;
	font-size: 17px;
}

.box {
	height: 540px;
}

#btnLogin {
	osition: absolute;
	height: 38px;
	margin-left: 120px;
	width: 70px;
	height: 34px;
	bottom: 30px;
	top: 160rem;
}
</style>
<title>서버 설정 page</title>
</head>
<body>
	<div class="container">
		<div class="card o-hidden border-0 shadow-lg my-5">
			<form class="box" action="server_setting" method="post">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">서버 설정</h6>
					<input type="submit" id="btnLogin" value="저장"
						class="btn btn-primary btn-user btn-block">
				</div>



				<div class="form-group">
					<label for="ip">IP주소</label> <input type="text"
						class="form-control" name="ip" id="ip" placeholder="IP주소">

				</div>
				<div class="form-group">
					<label for="public_ip">Public IP</label> <input type="text"
						class="form-control" name="public_ip" id="public_ip"
						placeholder="Public IP주소">

				</div>

				<div class="form-group">
					<label for="username">UserName</label> <input type="text"
						class="form-control" name="username" id="username"
						placeholder="UserName">
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="text"
						class="form-control" name="pw" id="pw" placeholder="비밀번호">
				</div>



			</form>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>