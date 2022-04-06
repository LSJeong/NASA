<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                    <!--     <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="index.html"
                                aria-expanded="false"><i data-feather="home" class="feather-icon"></i><span
                                    class="hide-menu">Dashboard</span></a></li> -->
                       

                    

                        <li class="list-divider"></li>
                        <li class="nav-small-cap"><span class="hide-menu">관리메뉴</span></li>
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i  class=" far fa-user"></i><span
                                    class="hide-menu">회원관리 </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="go_admin.do" class="sidebar-link"><span
                                            class="hide-menu"> 구매자 관리
                                        </span></a>
                                </li>
                                <li class="sidebar-item"><a href="manage_seller.do" class="sidebar-link"><span
                                            class="hide-menu"> 판매자 관리
                                        </span></a>
                                </li>
                            </ul>
                        </li>
                        
                        <!-- <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="manage_category.do"
                                aria-expanded="false"><i class=" fas fa-list-ul mr-1"></i><span
                                    class="hide-menu">카테고리관리</span></a></li> -->
                        
                         <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="manage_service.do"
                                aria-expanded="false"><i class="far fa-star mr-1"></i><span
                                    class="hide-menu">서비스관리</span></a></li>
                                    
                        	<!-- <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i  class=" far fa-star"></i><span
                                    class="hide-menu">서비스관리 </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="manage_service.do" class="sidebar-link"><span
                                            class="hide-menu"> 일반서비스 관리
                                        </span></a>
                                </li>
                                <li class="sidebar-item"><a href="manage_powerService.do" class="sidebar-link"><span
                                            class="hide-menu"> 파워서비스 일정
                                        </span></a>
                                </li> 
                            </ul>
                        </li> -->
                        <!--  <li class="sidebar-item"> <a class="sidebar-link sidebar-link" href="manage_promotion.do"
                                aria-expanded="false"><i class=" fas fa-gift"></i><span
                                    class="hide-menu">프로모션관리</span></a></li> -->
                        
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i  class="icon-credit-card"></i><span
                                    class="hide-menu">결제관리 </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                               <!-- <li class="sidebar-item"><a href="manage_servicePayment.do" class="sidebar-link"><span
                                            class="hide-menu"> 서비스결제관리
                                        </span></a>
                                </li>  -->
                                <li class="sidebar-item"><a href="manage_buyerPayment.do" class="sidebar-link"><span
                                            class="hide-menu"> 구매자결제조회
                                        </span></a>
                                </li>
                                <li class="sidebar-item"><a href="manage_sellerPayment.do" class="sidebar-link"><span
                                            class="hide-menu"> 판매자결제조회
                                        </span></a>
                                </li>
                            </ul>
                        </li>  
                        
                        
                           <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i  class="fas fa-chart-line"></i><span
                                    class="hide-menu">매출조회 </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                               <!--  <li class="sidebar-item"><a href="sales_category.do" class="sidebar-link"><span
                                            class="hide-menu"> 카테고리별매출
                                        </span></a>
                                </li> -->
                                <li class="sidebar-item"><a href="all_sales.do" class="sidebar-link"><span
                                            class="hide-menu"> 전체매출
                                        </span></a>
                                </li>
                            </ul>
                        </li>  
                        
                         <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i  class=" far fa-bell mr-1"></i><span
                                    class="hide-menu">신고관리 </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="report_inquiry.do" class="sidebar-link"><span
                                            class="hide-menu"> 신고관리
                                        </span></a>
                                </li>
                                <li class="sidebar-item"><a href="manageBlackList.do" class="sidebar-link"><span
                                            class="hide-menu"> 블랙리스트관리
                                        </span></a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i  class=" fas fa-edit"></i><span
                                    class="hide-menu">게시글관리 </span></a>
                            <ul aria-expanded="false" class="collapse  first-level base-level-line">
                                <li class="sidebar-item"><a href="manage_sellerBoard.do" class="sidebar-link"><span
                                            class="hide-menu"> 판매자노하우
                                        </span></a>
                                </li>
                                
                            </ul>
                        </li>
      
                      <!--   <li class="sidebar-item"> <a class="sidebar-link has-arrow" href="javascript:void(0)"
                                aria-expanded="false"><i class="fas fa-edit mr-1"></i><span
                                    class="hide-menu">게시글관리</span></a>
                            <ul aria-expanded="false" class="collapse first-level base-level-line">
                                
                                <li class="sidebar-item"> <a class="has-arrow sidebar-link" href="javascript:void(0)"
                                        aria-expanded="false"><span class="hide-menu">공지사항</span></a>
                                    <ul aria-expanded="false" class="collapse second-level base-level-line">
                                        <li class="sidebar-item"><a href="manage_notice.do" class="sidebar-link"><span
                                                    class="hide-menu"> 공지사항 조회</span></a></li>
                                        <li class="sidebar-item"><a href="InsertNoticeForm.do" class="sidebar-link"><span
                                                    class="hide-menu"> 공지사항 등록
                                                    </span></a></li>
                                        
                                    </ul>
                                </li>
                                <li class="sidebar-item"> <a class="has-arrow sidebar-link" href="javascript:void(0)"
                                        aria-expanded="false"><span class="hide-menu">FAQ</span></a>
                                    <ul aria-expanded="false" class="collapse second-level base-level-line">
                                        <li class="sidebar-item"><a href="manage_faq.do" class="sidebar-link"><span
                                                    class="hide-menu"> FAQ 조회</span></a></li>
                                        <li class="sidebar-item"><a href="insertFaqForm.do" class="sidebar-link"><span
                                                    class="hide-menu"> FAQ 등록
                                                    </span></a></li>
                                        
                                    </ul>
                                </li>
                            </ul>
                        </li> -->
                        
                        
                        
                        
                    
                     
                        
                        
                      
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>