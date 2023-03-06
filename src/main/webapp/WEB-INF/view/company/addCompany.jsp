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
				<h1>업체 회원가입</h1>
			</div>
	
			<div>
				<form method = "post" action = "${pageContext.request.contextPath }/company/addcompany">
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
							
							<tr>
								<th>사업자 등록번호</th>
								<td>
									<input type = "text" name = "companyRegistrationNumber">
								</td>
							</tr>
							
							<tr>
								<th>업체 이름</th>
								<td>
									<input type = "text" name = "companyName">
								</td>
							</tr>
							
							<tr>
								<th>대표자 이름</th>
								<td>
									<input type = "text" name = "companyCeo">
								</td>
							</tr>
							
							<tr>
								<th>업체 전화번호</th>
								<td>
									<input type = "text" name = "companyPhone">
								</td>
							</tr>
							
							<tr>
								<th>업체 이메일</th>
								<td>
									<input type = "text" name = "companyEmail">
								</td>
							</tr>
							
							<tr>
								<th>업체 주소</th>
								<td>
									<input type = "text" name = "companyAddress">
								</td>
							</tr>
							
							<tr>
								<th>업체 은행</th>
								<td>
									<input type = "text" name = "companyBank">
								</td>
							</tr>
							
							<tr>
								<th>업체 계좌번호</th>
								<td>
									<input type = "text" name = "companyAccount">
								</td>
							</tr>
							
							<tr>
								<th>이메일 마케팅 수신 여부</th>
								<td>
									<input type = "radio" name = "companyEmailMarketng">동의
									<input type = "radio" name = "companyEmailMarketng">미동의
								</td>
							</tr>
							
							<tr>
								<th>업종 카테고리</th>
								<td>
									<select>
										<option>
										
									</select>
								</td>
							</tr>
						</table>
					</div>
				
					<div>
						<button type = "submit">회원 가입</button>
					</div>
				
				</form>
			</div>
		</div>
	</body>
</html>