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

<body id="login_bg">
	
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
			  <form method = "post" action = "${pageContext.request.contextPath }/login">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" name="companyId" id="companyId">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" name="companyPw" id="companyPw">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_30">
					<div class="float-end mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<button type = "submit" class="btn_1 rounded full-width">Login</button>
				<div class="text-center add_top_10">New to Panagea? <strong><a href="${pageContext.request.contextPath }/insertCompany">Sign up!</a></strong></div>
			</form>
			<div class="copy">© Panagea</div>
		</aside>
	</div>
	<!-- /login -->
		
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/resources/html/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/resources/html/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/resources/html/phpmailer/validate.js"></script>	
  
</body>
</html>