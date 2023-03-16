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
			<h3>업체 정보 수정</h3>
		
			<form method = "post" action = "${pageContext.request.contextPath }/company/updateCompany">
			<div>
				<table border = "1">
					<tr>
						<td>아이디</td>
						<td>
							<input type = "text" name = "companyId" value = "${company.companyId }" readonly = "readonly">
						</td>
					</tr>
					
					<tr>
						<td>사업자 등록 번호</td>
						<td>
							<input type = "text" name = "companyRegistrationNumber" value = "${company.companyRegistrationNumber }" readonly = "readonly">
						</td>
					</tr>
					
					<tr>
						<td>업체 이름</td>
						<td>
							<input type = "text" name = "companyName" value = "${company.companyName }" readonly = "readonly">
						</td>
					</tr>
					
					<tr>
						<td>대표자 이름</td>
						<td>
							<input type = "text" name = "companyCeo" value = "${company.companyCeo }" readonly = "readonly">
						</td>
					</tr>
					
					<tr>
						<td>업체 전화번호</td>
						<td>
							<input type = "text" name = "companyPhone" value = "${company.companyPhone }">
						</td>
					</tr>
					
					<tr>
						<td>업체 이메일</td>
						<td>
							<input type = "text" name = "companyEmail" value = "${company.companyEmail }">
						</td>
					</tr>
					
					<tr>
						<td>업체 주소</td>
						<td>
							<input type = "text" name = "companyAddress" value = "${company.companyAddress }">
						</td>
					</tr>
					
					<tr>
						<td>업체 은행</td>
						<td>
							<input type = "text" name = "companyBank" value = "${company.companyBank }">
						</td>
					</tr>
					
					<tr>
						<td>업체 계좌</td>
						<td>
							<input type = "text" name = "companyAccount" value = "${company.companyAccount }">
						</td>
					</tr>
					
					<tr>
						<td>이메일 마케팅 수신 여부</td>
						<td>

							<div>
								<i class="ti-gallery mr-3"></i>&emsp;&emsp;&emsp;
								<c:choose>
									<c:when test="${company.companyEmailMarketing == '동의' }">
										<input type = "radio" name = "companyEmailMarketing" value = "동의" checked = "checked"> 동의&emsp;
										<input type = "radio" name = "companyEmailMarketing" value = "미동의"> 미동의
									</c:when>
									<c:otherwise>
										<input type = "radio" name = "companyEmailMarketing" value = "동의"> 동의&emsp;
										<input type = "radio" name = "companyEmailMarketing" value = "미동의" checked = "checked"> 미동의
									</c:otherwise>
								</c:choose>
							</div>

						</td>
					</tr>
					
					<tr>
						<td>업종 카테고리</td>
						<td>

							<div>
								<i class="ti-target"></i>&emsp;&emsp;&emsp;
								<select name = "typeNo" class = "select">
									<c:forEach var="t" items="${typeList }">
										<c:choose>
											<c:when test="${company.typeContent == t.typeContent }">
												<option value = "${t.typeNo }" selected>${t.typeContent }
											</c:when>
											<c:otherwise>
												<option value = "${t.typeNo }">${t.typeContent }
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>					
							</div>

						</td>
					</tr>
				</table>
			
			</div>
			
			<div>
				<button type = "submit">수정</button>
			</div>
			
			</form>
		
		
		</div>
		
		
		
		
	</body>
</html>