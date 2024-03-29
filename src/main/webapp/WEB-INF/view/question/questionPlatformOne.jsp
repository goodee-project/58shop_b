<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Ansonika">
  <title></title>
	
  <!-- Favicons-->
  <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/html/admin_section/img/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/html/admin_section/img/apple-touch-icon-57x57-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath }/resources/html/admin_section/img/apple-touch-icon-72x72-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath }/resources/html/admin_section/img/apple-touch-icon-114x114-precomposed.png">
  <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath }/resources/html/admin_section/img/apple-touch-icon-144x144-precomposed.png">

  <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	
  <!-- Bootstrap core CSS-->
  <link href="${pageContext.request.contextPath }/resources/html/admin_section/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Main styles -->
  <link href="${pageContext.request.contextPath }/resources/html/admin_section/css/admin.css" rel="stylesheet">
  <!-- Icon fonts-->
  <link href="${pageContext.request.contextPath }/resources/html/admin_section/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- Plugin styles -->
  <link href="${pageContext.request.contextPath }/resources/html/admin_section/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Your custom styles -->
  <link href="${pageContext.request.contextPath }/resources/html/admin_section/css/custom.css" rel="stylesheet">
	
</head>

<body class="fixed-nav sticky-footer" id="page-top">



	<!-- Navigation include -->
	<c:import url="/WEB-INF/view/inc/navigation.jsp"></c:import>

	<div class="content-wrapper">
		<div class="container-fluid">
	    
			<!-- 플랫폼 문의 상세보기 시작 -->
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-question"></i>플랫폼 문의 상세보기</h2>
				</div>
				
				<div class="row">
				
					<!-- 플랫폼 문의 상세보기 리스트 시작 -->
					<table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
						<c:forEach var="q" items="${list}">
							<tr>
								<th>문의제목</th>
								<td>${q.questionPlatformCompanyTitle}</td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td>${q.questionPlatformCompanyContent}</td>
							</tr>
							<tr>
								<th>작성날짜</th>
								<td>${q.questionCreatedate}</td>
							</tr>
			           	</c:forEach>
					</table>
					<!-- 플랫폼 문의 상세보기 리스트 끝 -->				
					
				</div>
			</div>
			<!-- 고객 문의 상세보기 끝 -->
	    
	    
	    
			<!-- 고객 문의 답변 시작 -->
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-reply"></i>답변</h2>
				</div>
				
				<div class="row">
				
					<!-- 고객 문의 답변 리스트 시작 -->
					
					<c:forEach var="q" items="${list}">
						<c:choose> 
							<c:when test="${q.answerPlatformCompanyContent == null}">
								<br>
								<br>
								<p><i class = "pending">답변대기</i></p>
							</c:when> 
							<c:otherwise>
								<table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
								<tr>
									<th>답변내용</th>
				               		<td>${q.answerPlatformCompanyContent}</td>
								</tr>
								<tr>
									<th>답변날짜</th>
				               		<td>${q.answerCreatedate}</td>
								</tr>
						</table>
							</c:otherwise> 
						</c:choose> 
						
			       	</c:forEach>					
					
					<!-- 고객 문의 답변 리스트 끝 -->				
					
				</div>
			</div>
			<!-- 고객 문의 답변 끝 -->
			
        
        </div>    
	</div>

	 
    <!-- /.container-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © PANAGEA 2021</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">정말로 로그아웃 하시겠습니까?</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="${pageContext.request.contextPath }/logout">Logout</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/chart.js/Chart.js"></script>
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/datatables/dataTables.bootstrap4.js"></script>
	   <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/js/admin.js"></script>
	   <!-- Custom scripts for this page-->
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/js/admin-charts.js"></script>
	
</body>
</html>
