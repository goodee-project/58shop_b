<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>업체아이디</th>
			<th>카테고리</th>
			<th>이름</th>
			<th>가격</th>
			<th>활성화</th>
			<th>레벨</th>
			<th>이미지</th>
		</tr>
		<c:forEach var="g" items="${goodsList}">
			<tr>
				<td>${g.goodsNo}</td>
				<td>${g.companyId}</td>
				<td>${g.typeNo}</td>
				<td>${g.goodsName}</td>
				<td>${g.goodsPrice}</td>
				<td>${g.goodsActive}</td>
				<td>${g.goodsLevel}</td>
				<td>${g.goodsImg}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>