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
			<div>
				<h1>업체 로그인</h1>
			</div>
			
			<div>
				<form method = "post" action = "${pageContext.request.contextPath }/login">
					<div>
						<table border = "1">
							<tr>
								<th>아이디</th>
								<td>	
									<input type = "text" name = "companyId">
								</td>
							</tr>
							
							<tr>
								<th>비밀번호</th>
								<td>	
									<input type = "password" name = "companyPw">
								</td>
							</tr>
						</table>
					</div>

					<div>
						<button type = "submit">로그인</button>
					</div>
				</form>
				
			</div>
			
		</div>
		
	</body>
</html>