<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Login</title>

<!-- Custom fonts for this template-->
<link href="resources/assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/assets/css/sb-admin-2.min.css" rel="stylesheet">

<!-- <script>
$(function(){
	$("btnLogin").click(function(){
		$("#loginform").attr("action","login_check");
		$("#loginform").submit();
			
	});
	
	
});
	
</script> -->

</head>


<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->


						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">로그인</h1>
								<span style="color:red;">${msg}</span> 
							</div>
							<form name="loginform" id="loginform" class="user" method="post" action="login_check">
								
								
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										name="id" placeholder="아이디 ">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user"
										name="passwd" placeholder="비밀번호">
								</div>

								<div class="form-group">
									<input type="submit" id="btnLogin" value="로그인"
										class="btn btn-primary btn-user btn-block">
								</div>
								<hr>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="forgot-password">비밀번호를 잊어버리셨나요?</a>
							</div>
							<div class="text-center">
								<!-- <input type="button" value="회원가입" class="small" id="btnJoin" /> -->
								 <a class="small" href="join">회원가입 하기</a>
							</div>
						</div>


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