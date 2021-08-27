<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
 <style>
.box select {
  background-color: #DCDCDC;
  color: black;
  padding: 8px;
  border: none;
  font-size: 17px;
  -webkit-appearance: button;
  appearance: button;
  outline: none;
}
 #warning{
 color:#FF8C00
 }
 #dangerous{
 color:FF0000
 }

.box::before {
  content: "\f13a";
  font-family: FontAwesome;
  position: absolute;
  top: 0;
  right: 0;
  width: 20%;
  height: 100%;
  text-align: center;
  font-size: 28px;
  line-height: 45px;
  color: rgba(255, 255, 255, 0.5);
  background-color: rgba(255, 255, 255, 0.1);
  pointer-events: none;
}

.box:hover::before {
  color: rgba(255, 255, 255, 0.6);
  background-color: rgba(255, 255, 255, 0.2);
}

.box select option {
  padding: 30px;
} 
</style>
</head>


<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">



		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">알람 수신 설정</h1>


					<!-- 알림 기록 -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">사용자별 알람 설정</h6>

						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>번호</th>
											<th>이름</th>
											<th>이메일 알림</th>
											<th>SMS 알림</th>
										</tr>
									</thead>

									<tbody>
										<form>
											<tr>
												<th>1</th>
												<th>손예진</th>
												<th>
												<input type="checkbox" name="Email_check" >sonyejin1224@
												<li>
												<label class=recieveLevel for="level">수신레벨</label>
												<div class="box">
												<select id = "class">
													<optgroup label="알람 범위">
														<option value="전체" id="all_select">전체</option>
														<option value="경고" id="warning" style="color:#FF8C00">경고</option>
														<option value="위험" id ="dangerous" style="color:#FF0000">위험</option>
													</optgroup>
												</select>
												</div>
												</li>
										
												</th>
												
												<th><input type="checkbox" name="SMS_check">010-6225-9554
												<li>
												<label class=recieveLevel for="level">수신레벨</label>
												<div class="box">							
												<select id = "class">
											
												<optgroup label="알람 범위" >
													<option value="전체" id="all_select">전체</option>
													<option value="경고" id="warning" style="color:#FF8C00">경고</option>
													<option value="위험" id ="dangerous" style="color:#FF0000">위험</option>
												</optgroup>
												
												</select>
												</div>			
												</li>				
											</tr>
										</form>

									</tbody>
								</table>
							</div>

						</div>




					</div>
					
		

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->




		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

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