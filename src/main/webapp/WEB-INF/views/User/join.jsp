<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
<style>
#hp_button {
	width: 130px;
	height: 40px;
	border: 8px;
	text-border: 5px;
}

#email_button {
	width: 130px;
	height: 40px;
	border: 8px;
	text-border: 5px;
}

#div_hp {
	padding-left: 10px;
}
</style>

<%!String smsMsg = "";
	String emailMsg = "";%>
</head>

<body class="bg-gradient-primary">
	<%
	smsMsg = (String) request.getAttribute("sucessSmsAuth");
	emailMsg = (String) request.getAttribute("sucessMsg");

	System.out.println("sms메세지(jsp):" + smsMsg);
	System.out.println("email메세지(jsp):" + emailMsg);
	%>

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="p-5">
					<div class="text-center">
						<h1 class="h4 text-gray-900 mb-4">계정 만들기</h1>
					</div>
					<form class="user" method="post" action="join_check">
						<div class="form-group">

							<input type="text" class="form-control form-control-user"
								name="name" placeholder="이름" id="name" value="${name}">
						</div>


						<div class="form-group">

							<input type="text" class="form-control form-control-user"
								name="id" placeholder="아이디" id="id" value="${id}"> <span
								style="color: red;">${msg}</span>

						</div>

						<div class="form-group">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<input type="password" class="form-control form-control-user"
									name="passwd" id="passwd" placeholder="비밀번호" value="${passwd}">
							</div>
						</div>

						<div class="form-group">

							<input type="tel" class="form-control form-control-user"
								name="hp" id="hp" placeholder="전화 번호" value="${hp}">

						</div>


						<div class="form-group" id="div_hp">
							<input type="button" value="전화번호 인증" id="hp_button"
								class="btn btn-info btn-icon-split"
								onclick="location.href='hp_auth_con?email='+$('#email').val()+'&name='+$('#name').val()+'&id='+$('#id').val()+'&passwd='+$('#passwd').val()+'&hp='+$('#hp').val()">

							<%
							if ("".equals(smsMsg) || smsMsg == null) {
							%>

							<span style="color: red;">휴대폰 인증을 해주세요</span>
							<%
							} else {
							%>
							<span style="color: green;"><%=smsMsg%></span>
							<%
							}
							%>
						</div>


						<div class="form-group">

							<input type="email" class="form-control form-control-user"
								name="email" id="email" placeholder="이메일" value="${email}">

						</div>


						<div class="form-group" id="div_hp">
							<input type="button" value="이메일 인증" id="email_button"
								class="btn btn-info btn-icon-split"
								onclick="location.href='email_auth_con?email='+$('#email').val()+'&name='+$('#name').val()+'&id='+$('#id').val()+'&passwd='+$('#passwd').val()+'&hp='+$('#hp').val()
										">

							<%
							if ("".equals(emailMsg) || emailMsg == null) {
							%>

							<span style="color: red;">이메일 인증을 해주세요</span>
							<%
							} else {
							%>
							<span style="color: green;"><%=emailMsg%></span>
							<%
							}
							%>


						</div>


						<div class="form-group">
							<input type="submit" value="확인"
								class="btn btn-primary btn-user btn-block">
						</div>

					</form>
					<hr>
					<div class="text-center">
						<a class="small" href="forgot-password">비밀번호 잊어버리셨나요?</a>
					</div>

				</div>

			</div>
		</div>

	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login">Logout</a>
				</div>
			</div>
		</div>
	</div>





</body>

</html>