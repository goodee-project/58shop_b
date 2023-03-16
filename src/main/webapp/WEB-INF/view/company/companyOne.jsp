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
			<table border = "1">
				<tr>
					<th>아이디</th>
					<th>사업자 등록번호</th>
					<th>업체 이름</th>
					<th>대표자 이름</th>
					<th>업체 전화번호</th>
					<th>업체 이메일</th>
					<th>업체 주소</th>
					<th>업체 은행</th>
					<th>업체 계좌</th>
					<th>이메일 마케팅 수신 여부</th>
					<th>업종 카테고리</th>
					<th>마지막 정보 수정한 날짜</th>
					<th>계정 생성 날짜</th>
				</tr>
				<tr>
					<td>${company.companyId }</td>
					<td>${company.companyRegistrationNumber }</td>
					<td>${company.companyName }</td>
					<td>${company.companyCeo }</td>
					<td>${company.companyPhone }</td>
					<td>${company.companyEmail }</td>
					<td>${company.companyAddress }</td>
					<td>${company.companyBank }</td>
					<td>${company.companyAccount }</td>
					<td>${company.companyEmailMarketing }</td>
					<td>${company.typeContent }</td>
					<td>${company.updatedate }</td>
					<td>${company.createdate }</td>
					
				</tr>
					
			
			</table>
		
		
		</div>
		
		
		
	</body>
</html>