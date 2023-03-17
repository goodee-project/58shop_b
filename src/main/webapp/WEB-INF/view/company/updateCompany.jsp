<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<!-- jQuery -->
		<!-- CDN 주소 추가 방식 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
		
		<!-- 카카오 주소 api -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>		
		
		<script>
		
		
			// 동적 input 이벤트 처리
			$(document).on('blur', '#detailAddress', function() {
				
				// 업체 주소(상세주소 블러처리) 유효성 검사
				$('#detailAddress').blur(function() {
					
					let roadAddress = $('#roadAddress').val();
					let detailAddress = $('#detailAddress').val();
					let companyAddress = $('#companyAddress').val();
					
					if(roadAddress != '') {
		
						// 도로명주소가 공백이 아니라면
						$('#companyAddressMsg').text('');
						$('#companyAddressCheck').text('');
						$('#companyAddressCheck').prepend('<span class="ti-check"></span>');
						$('#companyBank').focus();
						
					} else {
						
						// 도로명 주소가 공백이라면
						
						$('#companyAddressMsg').text('');
						$('#companyAddressCheck').text('');
						$('#companyAddressMsg').text('올바른 주소를 검색해서 입력하세요.');
						
						
					}
					
					$('#companyAddress').val(roadAddress + ' ' + detailAddress);
					
					console.log($('#companyAddress').val());
					
				});
				
				
			});
		
		</script>
		
		<script>
			
			
			// 업체 주소 카카오 주소 api
			
			let inputCheck = true;
			
		    function kakaoAddressApi() {
				
		    	// 주소 검색 누를시 input 추가
		    	if(inputCheck) {
		    		
					$('#divCompanyAddress').prepend('<input type="text" id="detailAddress" class = "form-control" placeholder="상세주소">')
					$('#divCompanyAddress').prepend('<input type="text" id="jibunAddress" class = "form-control" placeholder="지번주소" readonly = "readonly">')
					$('#divCompanyAddress').prepend('<input type="text" id="roadAddress" class = "form-control" placeholder="도로명주소" onchange = "mergeAddress();"readonly = "readonly">')
		    	
					inputCheck = false;
					
		    	}
				
		        new daum.Postcode({
		            oncomplete: function(data) {
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                
		                // 주소 정보를 해당 필드에 넣는다.
		                $('#roadAddress').val(roadAddr);
		                $('#jibunAddress').val(data.jibunAddress);
		                
						// 도로명 주소 + 상세주소 합치기
						$('#companyAddress').val($('#roadAddress').val() + ' ' + $('#detailAddress').val());
						
						console.log($('#companyAddress').val());
		                
		                
		            }
		        }).open();
		    }
			
		
		</script>		
		
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
							<input type = "text" name = "companyAddress" id = "companyAddress" value = "${company.companyAddress }" readonly = "readonly">
							<div class="form-group" id = "divCompanyAddress">
								<!-- 
									<span id = "companyAddressCheck" class = "check"></span>
								 -->
								

								<!-- 
									<i class="ti-info-alt"></i>
								<span id = "companyAddressMsg" class = "errorMsg"></span>
								 -->
								 
								<div style = "display: flex; flex-flow : row nowrap; justify-content : center;">
									<button type="button" onclick="kakaoAddressApi();" class = "btn_1 rounded add_top_10 ">주소 검색</button><br>
								</div>
							</div>
							
							
							
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