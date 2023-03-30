<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script src="${pageContext.request.contextPath }/resources/html/admin_section/vendor/jquery/jquery.min.js"></script>
<script src="http://unpkg.com/dayjs@1.8.21/dayjs.min.js"></script>
<style>
	.page-item.active .page-link {
		color: #fff;
	    text-decoration: none;
	    background-color: #0054a6;
	    border-color: #0054a6;
	}
	
	.table {
		overflow-y: auto;
	}
</style>
</head>

<body class="fixed-nav sticky-footer" id="page-top">
	  
	<!-- Navigation include -->
	<c:import url="/WEB-INF/view/inc/navigation.jsp"></c:import>
  
	<div class="content-wrapper">
		<div class="container-fluid">
		
			<!-- Breadcrumbs -->
	    	<ol class="breadcrumb">
		        <li class="breadcrumb-item active">
		        	상품 재고 관리
		        </li>
		    </ol>
		    
		    <!-- 검색어 조회 -->
		    <form action="${pageContext.request.contextPath}/goods/goodsOptionList" method="get" id="searchForm">
				<input type="hidden" name="rowPerPage" value="${rowPerPage}">
			    <div class="box_general padding_bottom">
			    	<div class="search">
				    	<div class="row">
				    		<table class="table table-borderless" style="width:100%; cellspacing:0" >
				    			<tr>
				    				<th class="col-2">검색어</th>
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
				    					<div class="row">
				    						<div class="col-md-8">
				    						
				    							<c:set var="sl" value="${fn:join(stateList, ',')}" />
						    					<c:forEach var="s" items="${fn:split('전체,판매중,일시품절,비활성화', ',')}">
						    						<c:if test="${s eq '전체'}">
						    							<input type="checkbox" id="stateAllCheck" value="">${s}
						    						</c:if>
						    						<c:if test="${s ne '전체'}">
						    							<input type="checkbox" class="" name="state" value="${s}" <c:if test="${fn:contains(sl, s)}">checked</c:if>> ${s}
						    						</c:if>
						    					</c:forEach>
					    					</div>
				    					</div>
				    				</td>
				    			</tr>
			    			</table>
			    		</div>
			    		
			    		
						<div id="searchDetails" class="collapse" role="tabpanel" data-bs-parent="#tips" style="">
							<div class="row">
					    		<table class="table table-borderless" style="width:100%; cellspacing:0">
							
									<tr>
										<th class="col-2">카테고리</th>
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
					    					<div class="row">
												<div class="col-md-3">
							    					<select name="dateType" class="form-control">
							    						<option value="createdate">상품 등록일</option>
							    						<option value="updatedate">최근 변경일</option>
							    					</select>
					    						</div>
					    						<div class="col-md-8">
							    					<button type="button" class="dateBtn btn_1">오늘</button>
							    					<button type="button" class="dateBtn btn_1">1개월</button>
							    					<button type="button" class="dateBtn btn_1">6개월</button>
							    					<button type="button" class="dateBtn btn_1">1년</button>
							    					<button type="button" class="dateBtn btn_1">전체기간</button>
													<input type="date" name="startDate" value="${startDate}"> ~
													<input type="date" name="endDate" value="${endDate}">
												</div>
											</div>
										</td>
					    			</tr>
							
				    			</table>	
			    			</div>
			    		</div>
				    		
		    			<div role="tab">
							<a class="btn btn-sm" data-bs-toggle="collapse" href="#searchDetails" aria-expanded="true">
								상세 검색 <i class="fa fa-chevron-down"></i>
							</a>
						</div>
				    	<div class="text-center">
				    		<button type="reset" class="btn_1 gray">초기화</button><button type="button" id="searchBtn" class="btn_1">검색</button>
				    	</div>
			    	</div>
			    </div>
		    </form>
		    
		    
			<!-- 상품 옵션목록 시작 -->
			<div class="box_general padding_bottom">
				<div class="table-responsive">
					<div class="dataTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
						<div class="header_box version_2">
							<h2><i class="fa fa-gift"></i>상품 재고 관리</h2>
						</div>
						<div class="row mb-3">
							<div class="col-sm-12 col-md-6">
			   					<button type="button" id="updateBtn" class="btn_1">수정재고 일괄 변경</button>
			   					<a href="${pageContext.request.contextPath}/download" id="downloadBtn" class="btn_1">엑셀 파일 다운로드</a>
		   					</div>
		   					<div class="col-sm-12 col-md-6">
		   						<div class="float-right">
									<select id="rowPerPage" style="width: 75px" class="form-control form-control-sm d-inline-block">
										<c:set var="rl" value="${{30, 50, 100}}" />
										<c:forEach items="${rl}" var="r">
											<c:if test="${rowPerPage == r}">
												<option value="${r}" selected>${r}</option>
											</c:if>
											<c:if test="${rowPerPage != r}">
												<option value="${r}">${r}</option>
											</c:if>
										</c:forEach>
									</select> 개씩
								</div>
		   					</div>
						</div>
						
						<div class="row" >
							<form action="${pageContext.request.contextPath}/goods/updateGoodsOptionQuantity" method="post" style="width: 100%">
								<!-- 상품 리스트 시작 -->
								<table class="table table-bordered text-center" id="tbl" style="width:100%; cellspacing:0" >
									<tr>
										<th style="width: 100px"><input type="checkbox" id="allcheck"></th>
										<th style="width: 100px">상품 번호</th>
										<th style="width: 200px">상품명</th>
										<th style="width: 100px">옵션 번호</th>
										<th style="width: 150px">옵션명</th>
										<th style="width: 100px">재고 수량</th>
										<th style="width: 100px;"> 
											<a data-toggle="tooltip" title="기존 재고에 수량을 증감 또는 차감합니다.">
				   								수정 재고 &nbsp;<i class="fa fa-question-circle"></i>&nbsp;<small></small>
				   							</a>
				   						</th>
										
									</tr>
									<c:forEach var="g" items="${goodsOptionList}" varStatus="s">
											
										<tr>
											<td><input type="checkbox" value="${g.goodsOptionNo}" name="goodsOptionNo" class="checkboxBtn"></td>
										
											<td>${g.goodsNo}</td>
											<td>${g.goodsName}</td>	
											<td><a href="${pageContext.request.contextPath}/goods/stockHistoryList?goodsOptionNo=${g.goodsOptionNo}">${g.goodsOptionNo}</a></td>
											<td>${g.goodsOptionContent}</td>
											<td>${g.goodsOptionQuantity}</td>
											<td><input type="number" class="form-control" name="goodsOptionQuantity"></td>
										</tr>
								
									</c:forEach>
								</table>
								<!-- 상품 리스트 끝 -->	
							</form>			
						</div>
					</div>
				</div>
			</div>
			<!-- 상품 목록 끝 -->
			
			
			<!-- 페이지 시작 -->
			<nav aria-label="...">
				<ul class="pagination pagination-sm add_bottom_30">
					<c:if test="${startPage > 1}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsOptionList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=1&rowPerPage=${rowPerPage}" tabindex="-1">Previous</a></li>
					</c:if>
					<c:if test="${startPage <= 1}">
						<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsOptionList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=1&rowPerPage=${rowPerPage}" tabindex="-1">Previous</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${currentPage == i}">
							<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsOptionList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${i}</a></li>
						</c:if>
						<c:if test="${currentPage != i}">
							<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsOptionList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < lastPage}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsOptionList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${lastPage}&rowPerPage=${rowPerPage}">Next</a></li>
					</c:if>
					<c:if test="${endPage >= lastPage}">
						<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsOptionList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${lastPage}&rowPerPage=${rowPerPage}">Next</a></li>
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
				$('input[name=startDate]').val('');
				$('input[name=endDate]').val('');
				$('input[name=typeNo]').val('');
			} 
			
			console.log($('input[name=searchType]').val());
			console.log($('input[name=searchWord]').val());
			$('#searchForm').submit();
		});
	</script>
   	
   	<!-- 전체 선택/해제 -->
   	<script>
		$('#allcheck').click(function(){
			if($('#allcheck').is(':checked')) { // .is(':checked') : 체크 여부 확인. checked -> true
				$('input[type="checkbox"]').prop('checked', true);	
			} else {
				$('input[type="checkbox"]').prop('checked', false);
			}
		});
   	</script>
   	
   	<!-- 상품 상태 전체 선택/해제 -->
   	<script>
	   	$('#stateAllCheck').click(function(){
			if($('#stateAllCheck').is(':checked')) { // .is(':checked') : 체크 여부 확인. checked -> true
				$('input[name=state]').prop('checked', true);	
			} else {
				$('input[name=state]').prop('checked', false);
			}
		});
		$('input[name=state]').click(function(){
			if($('input[name=state]').length == $('input[name=state]:checked').length) {
				$('#stateAllCheck').prop('checked', true);
	   		} else {
	   			$('#stateAllCheck').prop('checked', false);
	   		}
		});
   	</script>
   	
   	<!-- rowperpage -->
   	<script>
   		$('#rowPerPage').change(function(){
   			$('input[name=rowPerPage]').val($(this).val());
   			$('#searchForm').submit();
   		});
   	</script>
   	
   	<!-- 카테고리 -->
	<script>
		function typeList(parentNo){
			let typeList;
			
			$.ajax({
				type: 'post'
				, url: '/58shop_b/type'
				, data: {parentNo: parentNo}
				, async: false
				, success: function(model){ 
					typeList = model;
				}
				, error: function(){
					alert('시스템 에러');
				}
			});
			return typeList;
		}
	</script>
	
	<!-- 카테고리 옵션 -->
	<script>
		function typeSelect(model, depth){
			
			let depthId = '#'+depth;
			
			let html = "<option value=''>:: "+(depth+1)+"차 분류 :: </option>";
			for(let i=0; i<model.length; i++) {
				html += '<option value="'+model[i].typeNo+'">'+model[i].typeContent+'</option>';
			}
			console.log(depthId+"<--depthId");
			$(depthId).html(html);
		}
	</script>	
	
	<!-- 첫 로딩시 -->
	<script>
		$(document).ready(function(){
			$('[data-toggle="tooltip"]').tooltip();
			let parentNo = 0;
			let depth = 0;
			typeSelect(typeList(parentNo), depth);
			
			let today = dayjs();
			todayDate = today.format('YYYY-MM-DD');
			$('input[name=endDate]').attr('max', todayDate);
			$('input[name=startDate]').attr('max', todayDate);

			if($('input[name=state]').length == $('input[name=state]:checked').length) {
				$('#stateAllCheck').prop('checked', true);
	   		} else {
	   			$('#stateAllCheck').prop('checked', false);
	   		}
		});
	</script>
	

	
	<!-- 기간 선택 -->
	<script>
		$('input[name=startDate]').change(function(){
			$('input[name=endDate]').attr('min', $(this).val());
		});
		$('input[name=endDate]').change(function(){
			$('input[name=startDate]').attr('max', $(this).val());
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

	<!-- 수정 -->
	<script>
		$('#updateBtn').click(function(){
			if($('.checkboxBtn:checked').length == 0){
				alert('상품을 선택하세요.');
   				return false;
			}
			
			let paramData = [];
			$('#tbl tr').each(function() {
			    if ( $(this).find(".checkboxBtn:checked").is(':checked') ) {
			    	goodsOption = {
			    		goodsOptionNo			: $(this).find("input[name=goodsOptionNo]").val()
				    	, goodsOptionQuantity	: $(this).find("input[name=goodsOptionQuantity]").val()
				   	};
			    	 
			    	//param 배열에 storeOrder 오브젝트를 담는다.
					paramData.push(goodsOption);
			    }
			 });
			console.log(paramData);
		
			 $.ajax({
				type: 'patch'
				, url: "/58shop_b/quantity"
				, data: JSON.stringify(paramData)
				, contentType : 'application/json'
				, dataType : 'text'
				, success: function(text) {
					console.log(text);
					if(text=="success") {
						alert("재고변경이 성공적으로 이루어졌습니다.")
						location.reload();
					}
				}
			 	, error: function(request, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	</script>


	 <script src="${pageContext.request.contextPath }/resources/html/js/common_scripts.js"></script>
	
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
