<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="resources/user/assets/js/vendor/jquery-1.12.4.min.js"></script> 
</head>
<body>
<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="resources/user/assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area header-transparent">
            <div class="main-header">
                <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                    <a href="home.do"><img src="resources/user/assets/img/nasalogo2.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="homeCategory.do">서비스 찾기</a></li>
                                            <li><a href="go_knowhowlist.do">판매자의 노하우</a></li>
                                            <!--가입-->
                                            <c:if test="${empty id }">
                                                <li><a>회원가입</a>
                                                    <ul class="submenu">
                                                        <li><a href="buyerJoin.do" style="text-shadow: 1px 1px 2px #5c5a5a, 0 0 10px #5c5a5a, 0 0 5px #5c5a5a;">구매자</a></li>
                                                        <li><a href="sellerJoin.do" style="text-shadow: 1px 1px 2px #5c5a5a, 0 0 10px #5c5a5a, 0 0 5px #5c5a5a;">판매자</a></li>
                                                    </ul>
                                                </li>
                                            </c:if>                                            
                                            <c:if test="${not empty id }">
                                                <li><a href="chatting.do">채팅하기</a></li>
                                            </c:if>
                                            <!--회원유형-->
                                            <c:if test="${author eq 'S' }">
                                                <li><a href="goSellerMypage.do">마이페이지</a></li>
                                            </c:if>
                                            <c:if test="${author eq 'B' }">
                                                <li><a href="goBuyerMypage.do">마이페이지</a></li>
                                            </c:if>
                                            <c:if test="${author eq 'ad' }">
                                                <li><a href="go_admin.do">관리자</a></li>
                                            </c:if>                                           
                                            <c:if test="${empty id }">
                                                <li class="login"><a href="Login.do"><i class="ti-user"></i>로그인</a></li>
                                            </c:if>
                                            <c:if test="${not empty id }">
                                                <li><a href="logout.do"><i class="ti-user"></i> ${nickname } 님 || 로그아웃</a></li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
</body>
</html>