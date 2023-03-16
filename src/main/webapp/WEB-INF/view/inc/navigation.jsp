<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-default fixed-top" id="mainNav">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/company/home"><img src="${pageContext.request.contextPath }/resources/html/admin_section/img/logo.png" alt="" width="150" height="36"></a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
      	
      	<!-- 상품 관리 -->
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings1">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">상품 관리</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMylistings1">
            <li>
              <a href="${pageContext.request.contextPath }/goods/goodsList">상품 목록</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath }/goods/addGoods">상품 등록</a>
            </li>
			<li>
              <a href="">상품 수정</a>
            </li>
			<li>
              <a href="">상품 삭제</a>
            </li>
          </ul>
        </li>      	
      	
      	<!-- 주문 관리 -->
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings2">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">주문 관리</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMylistings2">
            <li>
              <a href="">주문서 목록<span class="badge badge-pill badge-primary">6</span></a>
            </li>
			<li>
              <a href="">취소 / 교환 / 환불 <span class="badge badge-pill badge-success">6</span></a>
            </li>
          </ul>
        </li>      	
      
      	<!-- 고객 관리 -->
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings3">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">고객 관리</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMylistings3">
            <li>
              <a href="">채팅<span class="badge badge-pill badge-primary">6</span></a>
            </li>
			<li>
              <a href="">리뷰 <span class="badge badge-pill badge-success">6</span></a>
            </li>
          </ul>
        </li>      	
      
      	<!-- 업체 정보 -->
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings4">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">업체 정보</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMylistings4">
            <li>
              <a href="${pageContext.request.contextPath }/company/companyOne">등록정보 조회</a>
            </li>
			<li>
              <a href="${pageContext.request.contextPath }/company/updateCompany">등록정보 수정</a>
            </li>
			<li>
              <a href="${pageContext.request.contextPath }/company/updateCompanyPw">비밀번호 변경</a>
            </li>
          </ul>
        </li>      	
      
      	<!-- 문의 -->
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="My listings">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMylistings5">
            <i class="fa fa-fw fa-list"></i>
            <span class="nav-link-text">문의</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMylistings5">
            <li>
              <a href="${pageContext.request.contextPath }/question/questionCustomerList">고객 문의</a>
            </li>
			<li>
              <a href="${pageContext.request.contextPath }/question/questionPlatformList">플랫폼 문의</a>
            </li>
          </ul>
        </li>      	
      
      
        
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>Jane Smith</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>John Doe</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all messages</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">New Alerts:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control search-top" type="text" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- /Navigation-->
  
  <!-- Logout Modal-->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">정말로 로그아웃 하시겠습니까?</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="${pageContext.request.contextPath }/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>
  
  
  
  