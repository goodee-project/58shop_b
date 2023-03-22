<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
  <link href="${pageContext.request.contextPath }/resources/html/admin_section/vendor/dropzone.css" rel="stylesheet">
  <!-- WYSIWYG Editor -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/html/admin_section/js/editor/summernote-bs4.css">
  <!-- Your custom styles -->
  <link href="${pageContext.request.contextPath }/resources/html/admin_section/css/custom.css" rel="stylesheet">
	
</head>

<body class="fixed-nav sticky-footer" id="page-top">
 
	<!-- Navigation include -->
	<c:import url="/WEB-INF/view/inc/navigation.jsp"></c:import>
 
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-file"></i>상품 수정</h2>
				</div>
				
				<div>
					<form enctype="multipart/form-data" action="${pageContext.request.contextPath}/goods/updateGoodsOne" method="post" id="updateForm">
						<input type="hidden" name="goodsNo" value="${goods.goodsNo}">
						<div class="row">
							<div class="col-md-2">
								<label class="fix_spacing">* 상품명</label>
							</div>
							<div class="col-md-5">
								<div class="form-group">
									<input type="text" class="form-control" name="goodsName" id="goodsName" value="${goods.goodsName}">
								</div>
							</div>
						</div>			
						
						<div class="row">
							<div class="col-md-2">
								<label class="fix_spacing">* 판매가격</label>
							</div>
							<div class="col-md-5">
								<div class="form-group">
									<input type="text" class="form-control" name="goodsPrice" id="goodsPrice" value="${goods.goodsPrice}">
								</div>
							</div>
						</div>			
						
						<div>
							<!-- 레벨 값은 기본으로 0. -->
						</div>			
									
						<div>
							<table id="pricing-list-container" style="width:100%;">
								<tr class="pricing-list-item">
									<td>				
										<div class="row">
											<div class="col-md-2">
												<label class="fix_spacing">옵션</label>
											</div>
											
											<div class="col-md-3">
												<div class="form-group">
													<input type="text" class="form-control" name="goodsOptionContent" placeholder="내용">
												</div>
											</div>
											
											<div class="col-md-1">
												<div class="form-group">
													<input type="number" class="form-control" name="goodsOptionQuantity" placeholder="수량">
												</div>
											</div>
											
											<div class="col-md-1 d-flex align-items-center">
												<div class="form-group">
													<a class="delete" href="#"><i class="fa fa-fw fa-remove"></i></a>
												</div>
											</div>								
										</div>			
									</td>
								</tr>
							</table>
							<a href="#0" class="btn_1 gray add-pricing-list-item"><i class="fa fa-fw fa-plus-circle"></i>옵션 추가</a>
						</div>
						
						<div class = "text-center">
							<button type="button" id="submitBtn" class="btn_1 medium">등록</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
		<!-- /.container-fluid-->
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
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="#0">Logout</a>
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
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/datatables/jquery.dataTables.js"></script>
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/jquery.magnific-popup.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/js/admin.js"></script>
    <!-- Custom scripts for this page-->
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/dropzone.min.js"></script>
    <!-- WYSIWYG Editor -->
    <script src="${pageContext.request.contextPath }/resources/html/admin_section/js/editor/summernote-bs4.min.js"></script>
    
    
	<script>	
		$('#submitBtn').click(function(){
			if($('#goodsName').val().length == 0){
				alert('상품명을 입력해주세요.');
				return;
			}
			if($('#goodsPrice').val().length == 0){
				alert('판매가격을 입력해주세요.');
				return;
			}
			console.log($('input[name=goodsOptionContent]').val());
			if($('input[name=goodsOptionContent]').val() != null && $('input[name=goodsOptionContent]').val().length == 0) {
				alert('옵션을 입력하거나 삭제해주세요.');
				return;
			}
			$('#updateForm').submit();
		});
    </script>
	
</body>
</html>
