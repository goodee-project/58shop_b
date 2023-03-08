<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>답변등록</h1>
	<form action="${pageContext.request.contextPath}/answer/insertAnswerCustomer" method="post">
	<input type="text" value="${questionCustomerCompanyNo}" name="questionCustomerCompanyNo">
	<table border="1">
	<tr>
		<td>
			답변내용 : <textarea name="answerCustomerCompanyContent" rows="5" cols="30">
					</textarea>
		</td>
	</tr>	
	</table>
	<button type="submit">등록</button>
	</form>
	
</body>
</html>