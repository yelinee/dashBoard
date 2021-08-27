<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>JOIN</title>

<!-- Custom fonts for this template-->
<link href="resources/assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https:/fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/assets/css/sb-admin-2.min.css" rel="stylesheet">
<title>이메일 인증 페이지</title>
</head>
<body>

	<div class="card-body">
		<div class="p-5">
			<div class="text-center">
				<span style="color: red; font-weight: bold;">입력한 이메일로 받은 인증
					번호를 입력하세요. </span> <br> <br>
			</div>
			<form class="user" method="post" action="join_auth${dice}">
				<!--  받아온 인증번호를 컨트롤러로 넘겨서 일치하는지 확인 -->
				<div class="form-group">
					<h3>인증번호 입력</h3>
					<input type="number" name="email_auth"
						class="form-control form-control-user" placeholder="인증번호를 입력하세요">
				</div>

				<div class="form-group">
					<input type="submit" value="인증번호 전송"
						class="btn btn-primary btn-user btn-block">

				</div>

			</form>
			<hr>
			<div class="text-center">
				<a class="small" href="join">이메일을 잘못 입력하셨나요?</a>

			</div>

		</div>
	</div>

</body>
</html>