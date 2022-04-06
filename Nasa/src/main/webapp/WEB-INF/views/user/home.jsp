<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
   <title>Home</title>
   <style>
       .cardimg {
           height: 80px;
       }
       .cardmain {
           border: none;           
       }
       .cardcate {
           text-align: center;
       }
       .powerimg {
           width: 82px;
           height: 82px;
           display: block;
           margin: 0px auto;
           border-radius: 70%;
           overflow: hidden;
       }
       .powerp {
           overflow: hidden;
           text-overflow: ellipsis;
           white-space: nowrap;
       }
       .card-body {
           cursor:pointer;
       }

       .wishplus {
           color: pink;
           cursor: pointer;
       }

       .wishplus:hover {
           color: black;
       }

       .wishminus:hover {
           color: black;
       }

       #knohowlink {
           color:black !important;
       }
       .rprp {
           text-shadow: 1px 1px 2px #7d64aa, 0 0 10px #7d64aa, 0 0 5px #7d64aa;
       }

       .sertitleh {
        overflow: hidden;
        text-overflow: ellipsis;
        display: block;
        white-space: nowrap;
       }
   </style>
   
</head>
<body>

<!-- Hero Start-->
<div class="hero-area3 hero-overly2 d-flex align-items-center ">
    <div class="container" style="margin-top: 65px;">
        <div class="row justify-content-center">
            <div class="col-xl-8 col-lg-9">
                <div class="hero-cap text-center pt-50 pb-20">
                    <h2>NASA</h2>
                </div>
                <!--Hero form -->
                <form id="frm" action="homeCategory.do" class="search-box search-box2">
                	<div class="input-form">
                		<input type="text" name="ser_title" placeholder="어떤 서비스가 필요하세요?" value="${param.ser_title}">
                	</div>
                		<div class="select-form">
                			<div class="select-itms">
                				<select name="ser_cate">
                					<option value="" <c:if test="${param.ser_cate==''}">selected</c:if>>통합검색</option>
                                    <option value="CAT1" <c:if test="${param.ser_cate=='CAT1'}">selected</c:if>>앱</option>
                                    <option value="CAT2" <c:if test="${param.ser_cate=='CAT2'}">selected</c:if>>웹</option>
                                    <option value="CAT3" <c:if test="${param.ser_cate=='CAT3'}">selected</c:if>>게임</option>
                                    <option value="CAT4" <c:if test="${param.ser_cate=='CAT4'}">selected</c:if>>보안</option>
                                    <option value="CAT5" <c:if test="${param.ser_cate=='CAT5'}">selected</c:if>>기술지원</option>
                                    <option value="CAT6" <c:if test="${param.ser_cate=='CAT6'}">selected</c:if>>기획</option>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" name="pageNum" value="1">
                        <input type="hidden" name="amount" value="1">
                        <!-- Search box -->
                        <div class="search-form" onclick="searchFrm()">
                            <a href="#">Search</a>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Hero End -->
<!-- Popular Locations Start -->
<div class="popular-location section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Section Tittle -->
                <div class="col-lg-12 col-md-6 col-sm-6" style="margin-top: 30px;">
                    <div class="h1-testimonial-active">
                        <c:forEach items="${rplist }" var="rp" begin="0" end="0" step="1">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="single-location mb-30" style="text-align: left;">
                                    <div class="location-img">
                                        <img src="resources/user/assets/img/mainevent3.jpg" alt="" style="height: 380px">
                                    </div>
                                    <div class="location-details">
                                        <p class="rprp">${rp.nickname } 님의 [ ${rp.ser_title } ] 서비스 할인 중!</p>
                                        <a href="serviceDetail.do?ser_code=${rp.ser_code }" class="location-btn"> <i class="ti-plus"></i>더보기</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:forEach items="${rplist }" var="rp" begin="1" end="1" step="1">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="single-location mb-30" style="text-align: left;">
                                    <div class="location-img">
                                        <img src="resources/user/assets/img/mainevent.jpg" alt="" style="height: 380px">
                                    </div>
                                    <div class="location-details">
                                        <p class="rprp">${rp.nickname } 님의 [ ${rp.ser_title } ] 서비스 할인 중!</p>
                                        <a href="serviceDetail.do?ser_code=${rp.ser_code }" class="location-btn"> <i class="ti-plus"></i>더보기</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>                            
                </div>                        
            </div>
        </div>                
    </div>
</div>
<div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row d-flex justify-content-between mx-5" style="margin-top: 30px;">
                    <div class="cardmain" >
                        <div class="card-body" onclick="location.href='homeCategory.do?ser_cate=CAT1'">
                        	<div>
                                <img src="resources/user/assets/img/maincate/app.png" alt="" class="cardimg">
                            </div>
                            <br>                      
                            <div class="cardcate cat-cap"><p>앱 개발</p></div>
                        </div>
                    </div>
                    <div class="cardmain">
                        <div class="card-body" onclick="location.href='homeCategory.do?ser_cate=CAT2'">
                        	<div>
                        		<img src="resources/user/assets/img/maincate/web.png" alt="" class="cardimg">
                            </div>
                            <br>
                            <div class="cardcate cat-cap"><p>웹 개발</p></div>
                        </div>
                    </div>
                    <div class="cardmain">
                        <div class="card-body" onclick="location.href='homeCategory.do?ser_cate=CAT3'">
                        	<div>
                                <img src="resources/user/assets/img/maincate/game.png" alt="" class="cardimg">
                            </div>
                            <br>
                            <div class="cardcate cat-cap"><p>게임 개발</p></div>
                        </div>
                    </div>
                    <div class="cardmain">
                        <div class="card-body" onclick="location.href='homeCategory.do?ser_cate=CAT4'">
                        	<div>
                                <img src="resources/user/assets/img/maincate/secu.png" alt="" class="cardimg"> 
                            </div>
                            <br>
                            <div class="cardcate cat-cap"><p>보안</p></div>
                        </div>
                    </div>
                    <div class="cardmain">
                        <div class="card-body" onclick="location.href='homeCategory.do?ser_cate=CAT5'">
                        	<div>
                                <img src="resources/user/assets/img/maincate/support.png" alt="" class="cardimg"> 
                            </div>
                            <br>
                            <div class="cardcate cat-cap"><p>기술 지원</p></div>
                        </div>
                    </div>
                    <div class="cardmain">
                        <div class="card-body" onclick="location.href='homeCategory.do?ser_cate=CAT6'">
                        	<div>
                                <img src="resources/user/assets/img/maincate/project.png" alt="" class="cardimg"> 
                            </div>
                            <br>
                            <div class="cardcate cat-cap"><p>기획</p></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="categories-area section">
    <div class="container">                
        <div class="row">
            <div class="col-lg-12">
                <div class="section-tittle text-center mb-80" style="margin: 80px; margin-bottom: 30px;">
                    <span>Power Service</span>
                    <h2>파워 서비스</h2>
                </div>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-12">
                <div class="h1-testimonial-active">
                    <!-- Single Testimonial -->
                    <div class="single-testimonial text-center">
                        <!-- Testimonial Content -->
                        <div class="testimonial-caption d-flex" style="margin-left: 5px; margin-right: 5px;">
                            <c:forEach items="${powerlist }" var="power" begin="0" end="3" step="1">
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="single-cat text-center mb-50" style="height: 300px; padding: 30px;">
                                        <div>
                                            <c:choose>
                                                <c:when test="${empty power.s_img }">
                                                    <img class="powerimg" src="resources/user/assets/img/profile/defaultprofileimg.png" alt="">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="powerimg" src="${power.s_img }" alt="">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="cat-cap" style="padding: 10px;">
                                            <h5><a>${power.s_nickname }</a></h5>
                                            <p class="powerp">${power.ser_title }</p>
                                            <a href="serviceDetail.do?ser_code=${power.ser_code }">상세보기</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- Single Testimonial -->
                    <div class="single-testimonial text-center">
                        <!-- Testimonial Content -->
                        <div class="testimonial-caption d-flex" style="margin-left: 5px; margin-right: 5px;">
                            <c:forEach items="${powerlist }" var="power" begin="4" end="7" step="1">
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="single-cat text-center mb-50" style="height: 300px; padding: 30px;">
                                        <div>
                                            <c:choose>
                                                <c:when test="${empty power.s_img }">
                                                    <img class="powerimg" src="resources/user/assets/img/profile/defaultprofileimg.png" alt="">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="powerimg" src="${power.s_img }" alt="">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="cat-cap" style="padding: 10px;">
                                            <h5><a>${power.s_nickname }</a></h5>
                                            <p>${power.ser_title }</p>
                                            <a href="serviceDetail.do?ser_code=${power.ser_code }">상세보기</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- peoples-visit Start -->
<div class="peoples-visit dining-padding-top">
    <!-- Single Left img -->
    <div class="single-visit left-img">
        <div class="container">
            <div class="row justify-content-end">
                <div class="col-lg-8">
                    <div class="visit-caption">
                        <span>You may also like this</span>
                        <h3>이런 서비스는 어떠세요?</h3>
                        <p>고객님의 관심사에 맞추어 자동으로 추천되는 서비스입니다.</p>
                        <!--Single Visit categories -->
                        <c:forEach items="${recommendService}" var="rs">
                            <div class="visit-categories mb-40">
                                <div class="visit-location">
                                    <span class="flaticon-travel"></span>
                                </div>
                                <div class="visit-cap">
                                    <h4 style="font-size: 25px;">${rs.ser_title}</h4>
                                    <p>[${rs.cat_name}] - [${rs.sub_name}]</p>
                                    <p>판매자 ${rs.s_nickname}</p>
                                    <br>
                                    <a href="serviceDetail.do?ser_code=${rs.ser_code}" class="genric-btn primary">Read More</a>
                                </div>
                            </div>
                            <br>
                        </c:forEach>
                        <!--<div class="visit-categories mb-40">
                            <div class="visit-location">
                                <span class="flaticon-travel"></span>
                            </div>
                            <div class="visit-cap">
                                <h4>웹개발꽁짜로가르쳐드립니다~</h4>
                                <p>[카테고리1] - [카테고리2]</p>
                                <p>판매자 홍길동 님</p>
                                <br>
                                <a href="#" class="genric-btn primary">Read More</a>
                            </div>
                        </div>
                        <br>
                        
                        <div class="visit-categories">
                            <div class="visit-location">
                                <span class="flaticon-work"></span>
                            </div>
                            <div class="visit-cap">
                                <h4>CSS 전문가의 1대1 과외</h4>
                                <p>[카테고리1] - [카테고리2]</p>
                                <p>판매자 김기자 님</p>
                                <br>
                                <a href="#" class="genric-btn primary">Read More</a>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- peoples-visit End -->
<div class="listing-details-area">
    <div class="container">                
        <div class="row">
            <div class="col-lg-12">
                <!-- Section Tittle -->
                <div class="section-tittle text-center mb-80" style="margin: 80px; margin-bottom: 30px;">
                    <span>Most Popular Service</span>
                    <h2>인기있는 서비스</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${bestservicelist }" var="bestservice" begin="0" end="2" step="1">
                <div class="col-lg-4 col-md-6">
                    <div class="single-listing mb-30">
                        <div class="list-img">
                            <img src="${bestservice.ser_img }" alt="" style="width: 370px; height: 258px;">
                            <!-- <span>Open</span> -->
                        </div>
                        <div class="list-caption" style="width: 370px; height: 200px;">
                            <span>BEST!</span>
                             <a href="serviceDetail.do?ser_code=${bestservice.ser_code }">
                             	<h3 style="padding: 0px; overflow: hidden; text-overflow: ellipsis;
                             	white-space: nowrap; font-weight: bold; font-size: 23px;">${bestservice.ser_title }</h3></a>
                            <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; height: 30px;">${bestservice.ser_sub }</p>
                            <div class="list-footer">
                                <ul>
                                    <li>${bestservice.category }</li>
                                    <li>${bestservice.sub_category }</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>                
            </c:forEach>
        </div>
    </div>
</div>
<div class="listing-details-area">
    <div class="container">                
        <div class="row">
            <div class="col-lg-12">
                <!-- Section Tittle -->
                <div class="section-tittle text-center mb-80" style="margin: 80px; margin-bottom: 30px;">
                    <span>Most Popular Seller</span>
                    <h2>인기있는 판매자</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <c:forEach items="${bestsellerlist }" var="bestseller" begin="0" end="2" step="1">
                <div class="col-lg-4 col-md-6">
                    <div class="single-listing mb-30">
                        <div class="list-img">
                            <c:choose>
							    <c:when test="${empty bestseller.s_img }">
								    <img src="resources/user/assets/img/search-default-profile-s.jpg" alt="" style="width: 370px; height: 370px;">
							    </c:when>
							    <c:otherwise>
								    <img src="${bestseller.s_img }" alt="" style="width: 370px; height: 370px;">
							    </c:otherwise>
						    </c:choose>
                            <!-- <span>Open</span> -->
                        </div>
                        <div class="list-caption" style="width: 370px; height: 190px;">
                            <span>BEST!</span>
                             <h3 id="bestnickname"><a href="sellerDetail.do?s_email=${bestseller.s_email }">${bestseller.s_nickname }</a></h3>
                            <p style="height: 30px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${bestseller.s_me }</p>
                            <div class="list-footer">
                                <ul>

                                      <li id="mainchatting" style="cursor: pointer;">채팅하기</li>
                                    <c:if test="${author eq 'B'}">
                                        <li><i class="fa fa-heart wishplus" data-toggle="tooltip" data-placement="top" title="위시리스트 추가" onclick="wishplus(this, '${bestseller.s_nickname}')"></i>
                                            <i class="fa fa-heart wishminus" data-toggle="tooltip" data-placement="top" title="위시리스트 제거" onclick="wishminus(this, '${bestseller.s_nickname}')" style="display:none"></i></li>
                                    </c:if>
                                    <!--<li>찜하기</li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>                
            </c:forEach>            
        </div>
    </div>
</div>

<!-- Categories Area Start -->
<div class="home-blog-area section-padding30">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Section Tittle -->
                <div class="section-tittle text-center mb-70">
                    <span>Seller's Know-how</span>
                    <h2>판매자의 노하우</h2><a id="knohowlink" href="go_knowhowlist.do" style="width:100px; margin-left:90%; padding-bottom: 4px; border-bottom: 5px solid #7d64aa;">전체 보기</a>
                </div> 
            </div>
        </div>
        <div class="row">
            <c:forEach items="${knowhowlist }" var="knowhow" begin="0" end="2" step="1">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-team mb-30">
                        <div class="team-img">
                            <img src="${knowhow.no_img }" alt="" style="width: 370px; height: 440px;">
                        </div>
                        <div class="team-caption">
                            <span>${knowhow.s_nickname }</span>
                            <h3><a href="knowhowDetail.do?no_code=${knowhow.no_code }">${knowhow.no_title }</a></h3>
                            <p>${knowhow.no_date }</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
	          $('[data-toggle="tooltip"]').tooltip();   
    });
    function wishplus(event, nickname) {
        $.ajax({
            url:"wishplus.do",
            type:"post",
            data:{
                nickname:nickname
            },
            success: function(code) {
                if(code == "plus") {
                    $(event).hide();
                    console.log(event.nextSibling);
                    $(event.nextElementSibling).show();
                }
            }
        })
    }

    function wishminus(event, nickname) {
        $.ajax({
            url:"wishminus.do",
            type:"post",
            data:{
                nickname:nickname
            },
            success: function(code) {
                if(code == "minus") {
                    $(event).hide();
                    $(event.previousElementSibling).show();
                }
            }
        })
    }

    function searchFrm(p){
        if(p){
            frm.pageNum.value = p;
        }
		frm.submit()
	}
</script>
</body>
<script type="text/javascript">
    $("#mainchatting").on("click", function(){
        var chatnick = document.querySelector('#bestnickname').children[0].innerHTML;
        $.ajax({
            url:"mainchatting.do",
            type:"post",   
            data:{
                chatnick:chatnick
            },
            success: function(code) {
                   location.replace('chatting.do');
            }
        })
    })


 
</script>

</html>