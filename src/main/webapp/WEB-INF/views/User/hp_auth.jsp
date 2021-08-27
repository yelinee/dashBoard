<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="card-body">
		<div class="p-5">
			<div class="text-center">
				<span style="color: red; font-weight: bold;">입력한 휴대폰으로 받은 인증
					번호를 입력하세요. </span> <br> <br>
			</div>
			<form class="user" method="post" action="hp_auth${dice_hp}">
				<!--  받아온 인증번호를 컨트롤러로 넘겨서 일치하는지 확인 -->
				<div class="form-group">
					<h3>인증번호 입력</h3>
					<input type="number" name="hp_auth"
						class="form-control form-control-user" placeholder="인증번호를 입력하세요">
				</div>

				<div class="form-group">
					<input type="submit" value="인증번호 전송"
						class="btn btn-primary btn-user btn-block">

				</div>

			</form>
			<hr>
			<div class="text-center">
				<a class="small" href="join">전화번호를 잘못 입력하셨나요?</a>

			</div>

		</div>
	</div>

</body>
</html>