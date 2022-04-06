<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!-- 자바의 import 문처럼 타일즈를 사용하기 위해 반드시 추가해야한다-->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" href="resources/user/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/user/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/user/assets/css/slicknav.css">
<link rel="stylesheet" href="resources/user/assets/css/flaticon.css">
<link rel="stylesheet" href="resources/user/assets/css/animate.min.css">
<link rel="stylesheet" href="resources/user/assets/css/magnific-popup.css">
<link rel="stylesheet" href="resources/user/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="resources/user/assets/css/themify-icons.css">
<link rel="stylesheet" href="resources/user/assets/css/slick.css">
<link rel="stylesheet" href="resources/user/assets/css/nice-select.css">
<link rel="stylesheet" href="resources/user/assets/css/style.css">
</head>
<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<main>
		<tiles:insertAttribute name="body" />
	</main>
	<tiles:insertAttribute name="footer" />

	<!-- JS here -->
	<!-- All JS Custom Plugins Link Here here -->
	<script src="resources/user/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->



	<script src="resources/user/assets/js/popper.min.js"></script>
	<script src="resources/user/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="resources/user/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="resources/user/assets/js/owl.carousel.min.js"></script>
	<script src="resources/user/assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="resources/user/assets/js/wow.min.js"></script>
	<script src="resources/user/assets/js/animated.headline.js"></script>
	<script src="resources/user/assets/js/jquery.magnific-popup.js"></script>

	<!-- Nice-select, sticky -->
	<script src="resources/user/assets/js/jquery.nice-select.min.js"></script>
	<script src="resources/user/assets/js/jquery.sticky.js"></script>

	<!-- contact js -->
	<script src="resources/user/assets/js/contact.js"></script>
	<script src="resources/user/assets/js/jquery.form.js"></script>
	<script src="resources/user/assets/js/jquery.validate.min.js"></script>
	<script src="resources/user/assets/js/mail-script.js"></script>
	<script src="resources/user/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="resources/user/assets/js/plugins.js"></script>
	<script src="resources/user/assets/js/main.js"></script>


</body>
</html>