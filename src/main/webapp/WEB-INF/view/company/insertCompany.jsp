<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title></title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/html/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/html/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath }/resources/html/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath }/resources/html/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath }/resources/html/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath }/resources/html/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/html/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/html/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath }/resources/html/css/custom.css" rel="stylesheet">
	
	<!-- jQuery -->
	<!-- CDN 주소 추가 방식 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>	
	
	<!-- 카카오 주소 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
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
			
			// 아이디 중복 체크
			let idCheck = false;		// 아이디
			let pwCheck = false;		// 비밀번호
			let pw2Check = false;		// 비밀번호
			let rnCheck = false;		// 사업자 등록번호
			let cnCheck = false;		// 업체 이름
			let ceoCheck = false;		// 대표자 이름
			let phoneCheck = false;		// 업체 전화번호
			let emailCheck = false;		// 이메일
			let addressCheck = false;	// 주소
			let bankCheck = false;		// 은행
			let accountCheck = false;	// 계좌
			
			
			// 아이디 유효성 검사
			$('#companyId').blur(function() {
				
				let companyId = $('#companyId').val();
				
				// 영어와 숫자로 이루어진 5자 ~ 15자 아이디
				const regExId = /^[a-zA-Z0-9]{5,15}$/;
				
				if(regExId.test(companyId)) {	// 아이디 규칙을 지켰는지 검사
						
						// ajax를 이용하여 total_id 테이블에서 중복 아이디인지 검사
						$.ajax({
							url : 'companyIdCheck'
							, type : 'get'
							, data : {companyId:$('#companyId').val()}
							, success : function(model) {
								
								if(model == 'YES') {
									// 사용가능한 ID
									$('#idMsg').text('');
									$('#idCheck').text('');
									$('#idCheck').prepend('<span class="ti-check"></span>');
									$('#companyPw').focus();
									
									idCheck = true;
									
									console.log(idCheck + ' <-- idCheck');
									
								} else {
									// 사용중인 ID
									
									$('#idMsg').text('');
									$('#idCheck').text('');									
									$('#idMsg').text($('#companyId').val() + '은(는) 이미 존재하는 아이디입니다');
									
									
									idCheck = false;
									
									console.log(idCheck + ' <-- idCheck');
									
								}
								
							}
						});
				
				} else {
					
					$('#companyId').val('');
					
					$('#idMsg').text('');
					$('#idCheck').text('');					
					$('#idMsg').text('영문, 숫자만 가능하며 5자 ~ 15자인 아이디를 입력하세요.');
					
					idCheck = false;
					
				}
				
			});
			
			
			// 비밀번호 유효성 검사
			$('#companyPw').blur(function() {
				
				let companyPw = $('#companyPw').val();
				
				// 영어와 숫자(\d)를 허용
				// 특수기호 허용
				// 10자 ~ 20자
				const regExPw = /^[a-zA-Z\d\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]{10,20}$/;
				
				if(regExPw.test(companyPw)) {	// 비밀번호 규칙을 지켰는지 검사
					
					// 사용 가능한 비밀번호
					
					$('#pwMsg').text('');
					$('#pwCheck').text('');
					$('#pwCheck').prepend('<span class="ti-check"></span>');
					$('#companyPw2').focus();
					
					pwCheck = true;
					
				} else {
					
					// 사용 불가능한 비밀번호
					$('#companyPw').val('');
					
					$('#pwMsg').text('');
					$('#pwCheck').text('');					
					$('#pwMsg').text('영문, 숫자, 특수문자만 가능하며 10자 ~ 20자인 비밀번호를 입력하세요.');
					
					pwCheck = false;
					
				}
				
			});
			
			
			// 비밀번호 확인 유효성 검사
			$('#companyPw2').blur(function() {
				
				let companyPw = $('#companyPw').val();
				let companyPw2 = $('#companyPw2').val();
				
				// companyPw와 같은 지 비교
				
				if(companyPw2 != '' && companyPw2 === companyPw) {
					
					// 일치한다면
					
					$('#pw2Msg').text('');
					$('#pw2Check').text('');
					$('#pw2Check').prepend('<span class="ti-check"></span>');
					$('#comRN').focus();
					
					pw2Check = true;
					
				} else {
					
					// 일치하지 않는다면
					$('#companyPw2').val('');
					
					$('#pw2Msg').text('');
					$('#pw2Check').text('');					
					$('#pw2Msg').text('위의 비밀번호와 일치하지 않습니다.');

					
					pw2Check = false;
					
				}
				
				
			});
			
			// 사업자 등록번호 유효성 검사
			$('#comRN').blur(function() {
				
				// - 삭제
				let comRN = $('#comRN').val().replace(/-/g, '');
				
				// 사업자 등록 번호 유효성 검사(10자리 {10} 숫자 \d 인지 검사)
				const regExRN = /^\d{10}$/;
				
				if($('#comRN').val() != '' && regExRN.test(comRN)) {
					
					// 10자리 숫자라면
					
					if(parseInt(comRN.substring(0, 3)) > 100 && comRN.substring(3, 5) != '00' && comRN.substring(5, 9) != '0000') {
						
						// 1 - 3번째 자리가 101 ~ 999
						// 4 - 5번째 자리가 01 ~ 99 
						// 6 - 9번째 자리가 0001 ~ 9999
						// 10번째 자리는 오류 검출 코드
						// 사용 가능한 사업자 등록번호다
						
						$('#comRNMsg').text('');
						$('#comRNCheck').text('');
						$('#comRNCheck').prepend('<span class="ti-check"></span>');
						$('#companyName').focus();					
						
						console.log(comRN + ' <-- comRN');
						
						console.log(comRN.substring(3, 5) + ' <-- asd');
						
						$('#comRN').val(comRN);
						
						rnCheck = true;
						
					} else {
					
						// 올바르지 않는 사업자 등록번호 일 경우
						$('#comRN').val('');
						
						$('#comRNMsg').text('');
						$('#comRNCheck').text('');
						$('#comRNMsg').text('올바른 사업자 등록 번호를 입력하세요.');
						
						rnCheck = false;					
					
					}
					
				} else {
					
						// 올바르지 않는 사업자 등록번호 일 경우
						$('#comRN').val('');
						
						$('#comRNMsg').text('');
						$('#comRNCheck').text('');
						$('#comRNMsg').text('올바른 사업자 등록 번호를 입력하세요.');
						
						rnCheck = false;					
					
				}
				
			});
			
			
			// 업체 이름 유효성 검사
			$('#companyName').blur(function() {
				
				let companyName = $('#companyName').val();
				
				// 업체 이름 유효성 검사
				// 한글, 영문, 숫자로 이루어진 1자 ~ 30자
				const regExCompanyName = /^[ㄱ-ㅎ가-힣a-zA-Z0-9]{1,30}$/;
				
				if(regExCompanyName.test(companyName)) {
					
					// 사용 가능한 업체이름이라면
					
					$('#companyNameMsg').text('');
					$('#companyNameCheck').text('');
					$('#companyNameCheck').prepend('<span class="ti-check"></span>');
					$('#companyCeo').focus();
					
					cnCheck = true;
					
				} else {
					
					// 사용 불가능한 업체 이름이라면
					$('#companyName').val('');
					
					$('#companyNameMsg').text('');
					$('#companyNameCheck').text('');
					$('#companyNameMsg').text('한글, 영문, 숫자가 가능하며 1자 ~ 30자로 이루어진 업체 이름을 입력하세요.');
					
					cnCheck = false;						
					
				}
				
			});
			
			
			// 업체 대표자 이름 유효성 검사
			$('#companyCeo').blur(function() {
				
				let companyCeo = $('#companyCeo').val();
				
				// 업체 대표자 이름 유효성 검사
				// 한글, 영문으로 이루어진 1자 ~ 30자
				const regExCompanyCeo = /^[ㄱ-ㅎ가-힣a-zA-Z]{1,30}$/;
				
				if(regExCompanyCeo.test(companyCeo)) {
					
					// 사용 가능한 대표자 이름이라면
					
					$('#companyCeoMsg').text('');
					$('#companyCeoCheck').text('');
					$('#companyCeoCheck').prepend('<span class="ti-check"></span>');
					$('#companyPhone').focus();
					
					ceoCheck = true;
					
				} else {
					
					// 사용 불가능한 대표자 이름이라면
					$('#companyCeo').val('');
					
					$('#companyCeoMsg').text('');
					$('#companyCeoCheck').text('');
					$('#companyCeoMsg').text('한글, 영문이 가능하며 1자 ~ 30자로 이루어진 대표자 이름을 입력하세요.');
					
					ceoCheck = false;						
					
				}
				
			});
			
			
			// 업체 전화번호 유효성 검사
			$('#companyPhone').blur(function() {
				
				// - 삭제
				let companyPhone = $('#companyPhone').val().replace(/-/g, '');
				
				console.log(companyPhone.length)
				
				const regExCompanyPhone = /^\d{9,11}$/;
				
				if(regExCompanyPhone.test(companyPhone)) {
					
					// 사용 가능한 업체 전화번호라면
					$('#companyPhoneMsg').text('');
					$('#companyPhoneCheck').text('');
					$('#companyPhoneCheck').prepend('<span class="ti-check"></span>');
					$('#companyEmail').focus();					
					
					// - 삭제한 값을 다시 입력
					$('#companyPhone').val(companyPhone);
					
					phoneCheck = true;					
					
				} else {
					
					// 사용 불가능한 업체 전화번호라면
					$('#companyPhone').val('');
					
					$('#companyPhoneMsg').text('');
					$('#companyPhoneCheck').text('');
					$('#companyPhoneMsg').text('올바른 전화번호를 입력하세요.');
					
					phoneCheck = false;	
					
				}
				
			});
			
			
			// 업체 이메일 유효성 검사
			$('#companyEmail').blur(function() {
				
				let companyEmail = $('#companyEmail').val();
				
				const regExCompanyEmail = /[\w\-\.]+\@[\w\-\.]+/;
				
				if(regExCompanyEmail.test(companyEmail)) {
					
					// 사용 가능한 업체 이메일이라면
					$('#companyEmailMsg').text('');
					$('#companyEmailCheck').text('');
					$('#companyEmailCheck').prepend('<span class="ti-check"></span>');
					$('#detailAddress').focus();						
					
					emailCheck = true;
					
				} else {
					
					// 사용 불가능한 업체 이메일이라면
					$('#companyEmail').val('');
					
					$('#companyEmailMsg').text('');
					$('#companyEmailCheck').text('');
					$('#companyEmailMsg').text('올바른 이메일 주소를 입력하세요.');
					
					emailCheck = false;
					
				}
				
				
			});
			
			
			// 업체 주소(상세주소 블러처리) 유효성 검사
			$('#detailAddress').blur(function() {
				
				let roadAddress = $('#roadAddress').val();
				let detailAddress = $('#detailAddress').val();
				
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
			
			
			// 업체 은행 유효성 검사
			$('#companyBank').blur(function() {
				
				let companyBank = $('#companyBank').val();
				
				const regExCompanyBank = /^[ㄱ-ㅎ가-힣a-zA-Z]{1,15}$/;
				
				if(regExCompanyBank.test(companyBank)) {
					
					// 사용 가능한 업체 은행명이라면
					$('#companyBankMsg').text('');
					$('#companyBankCheck').text('');
					$('#companyBankCheck').prepend('<span class="ti-check"></span>');
					$('#companyAccount').focus();
					
					bankCheck = true;
					
				} else {
					
					// 사용 불가능한 업체 은행명이라면
					
					$('#companyBank').val('');
					
					$('#companyBankMsg').text('');
					$('#companyBankCheck').text('');
					$('#companyBankMsg').text('올바른 은행 이름을 입력하세요.');
					
					bankCheck = false;
					
				}
				
			});
			
			
			// 업체 계좌 유효성 검사
			$('#companyAccount').blur(function() {
				
				let companyAccount = $('#companyAccount').val().replace(/-/g, '');
				
				const regExCompanyAccount = /^[0-9\-]{1,20}$/;
				
				if(regExCompanyAccount.test(companyAccount)) {
					
					// 사용 가능한 계좌 번호라면
					$('#companyAccountMsg').text('');
					$('#companyAccountCheck').text('');
					$('#companyAccountCheck').prepend('<span class="ti-check"></span>');
					
					$('#companyAccount').val(companyAccount);
					
					accountCheck = true;
					
				} else {
					
					// 사용 불가능한 계좌 번호라면
					$('#companyAccount').val('');
					
					$('#companyAccountMsg').text('');
					$('#companyAccountCheck').text('');
					$('#companyAccountMsg').text('올바른 은행 계좌 번호를 입력하세요.');
					
					accountCheck = false;
					
				}
				
			});
			
			
			// 회원 가입 폼 전송
			$('#addBtn').click(function() {
				
				// 도로명 주소 input이 공백이 아닐 때
				// companyAddress가 공백이 아닐때
				
				let roadAddress = $('#roadAddress').val();
				let companyAddress = $('#companyAddress').val();
				
				if(roadAddress == '' || companyAddress == '') {

					// 도로명주소나 업체 주소가 공백이라면
					$('#companyAddressMsg').text('');
					$('#companyAddressCheck').text('');
					$('#companyAddressMsg').text('올바른 주소를 검색해서 입력하세요.');
					$('#detailAddress').focus();

					addressCheck = false;
					
				} else {
					
					// 도로명 주소가 공백이 아니라면
					
					$('#companyAddressMsg').text('');
					$('#companyAddressCheck').text('');
					$('#companyAddressCheck').prepend('<span class="ti-check"></span>');
					
					addressCheck = true;
					
					console.log(addressCheck + 'ccc');
					
				}				
				
				// 폼 액션 전송
				
				if(idCheck && pwCheck && pw2Check && rnCheck && cnCheck && ceoCheck && phoneCheck
					&& addressCheck && emailCheck && bankCheck && accountCheck) {
					
					$('#addForm').submit();
					
				} else {
					
					alert('모든 정보를 올바르게 입력하세요.')
				}
				
			});
			
		});
	
	</script>	
	
	
	<script>
	
		// 업체 주소 카카오 주소 api
	    function kakaoAddressApi() {
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



<body id="register_bg">
	
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside>
			<figure>
				<a href="${pageContext.request.contextPath }/resources/html/index.html">
					<img src="${pageContext.request.contextPath }/resources/html/img/logo_sticky.svg" width="155" height="36" alt="" class="logo_sticky">
				</a>
			</figure>
			<form autocomplete="off" id = "addForm" method = "post" action = "${pageContext.request.contextPath }/insertCompany">
				<div class="col form-group">
					<label>아이디</label><span id = "idCheck" class = "check"></span>
					<input class="form-control" type="text" name = "companyId" id = "companyId">
					<i class="ti-user"></i>
					<span id = "idMsg" class = "errorMsg"></span>
				</div>
				
				
				
				<div class="form-group">
					<label>비밀번호</label><span id = "pwCheck" class = "check"></span>
					<input class="form-control" type="password" name = "companyPw" id = "companyPw">
					<i class="icon_lock_alt"></i>
					<span id = "pwMsg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>비밀번호 확인</label><span id = "pw2Check" class = "check"></span>
					<input class="form-control" type="password" name = "companyPw2" id = "companyPw2">
					<i class="icon_lock_alt"></i>
					<span id = "pw2Msg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>사업자 등록번호</label><span id = "comRNCheck" class = "check"></span>
					<input class="form-control" type="text" name = "companyRegistrationNumber" id = "comRN">
					<i class="ti-info-alt"></i>
					<span id = "comRNMsg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>업체 이름</label><span id = "companyNameCheck" class = "check"></span>
					<input class="form-control" type="text" name = "companyName" id = "companyName">
					<i class="ti-user"></i>
					<span id = "companyNameMsg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>대표자 이름</label><span id = "companyCeoCheck" class = "check"></span>
					<input class="form-control" type="text" name = "companyCeo" id = "companyCeo">
					<i class="ti-user"></i>
					<span id = "companyCeoMsg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>업체 전화번호</label><span id = "companyPhoneCheck" class = "check"></span>
					<input class="form-control" type="text" name = "companyPhone" id = "companyPhone">
					<i class="ti-mobile"></i>
					<span id = "companyPhoneMsg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>업체 이메일</label><span id = "companyEmailCheck" class = "check"></span>
					<input class="form-control" type="email" name = "companyEmail" id = "companyEmail">
					<i class="icon_mail_alt"></i>
					<span id = "companyEmailMsg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>업체 주소</label><span id = "companyAddressCheck" class = "check"></span>
					
					<input type="text" id="roadAddress" class = "form-control" placeholder="도로명주소" onchange = "mergeAddress();"readonly = "readonly">
					<input type="text" id="jibunAddress" class = "form-control" placeholder="지번주소" readonly = "readonly">
					<input type="text" id="detailAddress" class = "form-control" placeholder="상세주소">
					<input class="form-control" type="hidden" name = "companyAddress" id = "companyAddress">
					<i class="ti-info-alt"></i>
					<span id = "companyAddressMsg" class = "errorMsg"></span>
					<div style = "display: flex; flex-flow : row nowrap; justify-content : center;">
						<button type="button" onclick="kakaoAddressApi();" class = "btn_1 rounded add_top_10 ">주소 검색</button><br>
					</div>
				</div>
				
				<div>

				
				</div>
				
				
				<div class="form-group">
					<label>업체 은행</label><span id = "companyBankCheck" class = "check"></span>
					<input class="form-control" type="text" name = "companyBank" id = "companyBank">
					<i class="ti-money"></i>
					<span id = "companyBankMsg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>업체 계좌번호</label><span id = "companyAccountCheck" class = "check"></span>
					<input class="form-control" type="text" name = "companyAccount" id = "companyAccount">
					<i class="ti-money"></i>
					<span id = "companyAccountMsg" class = "errorMsg"></span>
				</div>
				
				<div class="form-group">
					<label>이메일 마케팅 수신 여부</label>
					<div>
						<i class="ti-gallery mr-3"></i>&emsp;&emsp;&emsp;
						<input type = "radio" name = "companyEmailMarketing" value = "동의" checked = "checked"> 동의&emsp;
						<input type = "radio" name = "companyEmailMarketing" value = "미동의"> 미동의
					</div>
				</div>
				
				<div class="form-group">
					<label>업종 카테고리</label>
					<div>
						<i class="ti-target"></i>&emsp;&emsp;&emsp;
						<select name = "typeNo" class = "select">
							<c:forEach var="t" items="${typeList }">
								<option value = "${t.typeNo }">${t.typeContent }
							</c:forEach>
						</select>					
					</div>
				</div>
				
				
				
				<div id="pass-info" class="clearfix"></div>
				<button type = "button" id = "addBtn" class="btn_1 rounded full-width add_top_30">Register Now!</button>
				<div class="text-center add_top_10">Already have an acccount? <strong><a href="${pageContext.request.contextPath }/login">Sign In</a></strong></div>
			</form>
			<div class="copy">© Panagea</div>
		</aside>
	</div>
	<!-- /login -->
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/resources/html/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/resources/html/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/resources/html/phpmailer/validate.js"></script>
	
	<!-- SPECIFIC SCRIPTS -->
	<script src="${pageContext.request.contextPath }/resources/html/js/pw_strenght.js"></script>
	
	
	
</body>
</html>