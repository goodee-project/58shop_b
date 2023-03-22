<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<style>
			.img {
				width : 100px;
				height : 100px;
			}
		
		</style>
		
	</head>
	
	<body>
		<div>
			<div>
				<h2>주문서 & 주문 내역</h2>
			</div>
		
			<div>
				<!-- 주문서 목록 -->
				<c:forEach var="os" items="${orderSheetList }">
					<table border = "1">
						<tr>
							<th>주문서 번호</th>
							<th>고객 아이디</th>
							<th>고객 주소</th>
							<th>주문서 상태</th>
							<th>운송장 번호</th>
							<th>주문서 가격</th>
							<th>주문서 생성일</th>
						</tr>					
						
							<tr>
								<td>${os.orderSheetNo }</td>	
								<td>${os.customerId }</td>	
								<td>${os.customerAddress }</td>	
								<td>${os.orderSheetState }</td>	
								<td>${os.orderSheetWaybill }</td>	
								<td>${os.orderSheetPrice }</td>	
								<td>${os.createdate }</td>	
							</tr>						
					</table>
					
					<div>
						<h6>&nbsp;</h6>
					</div>
					
					<!-- 주문 목록 -->
					<table border = "1">
						<tr>
							<th>주문번호</th>
							<th>상품 사진</th>
							<th>상품 이름</th>
							<th>옵션 이름</th>
							<th>수량</th>
							<th>주문 가격</th>
							<th>사용한 포인트</th>
							<th>주문 상태</th>
							<th>주문 생성일</th>
						</tr>
								
						<c:forEach var="o" items="${orderList }">
							<c:if test="${os.orderSheetNo == o.orderSheetNo }">
								<tr>
									<td>${o.goodsOrderNo }</td>
									<td>
										<img class = "img" src = "${pageContext.request.contextPath}/upload/goodsImg/${o.goodsImgSaveName }">
									</td>
									<td>${o.goodsName }</td>
									<td>${o.goodsOptionContent }</td>
									<td>${o.goodsOrderQuantity }</td>
									<td>${o.goodsOrderPrice }</td>
									<td>${o.goodsOrderUsePoint }</td>
									<td>${o.goodsOrderState }</td>
									<td>${o.createdate }</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					
					<div>
						<h1>&nbsp;</h1>
						<h1>&nbsp;</h1>
					</div>
				</c:forEach>
						
						
				
				
				
				
				
				
				
			</div>
		
		
		</div>
		
		
		
		
	</body>
</html>