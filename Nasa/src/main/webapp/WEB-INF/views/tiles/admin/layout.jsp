<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<!-- 자바의 import 문처럼 타일즈를 사용하기 위해 반드시 추가해야한다-->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="resources/admin/assets/images/favicon.png">
    <!-- Custom CSS -->
    <link href="resources/admin/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="resources/admin/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="resources/admin/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="resources/admin/dist/css/style.min.css" rel="stylesheet">
    <script src="resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
  
    
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
	<div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="sidebar-left">
			<tiles:insertAttribute name="menu" />
		</div>
		<div class="page-wrapper">
			<tiles:insertAttribute name="body" />
			
				<!-- Modal -->
				   <div id="logOutModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="dark-header-modalLabel" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header modal-colored-header bg-primary">
                                                <h4 class="modal-title" id="dark-header-modalLabel">LOG OUT</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <div class="modal-body">
                                               	<div class="mb-2">로그아웃 하시겠습니까?</div>
                                               	메인으로 돌아갑니다.	                        
                                  
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" id="logBtn" class="btn btn-outline-primary">LOG OUT</button>
                                                <button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	 </div>
	 
	 
	 
	<script>
	const handleLogOut=()=>{
		location.href="logout.do"
	    $("#logBtn").attr("data-dismiss","modal");
	}
	$("#logBtn").on("click",handleLogOut);
	</script>
    
    
    <!-- apps -->
    
    
 	<script src="resources/admin/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
       
    <script src="resources/admin/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
	<script src="resources/admin/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="resources/admin/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <script src="resources/admin/dist/js/app-style-switcher.js"></script>
    <script src="resources/admin/dist/js/feather.min.js"></script>
    <script src="resources/admin/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="resources/admin/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="resources/admin/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="resources/admin/assets/extra-libs/c3/d3.min.js"></script>
    <script src="resources/admin/assets/extra-libs/c3/c3.min.js"></script>
   
    
    <script src="resources/admin/assets/libs/chartist/dist/chartist.min.js"></script>
    
    <script src="resources/admin/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="resources/admin/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="resources/admin/dist/js/pages/dashboards/dashboard1.min.js"></script>
    <script src="resources/admin/assets/libs/raphael/raphael.min.js"></script>
    <script src="resources/admin/assets/libs/morris.js/morris.min.js"></script>
    <script src="resources/admin/dist/js/pages/morris/morris-data.js"></script>
    
    
    <script src="resources/admin/assets/libs/moment/min/moment.min.js"></script>
    <script src="resources/admin/assets/libs/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="resources/admin/dist/js/pages/calendar/cal-init.js"></script>
    

    

</body>
</html>