<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>��ǰ ���</h1>
	<table border="1">
		<tr>
			<th>��ȣ</th>
			<th>��ü���̵�</th>
			<th>ī�װ�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>Ȱ��ȭ</th>
			<th>����</th>
			<th>�̹���</th>
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