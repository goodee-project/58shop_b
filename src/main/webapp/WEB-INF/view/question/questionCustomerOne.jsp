<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>문의 상세보기</h1>
		<table border="1">
			<c:forEach var="q" items="${list}">
				<tr>
					<th>문의제목</th>
					<td>${q.questionCustomerCompanyTitle}</td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td>${q.questionCustomerCompanyContent}</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>${q.questionCreatedate}</td>
				</tr>
           	</c:forEach>
		</table>
		
		<h2>답변</h2>
		<c:forEach var="q" items="${list}">
			<c:choose> 
				<c:when test="${q.answerCustomerCompanyContent == null}">
					<h3>미답변</h3>
				</c:when> 
				<c:otherwise>
					<table border="1">
					<tr>
						<th>답변내용</th>
	               		<td>${q.answerCustomerCompanyContent}</td>
					</tr>
					<tr>
						<th>답변날짜</th>
	               		<td>${q.answerCreatedate}</td>
					</tr>
			</table>
				</c:otherwise> 
			</c:choose> 
			
       	</c:forEach>
</body>
</html>