<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 관리</h1>
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>카테고리</th>
			<th>이름</th>
			<th>가격</th>
			<th>활성화</th>
			<th>레벨</th>
			<th>대표 이미지</th>
		</tr>
		<c:forEach var="g" items="${goodsList}">
			<tr>
				<td>${g.goodsNo}</td>
				<td>${g.typeNo}</td>
				<td><a href="${pageContext.request.contextPath}/goods/addGoodsOption?goodsNo=${g.goodsNo}">${g.goodsName}</a></td>
				<td>${g.goodsPrice}</td>
				<td>${g.goodsActive}</td>
				<td>${g.goodsLevel}</td>
				<td><img src="${pageContext.request.contextPath}/upload/goodsImg/${g.goodsImgSaveName}" style="width:100px; height:100px;"/></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>