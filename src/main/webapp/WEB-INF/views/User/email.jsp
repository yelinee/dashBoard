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

<title>JOIN</title>

<!-- Custom fonts for this template-->
<link href="resources/assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https:/fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/assets/css/sb-admin-2.min.css" rel="stylesheet">
<title>이메일 작성 페이지</title>
</head>
<body>
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="p-5">
							<div class="text-center">이메일 인증
								<!-- <span style="color: red; font-weight: bold;">이메일 인증 
									</span> <br> <br> -->
							</div>
							<form class="user" method="post" action="auth">
								<div class="form-group">

									<input type="email" class="form-control form-control-user"
										name="e_mail" placeholder="${map.message}">
								</div>

								<div class="form-group">
									<input type="submit" value="이메일 인증받기"
										class="btn btn-primary btn-user btn-block">
								</div>

							</form>

						</div>




					</div>
				</div>

			</div>

		</div>

	</div>

	<%-- 			<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->


						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">이메일 인증</h1>
								<span style="color:red;">${map.message}</span> 
							</div>
							
								<form class="user" method="post" action="auth" >
									<div class="form-group">

									<input type="email" class="form-control form-control-user"
										name="e_mail" placeholder="${map.message}">
									</div>
		
									<div class="form-group">
									<input type="submit" value="이메일 인증받기"
								class="btn btn-primary btn-user btn-block">
									</div>
		
         						 </form>
							
							<hr>
							
						</div>


					</div>
				</div>
 --%>


	<%-- <div class="card-body">
	<div class="p-5">
		<div class="text-center">
			<span style="color: red; font-weight: bold;">이메일 인증 (이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.)</span> <br> <br> 
		</div>
		<form class="user" method="post" action="auth" >
		<div class="form-group">

				<input type="email" class="form-control form-control-user"
				name="e_mail" placeholder="${map.message}">
		</div>
		
		<div class="form-group">
							<input type="submit" value="이메일 인증받기"
								class="btn btn-primary btn-user btn-block">
						</div>
		
          </form>
	
</div> --%>
	<!-- </div> -->

</body>
</html>