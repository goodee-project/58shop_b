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
		
		<style>
			.errorMsg {
				color : red;
			}
			
			.check {
				color : blue;
			}		
		
		</style>		
		
		<script>
			$(function() {
				
				let companyPwCheck = false;
				let companyNewPwCheck = false;
				
				$('#companyPw').blur(function() {
					
					$.ajax({
						url : 'updatePwCheck'
						, type : 'get'
						, data : {companyPw:$('#companyPw').val()}
						, success : function(model) {
							
							if(model == 'YES') {
								// 현재 비밀번호와 일치
								$('#companyPwMsg').text('');
								$('#companyPwCheck').text('');
								$('#companyPwCheck').prepend('OK');
								$('#password').focus();
								
								companyPwCheck = true;
								
								
							} else {
								// 현재 비밀번호와 불일치
								
								$('#companyPwMsg').text('');
								$('#companyPwCheck').text('');									
								$('#companyPwMsg').text('현재 비밀번호와 일치하지 않습니다.');
								
								
								companyPwCheck = false;
								
								
							}
							
						}
					});
					
					// 새로운 비밀번호 체크
					$('#password').blur(function() {
						
						let password = $('#password').val();
						
						// 영어와 숫자(\d)를 허용
						// 특수기호 허용
						// 10자 ~ 20자
						const regExPw = /^[a-zA-Z\d\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{10,20}$/;						
						
						if(regExPw.test(password)) {
							
							$.ajax({
								url : 'updateNewPwCheck'
								, type : 'get'
								, data : {password:$('#password').val()}
								, success : function(model) {
									
									if(model == 'YES') {
										// 사용 가능한 비밀번호(이력에 없음)
										
										$('#passwordMsg').text('');
										$('#passwordCheck').text('');
										$('#passwordCheck').prepend('OK');
										$('#password2').focus();
										
										passwordCheck = true;
										
										
									} else {
										// 사용 불가능한 비밀번호(이력에 있음)
										
										$('#password').val('');
										
										$('#passwordMsg').text('');
										$('#passwordCheck').text('');									
										$('#passwordMsg').text('사용 할 수 없는 비밀번호입니다.');
										
										
										passwordCheck = false;
										
										
									}
									
								}
							});
							
						} else {
							
							// 비밀번호 생성 규칙에 벗어났을때
							
							$('#password').val('');
							
							$('#passwordMsg').text('');
							$('#passwordCheck').text('');									
							$('#passwordMsg').text('영문, 숫자, 특수문자만 가능하며 10자 ~ 20자인 비밀번호를 입력하세요.');							
							
							passwordCheck = false;
							
						}
						
						
					});
					
					
					// 새로운 비밀번호 확인 체크
					$('#password2').blur(function() {
						
						let password = $('#password').val();
						let password2 = $('#password2').val();
						
						if(password2 != '' && password2 === password) {
							
							$('#password2Msg').text('');
							$('#password2Check').text('');
							$('#password2Check').prepend('OK');
							
							password2Check = true;							
							
						} else {
							
							$('#password2').val('');
							
							$('#password2Msg').text('');
							$('#password2Check').text('');									
							$('#password2Msg').text('위의 새로운 비밀번호와 일치하지 않습니다.');
							
							
							password2Check = false;							
							
							
						}
						
						
					});
					
					
					// 폼 제출
					$('#updatePwBtn').click(function() {
						
						if(companyPwCheck && passwordCheck && password2Check) {
							
							$('#updatePwForm').submit();
							
						} else {
							
							alert('모든 정보를 올바르게 입력하세요.')
							
						}
						
						
					});
					
					
				});
				
				
			});
		
		</script>
		
	</head>
	
	<body>
		
		<div>
			<div>
				<h3>업체 비밀번호 수정</h3>				
			</div>
			
			<div>
				<form id = "updatePwForm" method = "post" action = "${pageContext.request.contextPath }/company/updateCompanyPw">
				
					<div>
						<table border = "1">
							<tr>
								<th>현재 비밀번호</th>
								<td>
									<span id = "companyPwCheck" class = "check"></span>
								</td>
								<td>
									<input type = "password" name = "companyPw" id = "companyPw">
								</td>
								<td>
									<span id = "companyPwMsg" class = "errorMsg"></span>
								</td>
							</tr>
							
							<tr>
								<th>새로운 비밀번호</th>
								<td>
									<span id = "passwordCheck" class = "check"></span>
								</td>
								<td>
									<input type = "password" name = "password" id = "password">
								</td>
								<td>
									<span id = "passwordMsg" class = "errorMsg"></span>
								</td>
							</tr>
							
							<tr>
								<th>새로운 비밀번호 확인</th>
								<td>
									<span id = "password2Check" class = "check"></span>
								</td>
								<td>
									<input type = "password" name = "password2" id = "password2">
								</td>
								<td>
									<span id = "password2Msg" class = "errorMsg"></span>
								</td>
							</tr>
						
						</table>
						
					</div>
				
					<div>
						<button type = "button" id = "updatePwBtn">수정</button>
					</div>
					
				
				
				</form>
			</div>			
		
		
		</div>
		
		
		
		
		
		
		
		
		
		
	</body>
</html>