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
		        	상품 조회/수정
		        </li>
		    </ol>
		    
		    <!-- 판매상태별 개수 -->
		    <div class="box_general padding_bottom">
		    	<div class="row">
		    		<c:forEach var="s" items="${goodsStateList}">
		    			<div class="col-md-3">
		    				<div style="color:#000000;">${s.state}&nbsp; <strong style="color:#fc5b62;">${s.count}</strong>건</div>
		    			</div>
		    		</c:forEach>
		    	</div>
		    </div>
		    <!-- 검색어 조회 -->
		    <form action="${pageContext.request.contextPath}/goods/goodsList" method="get" id="searchForm">
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
						    				
						    					<c:forEach var="s" items="${goodsStateList}">
						    						<c:if test="${s.state == '전체'}">
						    							<input type="checkbox" id="stateAllCheck" value=""> ${s.state}
						    						</c:if>
						    						<c:if test="${s.state != '전체'}">
						    							<input type="checkbox" name="state" value="${s.state}" <c:if test="${fn:contains(sl, s.state)}">checked</c:if>> ${s.state}
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
		    
			<!-- 상품 목록 시작 -->
			<div class="box_general padding_bottom">
				<div class="table-responsive">
				<div class="dataTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
				<div class="header_box version_2">
					<h2><i class="fa fa-gift"></i>상품목록</h2>
				</div>
				<div class="row mb-3">
					<div class="col-sm-12 col-md-8">
						<button type="button" id="updateBtn" class="btn_1">수정</button>
	   					<button type="button" id="deleteBtn" class="btn_1">삭제</button>
	   					<button type="button" id="typeBtn" data-bs-target="#typeModal" data-bs-toggle="modal" class="btn_1">카테고리 일괄 변경</button>
	   					<a data-toggle="popover" title="상품 정보를 수정하려면?" data-bs-content="'상품번호'클릭 시 상품 수정이 가능합니다.">
	   						<i class="fa fa-question-circle"></i>&nbsp;<small>상품 정보를 수정하려면?</small>
	   					</a>
   					</div>
   					<div class="col-sm-12 col-md-4">
   						<div class="float-right">
							<select id="rowPerPage" style="width: 75px" class="form-control form-control-sm d-inline-block">
	
								<c:forEach items="${fn:split('30,50,100',',')}" var="r">
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
				
				<div class="row">
				
					<!-- 상품 리스트 시작 -->
					<table class="table table-bordered text-center" id="dataTable" style="width:100%; cellspacing:0" >
						<tr>
							<th style="width: 100px"><input type="checkbox" id="allcheck"></th>
						
							<th style="width: 100px">상품코드</th>
							<th colspan="2" style="width: 300px">상품명</th>
							<th>판매가</th>
							<th>재고수량</th>
							<th style="width: 90px;">진열 순서</th>
							<th style="width: 100px;">진열 순서 수정</th>
							<th>판매상태</th>
							<th style="width: 130px">판매상태 수정</th>
							<th>카테고리</th>
						</tr>
							<c:forEach var="g" items="${goodsList}" varStatus="s">
								
								<tr class="trRow">
									<td><input type="checkbox" value="${g.goodsNo}" name="goodsNo" class="checkboxBtn"></td>
								
									<td><a href="${pageContext.request.contextPath}/goods/updateGoodsOne?goodsNo=${g.goodsNo}">${g.goodsNo}</a></td>
									<td style="width: 5%"><img src="${pageContext.request.contextPath}/upload/goodsImg/${g.goodsImgSaveName}" style="width:50px; height:50px;"/></td>	
									<td class="text-left">
										${g.goodsName}
										<c:forEach items="${fn:split(g.goodsOptionContent, ',')}" var="item">
											<div >- ${item}</div>
										</c:forEach>
									</td>
									<td><fmt:formatNumber value="${g.goodsPrice}" pattern="#,###" /></td>
									<td>
				
										<a rel="${g.goodsNo}" href="#0" data-bs-toggle="modal" data-bs-target="#quantityModal" class="quantityModal">${g.goodsQuantity}</a>
										<!-- 재고 상세보기 modal -->
										<div class="modal fade mm-slideout" id="quantityModal" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalLabel">재고 상세보기</h5>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
									        	<div>
									        		<table class="table table-bordered table-sm">
									        			<tr>
									        				<th>옵션 정보</th>
									        				<th>재고</th>
									        			</tr>
									        			<tbody class="tbody"></tbody>
									        		</table>
									        	</div>
										      </div>
										    </div>
										  </div>
										</div>																
									</td>
									<td>${g.goodsLevel}</td>
									<td><input class="form-control" name="goodsLevel" type="number" value="${g.goodsLevel}"></td>
									<td>${g.goodsActive}</td>
									<td>
										<select class="form-control d-inline-block">
	
											<c:forEach items="${fn:split('판매중,비활성화',',')}" var="r">
												<c:if test="${g.goodsActive eq r}">
													<option value="${r}" selected>${r}</option>
												</c:if>
												<c:if test="${g.goodsActive ne r}">
													<option value="${r}">${r}</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
									<td>${g.lvl}</td>
								</tr>
						
						</c:forEach>
					</table>
					<!-- 상품 리스트 끝 -->				
					</div>
					</div>
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
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${currentPage == i}">
							<li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/goods/goodsList?searchType=${searchType}&searchWord=${searchWord}&typeNo=${typeNo}&dateType=${dateType}&startDate=${startDate}&endDate=${endDate}&currentPage=${currentPage}&rowPerPage=${rowPerPage}">${i}</a></li>
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
    
    <!-- 카테고리 변경 modal -->
    <div class="modal fade mm-slideout" id="typeModal" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">카테고리 일괄 변경</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
        	<div>
        		<form id="updateTypeForm">
	        		<table class="table table-bordered table-sm">
	        			<tr>
	        				<td id="typeContainer"></td>
	        			</tr>	
	        		</table>
	        		<div class="text-center">
	        			<button type="button" id="submitBtn" class="btn_1">변경</button>
	        		</div>
        		</form>
        	</div>
	      </div>
	    </div>
	  </div>
	</div>		
    
    <!-- 카테고리 변경 -->
    <script>
    	$('#submitBtn').click(function(){
    		let $updateForm = $('#updateTypeForm');
    		
   			$('.checkboxBtn:checked').each(function(){
   				let selectedName = 'goodsNo'
   		         $updateForm.append($('<input>').attr('type', 'hidden').attr('name', selectedName).val($(this).val()));
   			});
   			
   			let typeNo = $('input[name=typeNo]:checked').val();
   			
   			console.log($updateForm.serialize());
   		
			$.ajax({
    			type: 'patch'
    			, url: '/58shop_b/goods/goodsType'
    			, data: $updateForm.serialize()
				, success: function(model){
					console.log(model);
					location.reload();
				}
				, error: function(){
					alert('시스템 에러');
				}
    		});
    	});
    </script>
    
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
	
   	<!-- 삭제 -->
   	<script>
   		$('#deleteBtn').click(function(){
   			let checkedValue = [];
   			$('.checkboxBtn:checked').each(function(){
   				checkedValue.push($(this).val());
   			});
   			if(checkedValue.length == 0){
   				alert('상품을 선택하세요.');
   				return false;
   			}
   			
   			let check = confirm('삭제 시 복구할 수 없습니다. 삭제하시겠습니까?');
   			if(!check){
   				return false;
   			} 
   			console.log(checkedValue);
   			$.ajax({
				type: 'DELETE'
				, url: '/58shop_b/goods'
				, data: {goodsNo: checkedValue}
				, async: false
				, success: function(model){
					if(model == checkedValue.length){
						console.log('삭제성공');
					}
					location.reload();
				}
				, error: function(){
					alert('시스템 에러');
				}
			});
   			
   		});
   	</script>
   	
   	<!-- 상품 전체 선택/해제 -->
   	<script>
		$('#allcheck').click(function(){
			if($('#allcheck').is(':checked')) { // .is(':checked') : 체크 여부 확인. checked -> true
				$('input[name=goodsNo]').prop('checked', true);	
			} else {
				$('input[name=goodsNo]').prop('checked', false);
			}
		});
		$('input[name=goodsNo]').click(function(){
			if($('input[name=goodsNo]').length == $('input[name=goodsNo]:checked').length) {
				$('#allcheck').prop('checked', true);
	   		} else {
	   			$('#allcheck').prop('checked', false);
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
			$('[data-toggle="popover"]').popover();
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
			typeSelect(typeList(parentNo), depth);
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
	
	<!-- 재고 -->
	<script>
		$('.quantityModal').click(function(){
			let goodsNo = $(this).attr('rel');
			console.log(goodsNo+"<--goodsNo");
			$.ajax({
				type: 'post'
				, url: '/58shop_b/quantity'
				, data: {goodsNo: goodsNo}
				, async: false
				, success: function(model){
					console.log(model);
					let html = '';
					for(let i=0; i<model.length; i++) {
						html += '<tr><td>'+model[i].goodsOptionContent+'</td>';
						html += '<td>'+model[i].goodsOptionQuantity+'</td></tr>';
					}
					$('.tbody').html(html);
				}
				, error: function(){
					alert('시스템 에러');
				}
			});
		});
	</script>
	
	<!-- 수정 -->
	<script>
		$('#updateBtn').click(function(){
			if($('.checkboxBtn:checked').length == 0){
				alert('상품을 선택하세요.');
   				return false;
			}
		    $('.trRow').each(function() {
		        if($(this).find('.checkboxBtn').is(':checked')) {
		        	
		        	let $form = $('<form></form>'); // 동적 form 생성
			        let $tmp = $(this).clone();
		            
			        // serialize : 직렬화하기 때문에 선택된 값이 아닌 첫번째 옵션 값을 가져옴
			        // select 요소에 대해 선택된 옵션의 값을 수동으로 가져옴
		            $(this).find('select').each(function(){
		                let $selectedOption = $(this).find('option:selected');
		                let selectedValue = $selectedOption.val();
		                let selectedName = 'goodsActive'
		                $tmp.append($('<input>').attr('type', 'hidden').attr('name', selectedName).val(selectedValue));
		            });
		            
		            $form.append($tmp);
		            console.log($form.serialize());
		            $.ajax({
		                type: 'patch'
		                , url: '/58shop_b/goods'
		                , data: $form.serialize()
		                , async: false
		                , success: function(model){
		                    console.log(model);
		                }
		                , error: function(){
		                    alert('시스템 에러');
		                }
		            });
		            $form.empty();
		        }
		    });
		    location.reload();
		});
	</script>
	
	<!-- 카테고리 일괄 변경 -->
	<script>
		$('#typeBtn').click(function(){
			if($('.checkboxBtn:checked').length == 0){
				alert('상품을 선택하세요.');
   				return false;
			}
   			let data = typeList(-1);
   			
   			let html = '';
   			for(let i=0; i<data.length; i++){
   				let depth = '';
   				for(let j=0; j<data[i].depth; j++){
   					depth += '&nbsp;&nbsp;&nbsp;';
   				}
   				html += '<input type="radio" name="typeNo" value="'+data[i].typeNo+'">'+depth+data[i].typeContent+'<br>';
   			}
   			
   			
   			$('#typeContainer').html(html);
   			
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
