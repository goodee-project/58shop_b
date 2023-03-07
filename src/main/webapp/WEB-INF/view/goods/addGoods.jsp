<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 추가</h1>
	<form enctype="multipart/form-data" action="${pageContext.request.contextPath}/goods/addGoods" method="post">
		<div>
			카테고리 
			<select name="typeNo">
				<c:forEach var="t" items="${typeList}">
					<option value="${t.typeNo}">${t.typeContent}</option>
				</c:forEach>
			</select>
		</div>
		
		<div>
			상품 이름 : <input type="text" name="goodsName">
		</div>
		
		<div>
			가격 : <input type="number" name="goodsPrice">
		</div>
		
		<div>
			<!-- 활성화 상태 기본값 : 숨김 -->
		</div>
		
		<div>
			레벨 : <input type="number" name="goodsLevel">
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
			상세설명 이미지 등록
			<input type="file" name="goodsImg">
		</div>
		
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
	
	<a href="${pageContext.request.contextPath}/goods/goodsList">목록</a>
</body>
</html>