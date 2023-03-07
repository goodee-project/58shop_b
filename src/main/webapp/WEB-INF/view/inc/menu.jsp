<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		
	</head>
	
	<body>
		<div>
			<h3>
				<a href = "${pageContext.request.contextPath }/login">로그인</a>
			</h3>
			<h3>
				<a href = "${pageContext.request.contextPath }/logout">로그아웃</a>
			</h3>
			<h3>
				<a href = "${pageContext.request.contextPath }/addCompany">업체 회원가입</a>
			</h3>
		</div>
		
	</body>
</html>