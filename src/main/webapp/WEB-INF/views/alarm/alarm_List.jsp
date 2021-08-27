<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
#alarm_table {
	/* padding-right:30px;
padding-left:30px; */
	width: 85%;
	margin: 0 auto;
	color: black;
}

#dataTable {
	color: #666666;
	text-align: center;
}

.NO_tabel {
	
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
					<h1 class="h3 mb-2 text-gray-800">경고 알림</h1>


					<!-- 알림 기록 -->
					<div id="alarm_table" class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">알림 목록</h6>

						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th class="NO_tabel">NO</th>
											<th>서버</th>
											<th>지표</th>
											<th>사용량</th>
											<th>레벨</th>
											<th>발생 시각</th>

										</tr>
									</thead>


									<tbody>
										<c:forEach items="${list}" var="result">
											<c:set var="num" value="${num+1}" />
											<tr>
												<td class="th" id="num"><c:out value="${num}" /></td>
												<td class="th"><c:out value="${result.ip}" /></td>
												<td class="th"><c:out value="${result.resource}" /></td>
												<td class="th"><c:out value="${result.resourceUsage}" /></td>
												<td class="th"><c:out value="${result.level}" /></td>
												<td class="th"><c:out value="${result.date}" /></td>
											</tr>

										</c:forEach>



									</tbody>
								</table>
							</div>
							<div class="table-bottom">
								<a href="alarmSetting" class="btn btn-success btn-icon-split">
									<span class="icon text-white-50"> <i
										class="fas fa-check"></i>
								</span> <span class="text">임계치 설정</span>
								</a>

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
					<a class="btn btn-primary" href="logout">Logout</a>
				</div>
			</div>
		</div>
	</div>



</body>

</html>