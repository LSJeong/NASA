<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .blog-author{
     
      margin-top: 20px !important;
   }
   .startbtn{
      border-radius: 20px;
   }
   .blog_details{
      margin-bottom: 20px;
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
      <section class="blog_area single-post-area section-padding">
         <div class="container">
            <div class="row justify-content-center">
            
               <div class="col-lg-8 posts-list"  padding: 3em">
                  <div class="single-post">

                        <div class="feature-img">
                           
                           <img class="img-fluid" src="${knowhowDetail.no_img }" alt="">
                        </div>
                     
                        <div class="blog_details">
                           <h2 class="center" style="border-bottom: 1px solid #d5c9ea; padding-bottom: 20px;">${knowhowDetail.no_title }</h2>
                           <ul class="blog-info-link mt-3 mb-4">
                              <li><a href="#"><i class="fa fa-user"></i> ${knowhowDetail.s_nickname }</a></li>
                              <li><a href="#"><i class="fa fa-calendar"></i>${knowhowDetail.no_date }</a></li>
                           </ul>
                           <p class="excert">
                              ${knowhowDetail.no_subject }
                           </p>
                          <c:if test="${knowhowDetail.no_id eq id }">
                           <div style="text-align: center;">
                              <button class="genric-btn primary small startbtn" onclick="location.href='knowhowUpdateForm.do?no_code=${knowhowDetail.no_code}'">수정</button>
                              <button id="knowDelete" class="genric-btn primary small startbtn">삭제</button>
                           </div>
                          </c:if>
                          
                        </div>
                     
                  </div>

                  <div class="navigation-top">
                     <div class="blog-author">
                        <div class="media align-items-center">
                           <c:choose>
                              <c:when test="${empty sellerInfo.s_img }">
                                 <img src="resources/user/assets/img/profile/search-default-profile.jpg" alt=""
                                 style="cursor: pointer;" onclick="location.href='sellerDetail.do?s_email=${sellerInfo.s_email}'">
                              </c:when>
                              <c:otherwise>
                                 <img src="${sellerInfo.s_img }" alt=""
                                 style="cursor: pointer;" onclick="location.href='sellerDetail.do?s_email=${sellerInfo.s_email}'">
                              </c:otherwise>
						         </c:choose>            
                           <div class="media-body">
                              <a href="#">
                                 <h4 id="sellernick">${sellerInfo.s_nickname }</h4>
                              </a> &nbsp;&nbsp;&nbsp; <span>  <c:choose>
								<c:when test="${sellerInfo.s_rank eq '1' }">
									등급 : 별
								</c:when>
								<c:when test="${sellerInfo.s_rank eq '2' }">
									<p>등급 : 달</p>
								</c:when>
								<c:when test="${sellerInfo.s_rank eq '3' }">
									<p>등급 : 태양</p>
								</c:when>
								<c:when test="${sellerInfo.s_rank eq '4' }">
									<p>등급 : 지구</p>
								</c:when>
								<c:otherwise>
									<p>등급 : 등급확인 불가</p>
								</c:otherwise>
							</c:choose></span>
								
                              <button class="genric-btn primary small startbtn" id="stbtn" style="float: right;" data-toggle="modal" data-target="#chatModal" onclick="chatingcheck()">채팅</button>
								
                              <p>${sellerInfo.s_me }</p>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <script>
      function searchFrm(p){
          if(p){
              frm.pageNum.value = p;
          }
  		frm.submit()
  	};
  	
      	$('#knowDelete').on('click', function(){
      		if(confirm('삭제하시겠습니까?')){
      			$.ajax({
      				url: "knowhowDelete.do",
      				dataType: "text",
      				type:"post",
      				data: {no_code: ${knowhowDetail.no_code }},
      				success: function (result) {
      					console.log(result);
      					if(result){
	      					alert('삭제되었습니다.'); 
	      					location.href='sellerKnowhow.do';
      					}else{
      						alert('일시적인 장애로 삭제 실패하였습니다. \n잠시 후 다시 시도해주세요.');
      					}
      				},
      				error: function(err){
      					alert('일시적인 장애로 삭제 실패하였습니다. \n잠시 후 다시 시도해주세요.');
      				}
      			});
      		}
      	})
		
  function chatingcheck() {
 		if (${empty id}) {
           alert('로그인 후 이용할 수 있습니다.');
            return;
         }
         if (${author ne 'B' }) {
            alert('구매자만 채팅 요청할 수 있습니다.');
            return;
         }
       //판매자 닉네임
       var chatnick = document.querySelector("#sellernick").innerHTML;
       //서비스코드
       var ser_code = 0;
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
	}
      </script>
</body>
</html>