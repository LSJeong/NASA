<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <style>
      .subrule {
         font-size: 16px;
         font-weight: bold;
         margin-top: 30px;
      }
      .subcon {
         font-size: 14px;
         margin-left: 16px;
      }
      .tab-pane {
         padding: 0px;
         padding-right: 16px !important;
      }

      .single_sidebar_widget {
         margin-bottom: 0px !important;
      }

      .br {
         margin: 0px !important;
      }

      .fables-single-item {
         color: rgb(64, 64, 64);
      }

      .fables-single-item:hover {
         background-color: tomato;
      }

      .nav-link.active {
         background-color: #1f2b7b !important;
         color: white !important;
      }

      .revtext {
         color: #777777;
      }

      .comments-area {
         margin-top: 30px;
      }

      .revimg {
         width: 200px;
         height: 100px;
      }

      .btn-reply1 {
         background-color: transparent;
         color: #888888;
         font-size: 14px;
         font-weight: 400;
      }

      .tab-pane {
         padding: 1em;
      }

      .img-fluid {
         width: 770px;
         height: 375px;
      }

      .subimg {
         max-width: 100%
      }

      .comment {
         white-space: pre-line;
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

      .price img {
         width: 100px;
         height: 28px;
      }

      .price {
         float: right;
         font-size: 25px !important;
         font-weight: bold;
      }

      .serviceinfo {
         font-size: 20px;
         font-weight: bold;
         border-bottom: 2px solid rgb(242 243 247);
         margin-bottom: 8px;
         color: #2f1f48;
      }

      .serviceinfoo {
         margin-left: 10px;
         margin-bottom: 70px;
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
                     <input type="text" name="ser_title" placeholder="?????? ???????????? ????????????????" value="${param.ser_title}">
                  </div>
                  <div class="select-form">
                     <div class="select-itms">
                        <select name="ser_cate">
                           <option value="" <c:if test="${param.ser_cate==''}">selected</c:if>>????????????</option>
                           <option value="CAT1" <c:if test="${param.ser_cate=='CAT1'}">selected</c:if>>???</option>
                           <option value="CAT2" <c:if test="${param.ser_cate=='CAT2'}">selected</c:if>>???</option>
                           <option value="CAT3" <c:if test="${param.ser_cate=='CAT3'}">selected</c:if>>??????</option>
                           <option value="CAT4" <c:if test="${param.ser_cate=='CAT4'}">selected</c:if>>??????</option>
                           <option value="CAT5" <c:if test="${param.ser_cate=='CAT5'}">selected</c:if>>????????????</option>
                           <option value="CAT6" <c:if test="${param.ser_cate=='CAT6'}">selected</c:if>>??????</option>
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
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="feature-img">
                     <img class="img-fluid" src="${detailS.ser_img }" alt="">
                  </div>
                  <div class="blog_details">
                     <nav class="fables-single-nav">
                        <c:choose>
                           <c:when test="${tabcode eq 'r'}">
                              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font border-0 rounded-0 py-3"
                                    id="nav-desc-tab" data-toggle="tab" href="#nav-desc" role="tab"
                                    aria-controls="nav-desc" aria-selected="false">???????????????</a>
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
                                    id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab"
                                    aria-controls="nav-info" aria-selected="false">??????????????????</a>
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3 active"
                                    id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab"
                                    aria-controls="nav-review" aria-selected="true">??????</a>
                              </div>
                           </c:when>
                           <c:otherwise>
                              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after px-3 px-md-5 font-15 semi-font border-0 active rounded-0 py-3"
                                    id="nav-desc-tab" data-toggle="tab" href="#nav-desc" role="tab"
                                    aria-controls="nav-desc" aria-selected="true">???????????????</a>
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
                                    id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab"
                                    aria-controls="nav-info" aria-selected="false">??????????????????</a>
                                 <a class="fables-single-item nav-link fables-forth-text-color fables-second-active fables-second-hover-color fables-forth-after border-0 px-3 px-md-5 font-15 semi-font rounded-0 py-3"
                                    id="nav-review-tab" data-toggle="tab" href="#nav-review" role="tab"
                                    aria-controls="nav-review" aria-selected="false">??????</a>
                              </div>
                           </c:otherwise>
                        </c:choose>

                     </nav>
                     <div class="tab-content" id="nav-tabContent">
                        <c:choose>
                           <c:when test="${tabcode eq 'r'}">
                              <div class="tab-pane fade" id="nav-desc" role="tabpanel" aria-labelledby="nav-desc-tab">
                           </c:when>
                           <c:otherwise>
                              <div class="tab-pane fade show active" id="nav-desc" role="tabpanel"
                                 aria-labelledby="nav-desc-tab">
                           </c:otherwise>
                        </c:choose>

                        
						
                        <c:if
                           test="${detailS.ser_subimg ne null || detailS.ser_subimg2 ne null || detailS.ser_subimg3 ne null}">
                           <div class="h1-testimonial-active" style="text-align: center;">
                              <!-- <h5><u>????????? ?????????</u></h5> -->
                              <c:if test="${detailS.ser_subimg ne null}">
                                 <div class="single-testimonial text-center">
                                    <!-- Testimonial Content -->
                                    <div class="single-location mb-30">
                                       <div class="location-img">
                                          <img src="${detailS.ser_subimg }" alt=""
                                             style="width: 753px; height: 375px;">
                                       </div>
                                       <div class="location-details">

                                       </div>
                                    </div>
                                 </div>
                              </c:if>
                              <c:if test="${detailS.ser_subimg2 ne null}">
                                 <div class="single-testimonial text-center">
                                    <!-- Testimonial Content -->
                                    <div class="single-location mb-30">
                                       <div class="location-img">
                                          <img src="${detailS.ser_subimg2 }" alt=""
                                             style="width: 753px; height: 375px;">
                                       </div>
                                       <div class="location-details">

                                       </div>
                                    </div>
                                 </div>
                              </c:if>
                              <c:if test="${detailS.ser_subimg3 ne null}">
                                 <div class="single-testimonial text-center">
                                    <!-- Testimonial Content -->
                                    <div class="single-location mb-30">
                                       <div class="location-img">
                                          <img src="${detailS.ser_subimg3 }" alt=""
                                             style="width: 753px; height: 375px;">
                                       </div>
                                       <div class="location-details">

                                       </div>
                                    </div>
                                 </div>
                              </c:if>
                           </div>


                        </c:if>

                        <div class="quote-wrapper"
                           style="padding: 10px !important; color: #10285D; font-style: normal;">
                           <div class="quotes" style="color: #2f1f48;white-space:pre-line;">
                              ${detailS.ser_sub }
                           </div>
                        </div>
                        <br>
                        <br>



                        

                        <!-- <br/><br/>
                                 <h5><u>????????? ??????</u></h5>
                                 <p class="excert" id="ser_sub" style="white-space:pre-line;">
                                    ${detailS.ser_sub }
                                 </p> -->

                        <!-- <hr /> -->
                        <div>
                           <div class="serviceinfoo">
                              <div class="serviceinfo">????????????</div>
                              <p>???${detailS.ser_skill }</p>
                           </div>
                           
                           <div class="serviceinfoo">
                              <div class="serviceinfo">??? ??????</div>
                           <p>???${detailS.ser_team }</p>
                           </div>
                           
                           
                           <c:if test="${detailS.ser_lang ne null}">
                           <div class="serviceinfoo">
                              <div class="serviceinfo">????????????</div>
                              <p>???${detailS.ser_lang }</p>
                           </div>                           
                           </c:if>

                           <c:if test="${detailS.ser_frame ne null}">
                              <div class="serviceinfoo">
                                 <div class="serviceinfo">???????????????</div>
                              <p>???${detailS.ser_frame }</p>
                              </div>                           
                           </c:if>

                           <c:if test="${detailS.ser_dbms ne null}">
                              <div class="serviceinfoo">
                                 <div class="serviceinfo">DBMS</div>
                                 <p>???${detailS.ser_dbms }</p>
                              </div>
                              
                           </c:if>

                           <div class="serviceinfoo">
                              <div class="serviceinfo">???????????????</div>                           
                              <p>???${detailS.ser_line }</p>
                           </div>
                           

                           <c:if test="${detailS.ser_offer ne null}">
                              <div class="serviceinfoo">
                                 <div class="serviceinfo">????????????</div>
                                 <p style="white-space: pre-line;">???${detailS.ser_offer }</p> 
                              </div>                                                          
                           </c:if>
                        </div>
                        
                        



                     </div>
                     <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">                        
                        <div class="quote-wrapper"
                        style="padding: 10px !important; color: #10285D; font-style: normal;">
                        <div class="quotes" style="color: #2f1f48;">
                        <div class="serviceinfo">?????? ??? ?????? ??????</div>

                        <div class="subrule">???. ?????? ?????? ??????</div>

                        <div class="subcon">1. ???????????? ???????????? ?????? ???????????? ?????? ?????? ??? ????????? ???????????????.<br>
                           2. ????????? ????????? ?????? ?????? ??????, ???????????? ??? ???????????? ????????? ???????????? ????????? ???????????????.<br>
                        (?????????????????? 17??? 2?????? 5???. ?????? ?????? ????????????????????? ???????????? ???2??? ???5?????? ????????????????????? ????????? ????????? ????????? ??????)</div>
                        
                        <div class="subrule">???. ????????? ?????? ??????</div>

                        <div class="subcon">1. ???????????? ??????????????? ?????? ???????????? ????????? ????????? ?????? ???????????? ???????????? ???????????? ?????? ????????? ?????? ?????? ?????? ?????? ?????????
                        ???????????????.</div>

                        <div class="subrule">???. ????????? ?????? ??????</div>

                        <div class="subcon">1. ????????? ?????? ?????? ???????????? ??????????????? ?????? ????????? ????????? ??????, ?????? ????????? ????????? ?????? ?????? ??? ??? ????????? 10%??? ????????????
                        ???????????????.<br><br>
                        ??? ???????????? 1/3 ?????? ??? : ?????? ????????? ????????? 2/3?????????<br>
                        ??? ???????????? 1/2 ?????? ??? : ?????? ????????? ????????? 1/2?????????<br>
                        ??? ???????????? 1/2 ?????? ??? : ???????????? ??????</div>

                        </div>                     

                           
                        </div>
                     </div>
                     <c:choose>
                        <c:when test="${tabcode eq 'r'}">
                           <div class="tab-pane fade show active" id="nav-review" role="tabpanel"
                              aria-labelledby="nav-review-tab">
                        </c:when>
                        <c:otherwise>
                           <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
                        </c:otherwise>
                     </c:choose>
                     <br /><br />
                     <!-- ????????? ????????? ????????? ??? ????????? ???????????? ?????? ?????? -->
                     <c:if test="${author eq 'B'}">
                        <form id="reviewform" action="writeReview.do" method="post" enctype="multipart/form-data">
                           <div id="writeReview">
                              <div class="serviceinfo">?????? ??????</div>
                              <br>
                              <div class="d-flex">
                                 <input type="hidden" id="hscode" name="scode" value="${detailS.ser_code}">
                                 <input type="hidden" name="rev_ser_name" value="${detailS.ser_title}">
                                 <h5 style="font-size:15px; margin-right:10px; margin-top:10px;">??????</h5>
                                 <select id="rev_rate" name="rev_rate" style="width:200px;">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                 </select>
                              </div>
                              <textarea id="rev_sub" name="rev_sub" placeholder="????????? ??????????????????"
                                 style="width:100%; height:100px; margin-top:5px" required></textarea>
                              <div>
                                 <input type="file" id="reviewimgUpload" name="reviewimg" accept="image/*"
                                    style="display:none;">
                                 <label class="genric-btn primary" for="reviewimgUpload">????????????</label>
                                 <img id="reviewimg" alt=""
                                    style="width: 42px; height:42px; margin-left:10px; overflow: hidden; border-color:white;">
                                 <button type="button" class="genric-btn primary float-right"
                                    onclick="reviewQualifications('${detailS.ser_code}')">?????? ??????</button>
                              </div>
                           </div>
                        </form>
                     </c:if>
                     <form style="display:none;">
                        <div id="writeReview">
                           <h5>?????? ??????</h5>
                           <div class="d-flex">
                              <input type="hidden" name="scode" value="${detailS.ser_code}">
                              <input type="hidden" name="rev_ser_name" value="${detailS.ser_title}">
                              <h5 style="font-size:15px; margin-right:10px; margin-top:10px;">??????</h5>
                              <select id="rev_rate" name="rev_rate" style="width:200px;">
                                 <option value="1">1</option>
                                 <option value="2">2</option>
                                 <option value="3">3</option>
                                 <option value="4">4</option>
                                 <option value="5">5</option>
                              </select>
                           </div>
                           <textarea id="rev_sub" name="rev_sub" placeholder="????????? ??????????????????"
                              style="width:100%; height:100px; margin-top:5px" required></textarea>
                           <div>
                              <input type="file" id="reviewimgUpload" name="reviewimg" accept="image/*"
                                 style="display:none;">
                              <label class="genric-btn primary" for="reviewimgUpload">????????????</label>
                              <img id="reviewimg" alt=""
                                 style="width: 42px; height:42px; margin-left:10px; overflow: hidden; border-color:white;">
                              <button type="submit" class="genric-btn primary float-right">?????? ??????</button>
                           </div>
                        </div>
                     </form>
                     <c:choose>
                        <c:when test="${fn:length(reviewList) > 0}">
                           <div class="revtext" style="margin-top:20px;">
                              <div class="serviceinfo">????????? ??????</div>
                              <!--<i class="fa fa-star" style="color: gold;"></i>-->
                              <c:set var="sum" value="0"></c:set>
                              <c:forEach items="${reviewList}" var="calc">
                                 <c:set var="sum" value="${sum + calc.rev_rate}"></c:set>
                              </c:forEach>
                              ?????? : <fmt:formatNumber type="number" pattern="0.00"
                                 value="${ (((sum/fn:length(reviewList))*100) - (((sum/fn:length(reviewList))*100)%1)) * (1/100)   }">
                              </fmt:formatNumber> ???
                              || ??? ${cntReviews}?????? ??????
                           </div>
                        </c:when>
                        <c:otherwise>
                           <div class="revtext" style="margin-top:20px;">
                              <div class="serviceinfo" style="margin-top: 100px;">????????? ??????</div>
                              <!--<i class="fa fa-star" style="color: gold;"></i>-->
                              ????????? ????????? ????????????.
                           </div>
                        </c:otherwise>
                     </c:choose>
                     <div>
                        <div class="comments-area">
                           <c:forEach items="${reviewList}" var="review">
                              <div id="rvcode-${review.rev_code }" class="comment-list">
                                 <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                       <c:choose>
                                          <c:when test="${not empty review.b_img }">
                                             <div class="thumb">
                                                <img class="profileimg" src="${review.b_img }" alt=""
                                                   style="width:70px; height:70px;">
                                             </div>
                                          </c:when>
                                          <c:otherwise>
                                             <div class="thumb">
                                                <img class="profileimg"
                                                   src="resources/user/assets/img/profile/search-default-profile.jpg"
                                                   alt="" style="width:70px; height:70px;">
                                             </div>
                                          </c:otherwise>
                                       </c:choose>
                                       <div class="desc" style="width:450px;">
                                          <span>${review.rev_ser_name }</span><br>
                                          <span>${review.rev_name }</span>
                                          <span class="ml-4">?????? : ${review.rev_rate }</span>
                                          <span class="date">${fn:substring(review.rev_date,0,10) } </span>
                                          <div style="word-break:break-all;">
                                             <p class="comment">${review.rev_sub }</p>
                                          </div>
                                          <c:choose>
                                             <c:when test="${review.rev_id eq id}">
                                                <c:choose>
                                                   <c:when test="${not empty review.rev_img }">
                                                      <span class="btn-reply1" style="cursor: pointer;"
                                                         data-toggle="modal" data-target="#updateReviewModal"
                                                         data-rvcode="${review.rev_code }"
                                                         data-rvsub="${review.rev_sub }"
                                                         data-rvimg="${review.rev_img }">??????</span>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <span class="btn-reply1" style="cursor: pointer;"
                                                         data-toggle="modal" data-target="#updateReviewModal"
                                                         data-rvcode="${review.rev_code }"
                                                         data-rvsub="${review.rev_sub }" data-rvimg="none">??????</span>
                                                   </c:otherwise>
                                                </c:choose>
                                                <span class="btn-reply1" style="cursor: pointer;" data-toggle="modal"
                                                   data-target="#deleteReviewModal"
                                                   data-rvcode="rvcode-${review.rev_code }">??????</span>
                                             </c:when>
                                             <c:otherwise>
                                                <c:if test="${detailS.s_email eq id}">
                                                   <span class="btn-reply1" data-toggle="modal"
                                                      data-target="#writeReview_commentModal"
                                                      data-reviewcode="${review.rev_code }"
                                                      style="cursor: pointer;">??????</span>
                                                </c:if>
                                                <c:if test="${not empty author}">
                                                   <span class="btn-reply1" data-toggle="modal"
                                                      data-target="#reportModal" data-revtp="r"
                                                      data-report_code="${review.rev_code }"
                                                      style="cursor: pointer;">??????</span>
                                                </c:if>
                                             </c:otherwise>
                                          </c:choose>
                                       </div>
                                    </div>
                                    <c:if test="${not empty review.rev_img }">
                                       <div style="width:200px;height:100px; margin-left:10px;">
                                          <img class="revimg" src="${review.rev_img }"
                                             style="width:200px;height:100px;">
                                       </div>
                                    </c:if>
                                 </div>
                              </div>
                              <c:if test="${not empty review.rere_code }">
                                 <div id="rvcode-${review.review_code }" class="comment-list left-padding">
                                    <div class="single-comment justify-content-between d-flex">
                                       <div class="user justify-content-between d-flex">
                                          <c:choose>
                                             <c:when test="${not empty sellerInfo.s_img }">
                                                <div class="thumb">
                                                   <img src="${sellerInfo.s_img}" class="profileimg" alt="" style="width:70px; height:70px;">
                                                </div>
                                             </c:when>
                                             <c:otherwise>
                                                <div class="thumb">
                                                   <img
                                                      src="resources/user/assets/img/profile/search-default-profile.jpg"
                                                      class="profileimg" alt="" style="width:70px; height:70px;">
                                                </div>
                                             </c:otherwise>
                                          </c:choose>
                                          <div class="desc">
                                             <span>${review.rere_sel_name }</span>
                                             <span class="date">${fn:substring(review.rere_date, 0 , 10) } </span>
                                             <div style="word-break:break-all;">
                                                <p class="comment">${review.rere_sel_sub }</p>
                                             </div>
                                             <c:choose>
                                                <c:when test="${review.rere_sel_id eq id}">
                                                   <span class="btn-reply1" style="cursor: pointer;" data-toggle="modal"
                                                      data-target="#updateReviewCommentModal"
                                                      data-rvcode="${review.rere_code }"
                                                      data-rvsub="${review.rere_sel_sub }"
                                                      data-reviewcode="${review.review_code}">??????</span>
                                                   <span class="btn-reply1" style="cursor: pointer;" data-toggle="modal"
                                                      data-target="#deleteReviewcommentModal"
                                                      data-deletecode="${review.rere_code }">??????</span>
                                                </c:when>
                                                <c:otherwise>
                                                   <c:if test="${not empty author}">
                                                      <span class="btn-reply1" data-toggle="modal"
                                                         data-target="#reportModal" data-revtp="rc"
                                                         data-report_code="${review.rere_code }"
                                                         style="cursor: pointer;">??????</span>
                                                   </c:if>
                                                </c:otherwise>
                                             </c:choose>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </c:if>
                           </c:forEach>
                        </div>
                     </div>
                     <div class="row justify-content-center mt-10">
                        <nav aria-label="Page navigation example">
                           <ul class="pagination">
                              <c:if test="${paging.prev }">
                                 <li class="page-item"><a class="page-link"
                                       href="serviceDetail.do?ser_code=${detailS.ser_code}&pageNum=${paging.startPage - 1 }&amount=${paging.amount}&pagestatus=r">&lt;</a>
                                 </li>
                              </c:if>
                              <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                                 <c:choose>
                                    <c:when test="${p == paging.pageNum }">
                                       <li class="page-item"><b class="page-link">${p }</b></li>
                                    </c:when>
                                    <c:when test="${p != paging.pageNum }">
                                       <li class="page-item"><a class="page-link"
                                             href="serviceDetail.do?ser_code=${detailS.ser_code}&pageNum=${p }&amount=${paging.amount}&pagestatus=r">${p
                                             }</a></li>
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                              <c:if test="${paging.next }">
                                 <li class="page-item"><a class="page-link"
                                       href="serviceDetail.do?ser_code=${detailS.ser_code}&pageNum=${paging.endPage+1 }&amount=${paging.amount}&pagestatus=r">&gt;</a>
                                 </li>
                              </c:if>
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="col-lg-4">
         <div class="blog_right_sidebar">

            <aside class="single_sidebar_widget search_widget" style="height: 375px;">
               <p class="widget_title" style="font-size: 15px; font-weight: bold; margin-bottom: 10px;">${cate.cat_name
                  } > ${subcate.sub_name }</p>
               <div>
                  <!-- <span>???????????? : ${cate.cat_name } > ${subcate.sub_name }</span> -->
                  <!-- <br/><br/> -->
                  <h2 style="color: #10285d; height: 160px; font-weight: bold;">${detailS.ser_title }</h2>
               </div>
               <!-- /input-group -->
               <div class="br"></div>
               <c:if test="${empty goingPromo }">
                  <div style="text-align: right; margin-top: 15px;">
                     <div>
                        <span style="font-size:30px; font-weight: bold;">
                           ???
                           <fmt:formatNumber value="${detailS.ser_price }" pattern="###,###" /> ~
                        </span>
                     </div>
                  </div>
               </c:if>
               <c:if test="${not empty goingPromo }">
                  <div style="text-align: right; margin-top: 15px;">
                     <div>
                        <span style="font-size:24px; font-weight: bold;">
                           ??? <del>
                              <fmt:formatNumber value="${detailS.ser_price }" pattern="###,###" /> ~ <del>
                        </span>
                     </div>
                     <div>
                        <img class="position-relative" src="resources/user/assets/img/promotion.png"
                           style="height: 20px; bottom: 4px;">
                        <span style="font-size:30px; font-weight: bold; color: rgb(214, 13, 13);">
                           ???
                           <fmt:formatNumber value="${goingPromo.prodiscount }" pattern="###,###" /> ~
                        </span>
                     </div>
                  </div>


                  <!-- <div class="price" style="color:red; float: right;"><img src="resources/user/assets/img/promotion.png"> ???<fmt:formatNumber value="${goingPromo.prodiscount }" pattern="###,###"/></div> -->
               </c:if>
            </aside>
            <aside class="category-listing mb-50" style="text-align: center; margin-top: 26px;">               
               <p style="font-size: 20px; font-weight: bold; color: #1c1930;"> ????????? ?????? </p>
               <c:choose>
                  <c:when test="${empty sellerInfo.s_img }">
                     <img class="author_img"
                        src="resources/user/assets/img/profile/search-default-profile.jpg" alt=""
                        style="cursor:pointer; width: 155px; height: 155px; border-radius: 8px;"
                        onclick="location='sellerDetail.do?s_email=${detailS.s_email }'">
                  </c:when>
                  <c:otherwise>
                     <img class="author_img" src="${sellerInfo.s_img }" alt=""
                        style="cursor:pointer; width: 155px; height: 155px; border-radius: 8px;"
                        onclick="location='sellerDetail.do?s_email=${detailS.s_email }'">
                  </c:otherwise>
               </c:choose>
               <br /><br />
               <div class="d-flex justify-content-center">
                  <h4 id="sellernick">${sellerInfo.s_nickname }</h4>&nbsp;
                  <h4>
                     <c:if test="${author eq 'B'}">
                        <c:if test="${wish eq 'exist'}">
                           <i class="fa fa-heart wishplus" data-toggle="tooltip" data-placement="top" title="??????????????? ??????"
                              onclick="wishplus(this, '${sellerInfo.s_nickname}')" style="display:none"></i>
                           <i class="fa fa-heart wishminus" data-toggle="tooltip" data-placement="top" title="??????????????? ??????"
                              onclick="wishminus(this, '${sellerInfo.s_nickname}')"></i>
                        </c:if>
                        <c:if test="${wish eq 'no'}">
                           <i class="fa fa-heart wishplus" data-toggle="tooltip" data-placement="top" title="??????????????? ??????"
                              onclick="wishplus(this, '${sellerInfo.s_nickname}')"></i>
                           <i class="fa fa-heart wishminus" data-toggle="tooltip" data-placement="top" title="??????????????? ??????"
                              onclick="wishminus(this, '${sellerInfo.s_nickname}')" style="display:none"></i>
                        </c:if>
                     </c:if>
                  </h4>
               </div>
               <c:choose>
                  <c:when test="${sellerInfo.s_rank eq '1' }">
                     <p style="color: #1c1930;">?????? : ???</p>
                  </c:when>
                  <c:when test="${sellerInfo.s_rank eq '2' }">
                     <p style="color: #1c1930;">?????? : ???</p>
                  </c:when>
                  <c:when test="${sellerInfo.s_rank eq '3' }">
                     <p style="color: #1c1930;">?????? : ??????</p>
                  </c:when>
                  <c:when test="${sellerInfo.s_rank eq '4' }">
                     <p style="color: #1c1930;">?????? : ??????</p>
                  </c:when>
                  <c:otherwise>
                     <p style="color: #1c1930;">?????? : ???????????? ??????</p>
                  </c:otherwise>
               </c:choose>
               <p style="white-space:pre-line; color: #1c1930;">${sellerInfo.s_me }</p>
               <button class="genric-btn primary small startbtn" onclick="chatingcheck()">??????</button>               
            </aside>
         </div>
      </div>
      </div>
      </div>
   </section>

   <!-- Modal Start -->
   <!-- ?????? ?????? -->
   <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">??????</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form>
                  <div class="form-group">
                     <label><input type="radio" name="reportType" value="??????/??????" onclick="radiodisabled()">
                        ??????/??????</label><br>
                     <label><input type="radio" name="reportType" value="?????????" onclick="radiodisabled()"> ?????????</label><br>
                     <label><input type="radio" name="reportType" value="??????/???????????? ??????" onclick="radiodisabled()"> ??????/????????????
                        ??????</label><br>
                     <label><input type="radio" name="reportType" value="??????/????????? ??????" onclick="radiodisabled()"> ??????/?????????
                        ??????</label><br>
                     <div class="form-group">
                        <label><input type="radio" name="reportType" value="????????????" onclick="radioactive()"> ????????????</label>
                        <textarea class="form-control" id="reportSubject" name="reportSubject" disabled></textarea>
                     </div>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <a href="#" class="genric-btn danger radius" data-dismiss="modal" onclick="reportReview()">??????</a>
               <a href="#" class="genric-btn primary radius" data-dismiss="modal"
                  onclick="radiodisabled();disradio();">??????</a>
            </div>
         </div>
      </div>
   </div>
   <!-- ?????? ?????? -->

   <!-- ?????? ?????? ?????? -->
   <div class="modal fade" id="deleteReviewModal" tabindex="-1" role="dialog" aria-labelledby="deleteReviewModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">?????? ??????</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">????????? ???????????????!</div>
            <div class="modal-footer">
               <a href="#" class="genric-btn danger radius" onclick="deleteReview()" data-dismiss="modal">??????</a>
               <a href="#" class="genric-btn primary radius" data-dismiss="modal">??????</a>
            </div>
         </div>
      </div>
   </div>

   <div class="modal fade" id="deleteReviewcommentModal" tabindex="-1" role="dialog"
      aria-labelledby="deleteReviewcommentModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">?????? ??????</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">????????? ???????????????!</div>
            <div class="modal-footer">
               <a href="#" class="genric-btn danger radius" onclick="deleteReview_comment()" data-dismiss="modal">??????</a>
               <a href="#" class="genric-btn primary radius" data-dismiss="modal">??????</a>
            </div>
         </div>
      </div>
   </div>
   <!-- ?????? ?????? ?????? -->

   <!-- ?????? ???????????? ?????? -->
   <div class="modal fade bd-example-modal-lg" id="updateReviewModal" tabindex="-1" role="dialog"
      aria-labelledby="updateReviewModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">?????? ??????</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <form method="post" action="reviewUpdate.do" enctype="multipart/form-data">
               <input type="hidden" name="pageinfo" value="servicepage">
               <div class="modal-body">
                  <div class="d-flex">
                     <input type="hidden" id="hidden_revcode" name="rev_code">
                     <h5 style="font-size:15px; margin-right:10px; margin-top:20px;">??????</h5>
                     <select id="rev_rate" name="rev_rate" style="width:50px;">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                     </select>
                  </div>
                  <h5 style="font-size:15px; margin-top:20px;">??????</h5>
                  <textarea id="modal_rev_sub" name="rev_sub" style="width:100%; height:100px; margin-top:5px"
                     required></textarea>
                  <div class="d-flex">
                     <input type="file" id="reviewuimg" name="revimg" accept="image/*" style="display:none;">
                     <label class="genric-btn primary radius" for="reviewuimg" style="margin-top: 7px;">?????? ??????</label>
                     <img id="reviewimgpreview" alt=""
                        style="width: 42px; height:42px; margin-left:10px;margin-top: 7px; overflow: hidden; border-color:white;">
                  </div>
               </div>
               <div class="modal-footer">
                  <button type="submit" class="genric-btn danger radius">??????</button>
                  <button class="genric-btn primary radius" data-dismiss="modal">??????</button>
               </div>
            </form>
         </div>
      </div>
   </div>
   <!-- review_comment controller -->
   <div class="modal fade bd-example-modal-lg" id="updateReviewCommentModal" tabindex="-1" role="dialog"
      aria-labelledby="updateReviewCommentModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">?????? ?????? ??????</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form method="post" action="reviewCommentUpdate.do">
                  <input type="hidden" id="hidden_rere_code" name="rere_code">
                  <input type="hidden" id="hidden_reviewcode" name="review_code">
                  <input type="hidden" name="pageinfo" value="servicepage">
                  <h5 style="font-size:15px; margin-top:20px;">??????</h5>
                  <textarea id="modal_rere_sel_sub" name="rere_sel_sub" style="width:100%; height:100px; margin-top:5px"
                     required></textarea>
            </div>
            <div class="modal-footer">
               <button type="submit" class="genric-btn danger radius">??????</button>
               <button class="genric-btn primary radius" data-dismiss="modal">??????</button>
            </div>
            </form>
         </div>
      </div>
   </div>

   <div class="modal fade bd-example-modal-lg" id="writeReview_commentModal" tabindex="-1" role="dialog"
      aria-labelledby="writeReview_commentModalModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">?????? ?????? ??????</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form method="post" action="writeReview_comment.do">
                  <input type="hidden" id="hidden_review_code" name="review_code">
                  <h5 style="font-size:15px; margin-top:20px;">??????</h5>
                  <textarea id="modal_rere_sel_sub" name="rere_sel_sub" style="width:100%; height:100px; margin-top:5px"
                     required></textarea>
            </div>
            <div class="modal-footer">
               <button type="submit" class="genric-btn danger radius">??????</button>
               <button class="genric-btn primary radius" data-dismiss="modal">??????</button>
            </div>
            </form>
         </div>
      </div>
   </div>
   </div>
   <!-- ?????? ???????????? ?????? -->


   <!-- Modal End -->

   <script>
   function searchFrm(p){
       if(p){
           frm.pageNum.value = p;
       }
		frm.submit()
	};
   
      $(document).ready(function () {
         $('[data-toggle="tooltip"]').tooltip();
      });

      function wishplus(event, nickname) {
         $.ajax({
            url: "wishplus.do",
            type: "post",
            data: {
               nickname: nickname
            },
            success: function (code) {
               if (code == "plus") {
                  $(event).hide();
                  console.log(event.nextSibling);
                  $(event.nextElementSibling).show();
               }
            }
         })
      }

      function wishminus(event, nickname) {
         $.ajax({
            url: "wishminus.do",
            type: "post",
            data: {
               nickname: nickname
            },
            success: function (code) {
               if (code == "minus") {
                  $(event).hide();
                  $(event.previousElementSibling).show();
               }
            }
         })
      }

      function readImage(input) {
         if (input.files && input.files[0]) {
            const reader = new FileReader();

            reader.onload = e => {
               const previewImage = document.getElementById("reviewimg");
               previewImage.src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
         }
      }

      const inputImage = document.getElementById("reviewimgUpload");
      inputImage.addEventListener("change", e => {
         readImage(e.target);
      });

      var rvcode = "";
      var rvsub = "";
      var deletecode = "";
      /* ?????? ?????? textarea ?????? ?????? ?????? */
      function radiodisabled() {
         $("#reportSubject").attr("disabled", true);
         $("#reportSubject").val("");
      }

      function radioactive() {
         $("#reportSubject").attr("disabled", false);
      }

      function disradio() {
         $("input:radio[name='reportType']").prop("checked", false);
         console.log("disradio");
      }
      /* ?????? ?????? textarea ?????? ?????? ?????? */

      /* ?????? ?????? ?????? test ?????? */
      $(document).ready(function () {
         $("#deleteReviewModal").on("show.bs.modal", function (event) {
            rvcode = $(event.relatedTarget).data("rvcode");
         });

         $("#deleteReviewcommentModal").on("show.bs.modal", function (event) {
            deletecode = $(event.relatedTarget).data("deletecode");
         });

         $("#updateReviewModal").on("show.bs.modal", function (event) {
            rvcode = $(event.relatedTarget).data("rvcode");
            rvsub = $(event.relatedTarget).data("rvsub");
            $("#hidden_revcode").val(rvcode);
            $("#modal_rev_sub").val(rvsub);
         });

         $("#updateReviewCommentModal").on("show.bs.modal", function (event) {
            rvcode = $(event.relatedTarget).data("rvcode");
            rvsub = $(event.relatedTarget).data("rvsub");
            reviewcode = $(event.relatedTarget).data("reviewcode");
            $("#hidden_rere_code").val(rvcode);
            $("#hidden_reviewcode").val(reviewcode);
            $("#modal_rere_sel_sub").val(rvsub);
         });

         $("#writeReview_commentModal").on("show.bs.modal", function (event) {
            reviewcode = $(event.relatedTarget).data("reviewcode");
            $("#hidden_review_code").val(reviewcode);
         });

         $("#reportModal").on("show.bs.modal", function (event) {
            report_code = $(event.relatedTarget).data("report_code");
            report_tcp = $(event.relatedTarget).data("revtp");
         });
      });

      function reportReview() {
         console.log(report_code);
         var re_type = $('input[name="reportType"]:checked').val();
         console.log(re_type);
         var re_subject = $("#reportSubject").val();
         console.log(report_tcp);

         if (report_tcp == "r") {
            // reportcontroller
            $.ajax({
               url: "reportReview.do",
               type: "post",
               data: {
                  rev_code: report_code,
                  re_type: re_type,
                  re_subject: re_subject
               },
               success: function () {
                  console.log("?????????!");
                  alert("?????????????????????.");
               },
               error: function () {
                  console.log("????????????")
               }
            })
         }
         if (report_tcp == "rc") {
            // reportcontroller
            $.ajax({
               url: "reportReview_comment.do",
               type: "post",
               data: {
                  rere_code: report_code,
                  re_type: re_type,
                  re_subject: re_subject
               },
               success: function () {
                  console.log("?????????!");
                  alert("?????????????????????.");
               },
               error: function () {
                  console.log("????????????")
               }
            })
         }
      }

      function deleteReview() {
         /*console.log(rvcode);
         var target = document.getElementById(rvcode);
         target.remove();*/

         var rev_code = rvcode.substr(7);
         console.log(rev_code);

         $.ajax({
            url: "deleteReview.do",
            type: "get",
            data: {
               rev_code: rev_code
            },
            success: function () {
               console.log("?????????!");
               location.reload();
            },
            error: function () {
               console.log("??????");
            }
         })
      }

      function deleteReview_comment() {
         $.ajax({
            url: "deleteReview_comment.do",
            type: "get",
            data: {
               rere_code: deletecode
            },
            success: function () {
               console.log("?????????!");
               location.reload();
            },
            error: function () {
               console.log("??????");
            }
         })
      }
      /* ?????? ?????? ?????? test ?????? */

      function reviewQualifications(scode) {
         var submitcode = "";
         $.ajax({
            url: "reviewQualifications.do",
            data: {
               scode: scode
            },
            dataType: "text",
            success: function (result) {
               console.log(result);
               if (result == "OK") {
                  console.log("ifOK");
                  submitcode = "OK";
                  alert("????????? ?????????????????????.");
                  $("#reviewform").submit();
                  //location.reload();
               } else if (result == "NO") {
                  console.log("ifNO");
                  submitcode = "NO";
                  alert("????????? ???????????? ????????? ????????? ??? ????????????.")
               }
            }
         });


      }

      function chatingcheck() {


    	  if (${empty id}) {
              alert('????????? ??? ????????? ??? ????????????.');
               return;
            }
            if (${author ne 'B' }) {
               alert('???????????? ?????? ????????? ??? ????????????.');
               return;
            }

         //????????? ?????????
         var chatnick = document.querySelector("#sellernick").innerHTML;
         //???????????????
         var ser_code = window.location.search.substr(10);
         $.ajax({
            url: "chatingcheck.do",
            type: "post",
            data: {
               chatnick: chatnick, //?????? ????????? ?????????
               ser_code: ser_code // ???????????? ???????????????
            },
            dataType: "json",
            success: function (data) {
               window.location.replace("chatting.do");
               console.log(data);
            },
            error: function () {
               alert("??????");
            }
         });
      }

   
   </script>

</body>

</html>