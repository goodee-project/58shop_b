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
	    
			<!-- ?????? ?????? ?????? -->
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-question"></i>?????? ??????</h2>
				</div>
				
				<div class="row">
				
					<!-- ???????????? ????????? ?????? -->
					<table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>???????????????</th>
								<th>??????</th>
								<th>??????</th>
								<th>????????????</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="q" items="${list}">
			              		<tr>
			              			<td>${q.customerId}</td>
			                		<td>
			                			<a href="${pageContext.request.contextPath}/question/questionCustomerOne?questionCustomerCompanyNo=${q.questionCustomerCompanyNo}">
			                			${q.questionCustomerCompanyTitle}
			                			</a>
			                		</td>
			                		<td>${q.createdate}</td>
			                		<td>
					               		<c:choose> 
											<c:when test="${q.answerCustomerCompanyContent == null}">
												<p><i class="cancel">?????????</i></p>							
											</c:when> 
											<c:otherwise>
												<p><i class="approved">????????????</i></p>
											</c:otherwise> 
										</c:choose> 
									</td>
			              		</tr>
			             	</c:forEach>
						</tbody>
					</table>
					<!-- ???????????? ????????? ??? -->				
					
				</div>
			</div>
			<!-- ?????? ?????? ??? -->
			
			
			<!-- ????????? ?????? -->
			<div>
				<ul class="pagination pagination-sm add_bottom_30 justify-content-center">
					<c:if test="${currentPage != 1}">
						<li class="page-item">
							<a class = "page-link" href="${pageContext.request.contextPath}/question/questionCustomerList?currentPage=${currentPage-1}">
								<span>??????</span>
							</a>
						</li>
					</c:if>
					
					<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
						<li class="page-item">
							<a class = "page-link" href="${pageContext.request.contextPath}/question/questionCustomerList?currentPage=${i}">
								<span>${i}</span>
							</a>
						</li>
					</c:forEach>
					
					<c:if test="${currentPage != lastPage}">
						<li class="page-item">
							<a class = "page-link" class="page-link" href="${pageContext.request.contextPath}/question/questionCustomerList?currentPage=${currentPage+1}">
								<span>??????</span>
							</a>
						</li>
					</c:if>
				</ul>
			</div>	
	        <!-- ????????? ??? --> 			
			
        
        </div>    
	</div>
	
	
	 
	 
    <!-- /.container-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright ?? PANAGEA 2021</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
   


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
	<script src="${pageContext.request.contextPath }/resources/html/js/input_qty.js"></script>
	<script src="${pageContext.request.contextPath }/resources/html/admin_section/js/admin.js"></script>
</body>
</html>
