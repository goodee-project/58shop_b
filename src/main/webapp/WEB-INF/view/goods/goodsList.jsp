<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/jquery/jquery.min.js"></script>
<script src="http://unpkg.com/dayjs@1.8.21/dayjs.min.js"></script>

</head>

<body class="fixed-nav sticky-footer" id="page-top">
	  
	<!-- Navigation include -->
	<c:import url="/WEB-INF/view/inc/navigation.jsp"></c:import>
  
	<div class="content-wrapper">
		<div class="container-fluid">
		
			<!-- Breadcrumbs -->
	    	<ol class="breadcrumb">
		        <li class="breadcrumb-item active">
		        	상품 조회/수정
		        </li>
		    </ol>
		    
		    <!-- 판매상태별 조회 -->
		    <div class="box_general padding_bottom">
		    	<div class="row">
		    		<c:forEach var="s" items="${goodsStateList}">
		    			<div><a href="">${s.state} <br>${s.cnt}건</a></div>
		    		</c:forEach>
		    	</div>
		    </div>
		    <!-- 검색어 조회 -->
		    <form action="${pageContext.request.contextPath}/goods/goodsList" method="get" id="searchForm">

			    <div class="box_general padding_bottom">
			    	<div class="row">
			    		<table class="table table-borderless" style="width:100%; cellspacing:0" >
			    			<tr>
			    				<th>검색어</th>
			    				<td>
			    					<div class="row">
										<div class="col-md-3">
											<select class="form-control" name="searchType" id="searchType">
												<c:if test="${searchType == '' or searchType == 'goods_no'}">
													<option value="goods_no" selected>상품번호</option>
													<option value="goods_name">상품명</option>
												</c:if>
												<c:if test="${searchType == 'goods_name'}">
													<option value="goods_no">상품번호</option>
													<option value="goods_name" selected>상품명</option>
												</c:if>
											</select>
										</div>
										<div class="col-md-6">
											<input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색어를 입력해주세요." value="${searchWord}">
										</div>
									</div>
			    				</td>
			    			</tr>
			    			
			    			<tr>
			    				<th>판매상태</th>
			    				<td>
			    					<c:forEach var="s" items="${goodsStateList}">
			    						<input type="checkbox" name="state" value="${s.state}"> ${s.state}
			    					</c:forEach>
			    				</td>
			    			</tr>
			    			
			    			<tr>
			    				<th>카테고리</th>
			    				<td>
			    					<div class="row" id="type">
			    						<c:forEach begin="0" end="2" var="t">
			    							<div class="col-md-3">
						    					<select class="form-control" id="${t}">
						    						<option value="">:: ${t+1}차 분류 ::</option>
						    					</select>
						    				</div>
			    						</c:forEach>
			    						
			    					</div>
			    					<div class="text-muted"><small>* 하위분류가 포함되어 검색됩니다.</small></div>
			    					<input type="hidden" name="typeNo">
			    				</td>
			    			</tr>
			    			
			    			<tr>
			    				<th>기간</th>
			    				<td>
			    					<select name="dateType">
			    						<option value="createdate">상품 등록일</option>
			    						<option value="updatedate">최근 변경일</option>
			    					</select>
			    					<button type="button" class="dateBtn">오늘</button>
			    					<button type="button" class="dateBtn">1개월</button>
			    					<button type="button" class="dateBtn">6개월</button>
			    					<button type="button" class="dateBtn">1년</button>
			    					<button type="button" class="dateBtn">전체기간</button>
									<input type="date" name="startDate" value="${startDate}"> ~
									<input type="date" name="endDate" value="${endDate}">
									 
								</td>
			    			</tr>
			    		</table>
			    	</div>
			    	<div class="text-center">
			    		<button type="reset">초기화</button><button type="button" id="searchBtn">검색</button>
			    	</div>
			    </div>
		    </form>
		    
			<!-- 상품 목록 시작 -->
			<div class="box_general padding_bottom">
				<div class="header_box version_2">
					<h2><i class="fa fa-gift"></i>상품목록</h2>
				</div>
				
				<div class="row">
				
					<!-- 상품 리스트 시작 -->
					<table class="table table-bordered text-center" id="dataTable" style="width:100%; cellspacing:0" >
						<tr>
							<th><input type="checkbox"></th>
							<th>상품코드</th>
							<th colspan="2">상품명</th>
							<th>판매가</th>
							<th>끌올레벨</th>
							<th>판매상태</th>
							
						</tr>
							<c:forEach var="g" items="${goodsList}" varStatus="s">
								
									<tr>
										<td><input type="checkbox"></td>
										<td>${g.goodsNo}</td>
										<td style="width: 5%"><img src="${pageContext.request.contextPath}/upload/goodsImg/${g.goodsImgSaveName}" style="width:50px; height:50px;"/></td>	
										<td class="text-left">
											${g.goodsName}
											<c:forEach items="${fn:split(g.goodsOptionContent, ',')}" var="item">
												<div >- ${item}</div>
											</c:forEach>
										</td>
										<td>${g.goodsPrice}</td>
										<td>${g.goodsLevel}</td>
										<td>${g.goodsActive}</td>
									</tr>
							
							</c:forEach>
					</table>
					<!-- 상품 리스트 끝 -->				
					
				</div>
			</div>
			<!-- 상품 목록 끝 -->
			
			
			<!-- 페이지 시작 -->
			<nav aria-label="...">
				<ul class="pagination pagination-sm add_bottom_30">
					<c:if test="${startPage > 1}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=1&rowPerPage=${rowPerPage}" tabindex="-1">Previous</a></li>
					</c:if>
					<c:if test="${startPage <= 1}">
						<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=1&rowPerPage=${rowPerPage}" tabindex="-1">Previous</a></li>
					</c:if>
					<c:if test="">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=1&rowPerPage=${rowPerPage}" tabindex="-1">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${currentPage == i}">
							<li class="page-item"><a class="page-link active" href="${pageContext.request.contextPath}/goods/goodsList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${i}</a></li>
						</c:if>
						<c:if test="${currentPage != i}">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < lastPage}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${lastPage}&rowPerPage=${rowPerPage}">Next</a></li>
					</c:if>
					<c:if test="${endPage >= lastPage}">
						<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${lastPage}&rowPerPage=${rowPerPage}">Next</a></li>
					</c:if>
				</ul>
			</nav>	
	        <!-- 페이지 끝 --> 			
			
        
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
    
    
   	<!-- 검색 유효성검사 -->
	<script>
		$('#searchBtn').click(function(){
			// 카테고리
			$('#type select').each(function(){
				if($(this).val() != '') {
					$('input[name=typeNo]').val($(this).val());
				}
			});
			// 검색어
			if($('#searchType').val() == 'goods_no' && $('#searchWord').val().length != 0){ // 상품번호 검색 시 다른조건 무시됨
				$('input[name=searchType]').val('goods_no');
				$('input[name=searchWord]').val($('#goodsNo').val());
				$('input[name=startDate]').val('');
				$('input[name=endDate]').val('');
				$('input[name=typeNo]').val('');
			} 
			
			console.log($('input[name=searchType]').val());
			console.log($('input[name=searchWord]').val());
			$('#searchForm').submit();
		});
	</script>
   	
   	<!-- 카테고리 -->
	<script>
		function typeList(parentNo, depth){
			
			let depthId = '#'+depth;
			$.ajax({
				type: 'post'
				, url: '/58shop_b/type'
				, data: {parentNo: parentNo}
				, async: false
				, success: function(model){
					console.log(model);
					let html = "<option value=''>:: "+(depth+1)+"차 분류 :: </option>";
					for(let i=0; i<model.length; i++) {
						html += '<option value="'+model[i].typeNo+'">'+model[i].typeContent+'</option>';
					}
					console.log(depthId+"<--depthId");
					$(depthId).html(html);
				}
				, error: function(){
					alert('시스템 에러');
				}
			});
		}
	</script>
	<!-- 첫 로딩시 -->
	<script>
		$(document).ready(function(){
			let parentNo = 0;
			let depth = 0;
			typeList(parentNo, depth);
		});
	</script>
	<!-- 카테고리 변경 스크립트 -->
	<script>
		$('#type select').change(function(){
			let parentNo = $(this).val();
			let depth = Number($(this).attr('id'))+1;
			console.log(parentNo+'<--parentNo');
			console.log(depth+'<--depth');
			if(parentNo == ''){
				return;
			}
			typeList(parentNo, depth);
		});
	</script>
	
	<!-- 기간 버튼 이벤트 스크립트 -->
	<script>
		$('.dateBtn').click(function(){
			let val = $(this).html();
			console.log(val+"<--date val");

			date(val);
		});
	</script>
	
	<!-- 기간 날짜 스크립트 -->
	<script>
		function date(val){
			let today = dayjs();
			
			let target = 'month';
			let targetDate = 0;
			let startDate = '';
			let todayDate = '';
			if(val == '오늘'){
				targetDate = today.month();
			} else if(val == '1개월'){
				targetDate = today.month()-1;
			} else if(val == '6개월'){
				targetDate = today.month()-6;
			} else if(val == '1년'){
				target = 'year';
				targetDate = today.year()-1;
			} 
			startDate = today.set(target, targetDate).format('YYYY-MM-DD');
			todayDate = today.format('YYYY-MM-DD');
			
			$('input[name=endDate]').attr('max', todayDate);
			
			console.log(todayDate+"<--todayDate");
			console.log(startDate+"<--startDate");
			if(val == '전체기간') {
				startDate = '';
				todayDate = '';
			}
			$('input[name=startDate]').val(startDate);
			$('input[name=endDate]').val(todayDate);
		}
	</script>
	
	
	
	
	<!-- Bootstrap core JavaScript-->
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
	   <!-- Custom scripts for this page-->>

</body>
</html>
