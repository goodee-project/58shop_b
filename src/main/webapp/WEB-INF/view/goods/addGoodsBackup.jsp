<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<h1>상품 추가</h1>
	<form enctype="multipart/form-data" action="${pageContext.request.contextPath}/goods/addGoods" method="post" id="addForm">
		<!-- * 필수 입력 -->
		
		<!-- 카테고리 -->
		<div>
			* 카테고리 
			<select name="typeNo">
				<c:forEach var="t" items="${typeList}">
					<option value="${t.typeNo}">${t.typeContent}</option>
				</c:forEach>
			</select>
		</div>
		
		
		<div>
			* 상품명 : <input type="text" name="goodsName" id="goodsName">
		</div>
		
		<div>
			* 판매 가격 : <input type="number" name="goodsPrice" id="goodsPrice">
		</div>
		
		<div>
			<!-- 레벨 값은 기본으로 0. -->
		</div>
		
		<!-- 활성화 상태 -->
		<div>
			<input type="checkbox" name="goodsActive" value="Y"> 상품 활성화하기
		</div>
	
		
		<!-- 이미지 등록 순서대로 출력 -->
		<div>
			상품 이미지 등록1
			<input type="file" name="goodsImg">
		</div>
		<div>
			상품 이미지 등록2
			<input type="file" name="goodsImg">
		</div>
		
		<div>
			상세설명
			<input type="file" name="goodsImg">
		</div>
		
		<!-- 옵션 -->
		<!-- 옵션닫기, 옵션 추가 -->
		<div>
			<div>
				옵션1 
				<input type="text" name="goodsOptionContent">
				<input type="number" name="goodsOptionQuantity"> <!-- 재고 추가 --> 
			</div>
			<div>
				옵션2
				<input type="text" name="goodsOptionContent">
				<input type="number" name="goodsOptionQuantity"> <!-- 재고 추가 --> 
			</div>
		</div>
		<div>
			<button type="button" id="submitBtn">등록</button>
		</div>
	</form>
	
	<a href="${pageContext.request.contextPath}/goods/goodsList">목록</a>
	
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
			$('#addForm').submit();
		});
	</script>
</body>
</html>