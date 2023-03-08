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
			<form autocomplete="off" method = "post" action = "${pageContext.request.contextPath }/addCompany">
				<div class="form-group">
					<label>아이디</label>
					<input class="form-control" type="text" name = "companyId">
					<i class="ti-user"></i>
				</div>
				
				<div class="form-group">
					<label>비밀번호</label>
					<input class="form-control" type="password" name = "companyPw" id = "companyPw">
					<i class="icon_lock_alt"></i>
				</div>
				
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input class="form-control" type="password" name = "companyPw2" id = "companyPw2">
					<i class="icon_lock_alt"></i>
				</div>
				
				<div class="form-group">
					<label>사업자 등록번호</label>
					<input class="form-control" type="text" name = "companyRegistrationNumber">
					<i class="ti-info-alt"></i>
				</div>
				
				<div class="form-group">
					<label>업체 이름</label>
					<input class="form-control" type="text" name = "companyName">
					<i class="ti-user"></i>
				</div>
				
				<div class="form-group">
					<label>대표자 이름</label>
					<input class="form-control" type="text" name = "companyCeo">
					<i class="ti-user"></i>
				</div>
				
				<div class="form-group">
					<label>업체 전화번호</label>
					<input class="form-control" type="text" name = "companyPhone">
					<i class="ti-mobile"></i>
				</div>
				
				<div class="form-group">
					<label>업체 이메일</label>
					<input class="form-control" type="email" name = "companyEmail">
					<i class="icon_mail_alt"></i>
				</div>
				
				<div class="form-group">
					<label>업체 주소</label>
					<input class="form-control" type="text" name = "companyAddress">
					<i class="ti-info-alt"></i>
				</div>
				
				<div class="form-group">
					<label>업체 은행</label>
					<input class="form-control" type="text" name = "companyBank">
					<i class="ti-money"></i>
				</div>
				
				<div class="form-group">
					<label>업체 계좌번호</label>
					<input class="form-control" type="text" name = "companyAccount">
					<i class="ti-money"></i>
				</div>
				
				<div class="form-group">
					<label>이메일 마케팅 수신 여부</label>
					<div>
						<i class="ti-gallery mr-3"></i>&emsp;&emsp;&emsp;
						<input type = "radio" name = "companyEmailMarketing" value = "동의">동의&emsp;
						<input type = "radio" name = "companyEmailMarketing" value = "미동의">미동의
					</div>
				</div>
				
				<div class="form-group">
					<label>업종 카테고리</label>
					<div>
						<i class="ti-target"></i>&emsp;&emsp;&emsp;
						<select name = typeContent>
							<c:forEach var="t" items="${typeList }">
								<option value = "${t }">${t }
							</c:forEach>
						</select>					
					</div>
				</div>
				
				
				
				<div id="pass-info" class="clearfix"></div>
				<button type = "submit" class="btn_1 rounded full-width add_top_30">Register Now!</button>
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