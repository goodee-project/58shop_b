<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>문의사항 목록</h3>
		<table border="1">
			<thead>
				<tr>
					<th>고객아이디</th>
					<th>제목</th>
					<th>날짜</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="q" items="${list}">
              		<tr>
                		<td>
                			<a href="${pageContext.request.contextPath}/question/questionCustomerOne?questionCustomerCompanyNo=${q.questionCustomerCompanyNo}">
                			${q.questionCustomerCompanyTitle}
                			</a>
                		</td>
                		<td>${q.createdate}</td>
                		<td>
		               		<c:choose> 
								<c:when test="${q.answerCustomerCompanyContent == null}">
									<p>미답변</p>
								</c:when> 
								<c:otherwise>
									<p>답변완료</p>
								</c:otherwise> 
							</c:choose> 
						</td>
              		</tr>
             	</c:forEach>
			</tbody>
		</table>		
        <a href="${pageContext.request.contextPath}/question/questionCustomerList?currentPage=${currentPage-1}"> 이전 </a>
        <c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/question/questionCustomerList?currentPage=${i}">${i}</a>
		</c:forEach>
        <a class="page-link" href="${pageContext.request.contextPath}/question/questionCustomerList?currentPage=${currentPage+1}"> 다음 </a>
</body>
</html>