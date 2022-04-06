<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: "Nunito", sans-serif;
}

/* html, body {
   background: linear-gradient(120deg, #443d43, #ed8ffa);
   overflow: hidden;
} */

.container {
   background: rgba(255, 255, 255, 0.05);
}

.left1 {
   background: rgba(255, 255, 255, 0.1);
   width: 25%;
   height: 100%;
   float: left;
   border-top-right-radius: 0.2em;
   border-bottom-right-radius: 0.2em;
}

/*.chatBottom {
   background: rgba(255, 255, 255, 0.03);
   position: absolute;
   bottom: 0;
   right: 0;
   border: none;
   width: 75%;
   height: 100px;
   padding: 1.2em;
   outline: none;
   color: rgba(255, 255, 255, 0.9);
   font-weight: 300;
}*/

/*textarea::placeholder {
   color: white;
}*/

.chatBottom>textarea {
   background: rgba(255, 255, 255, 0.03);
   position: absolute;
   bottom: 0;
   right: 0;
   border: none;
   width: 100%;
   height: 100px;
   padding: 1.2em;
   outline: none;
   color: black;
   font-weight: 300;
}

.chat_wrap .chatMiddle {
   height: 75%;
}

.chat_wrap .chatMiddle {
   padding-bottom: 80px;
   overflow-x: hidden;
}

.right1 {
   float: right;
   border-radius: 1px;
   background: rgba(255, 255, 255, 0.2);
   padding: 1em 0;
   height: auto;
   border-radius: 5px;
}

.right {
   background: rgba(255, 255, 255, 0.2);
   padding: 1em 0;
   height: auto;
   width: 65%;
   border-radius: 5px;
   margin: 2em 1em;
   overflow: auto;
}

.left {
   background: rgba(255, 255, 255, 0.2);
   padding: 1em 0;
   height: auto;
   width: 65%;
   border-radius: 5px;
   margin: 2em 1em;
   overflow: auto;
}

.chat_wrap .chatMiddle ul li>div.sender {
   margin: 10px 20px 0 20px;
   font-size: 13px;
   font-weight: bold;
}

.chat_wrap .chatMiddle ul li>div.message {
   display: inline-block;
   word-break: break-all;
   margin: 5px 20px;
   max-width: 75%;
   /* border: 1px solid #888; */
   padding: 10px;
   border-radius: 5px;
   /* background-color: #FCFCFC; */
   color: black;
   text-align: left;
   font-size: 16px;
}

chat_wrap .chatMiddle ul li>div {
   font-size: 17px;
}

.font_jua img, .floatRight img {
   display: inline-block;
   width: 32px;
   margin-right: 4px;
}

.profile_img {
   display: inline-block;
   width: 32px;
   margin-right: 4px;
}

.chatMiddle .format {
   display: none;
}

.format  ul li {
   list-style: none;
}

.chat_wrap .header {
   font-size: 14px;
   padding: 15px 0;
   background: #7d64aa;
   color: white;
   text-align: center;
}

.chat_wrap .chatMiddle ul li.left {
   text-align: left;
}

.chat_wrap .chatMiddle ul li.right {
   text-align: right;
   width: 70%;
   position: relative;
   left: 28%;
}


.chatList_box, .chatList_box2 {
    margin: 10px 0px;
   padding-bottom:18px;
   border-bottom: 2px solid rgba(228, 234, 242,0.8);
   
}

.chatMiddle:nth-of-type(odd).right:after {
   content: "";
   position: absolute;
   margin: -1.5em -17.06em;
   width: 0;
   height: 0;
   border-top: 10px solid transparent;
   border-bottom: 10px solid transparent;
   border-right: 10px solid rgba(255, 255, 255, 0.2);
}

   @keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity: 1;
    }
    100% {
        width: 300px;
        height: 300px;
        opacity: 0;
    }
}
/*.w-btn-neon2 {
   position: relative;
   border: none;
   min-width: 70px;
   min-height: 10px;
   background: linear-gradient(90deg, #f44a40 0%, #f44a40 100%);
   border-radius: 3px;
   color: rgb(248, 253, 253);
   cursor: pointer;
   box-shadow: 12px 12px 24px rgba(238, 89, 89, 0.64);
   font-weight: 700;
   transition: 0.3s;
   margin-right: 10px;
}*/

/*.w-btn-neon2:hover {
   color: #f44a40;
   border: 1px solid #f44a40;
   background: #fff;
   transform: scale(1.2);
}*/

/*.w-btn-neon2:hover::after {
   content: "";
   width: 30px;
   height: 30px;
   border-radius: 100%;
   border: 6px solid #fc4f4f;
   position: absolute;
   z-index: -1;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   animation: ring 1.5s infinite;
}*/
.powerbtn, .modal-header {
   background-color: #d5c9ea  !important;
}

.modal-footer {
   display: block !important;
   text-align: center;
}

.powerp {
   color: red;
   font-size: 8px;
   border-bottom: 1px solid #999294;
}

.endp {
   padding: 30px 0px 20px 0px;
}

.br {
   border-top: 1px solid #999294;
   margin-top: 20px;
   padding-top: 20px;
   padding-bottom: 20px;
   border-bottom: 1px solid #999294;
}

.paytb td {
   width: 120px;
   height: 50px;
   font-size: 12px;
}

.paytb td:nth-child(2) {
   width: 200px;
}

.category-listing {
   height: 350px !important;
}

.fables-single-item {
   color: rgb(64, 64, 64);
}

.fables-single-item:hover {
   background-color: #d5c9ea;
}

.nav-link.active {
   background-color: #d5c9ea !important;
   color: white !important;
}

input[type=date] {
   border: 1px solid lightgray;
   color: lightgray;
   margin-right: 10px;
}

.paybtn {
   margin-right: 10px;
}
.hr{
    background-color : #d5c9ea !important;
      margin: 10px !important;
}
.pt-70{
   padding-top: 0px;
}
.blog_details img{
   width: 354px;
   height: 256px;
}
.genric-btn.danger-border:hover{
   background-color : #d5c9ea !important;
   color: white;
}


.hero-area2 {
	min-height:100px
}

.w-btn-neon2 {
   
   border: none;
   
   border-radius: 3px;
   
   padding:5px;
   cursor: pointer;
   font-weight: 700;
   
}

.genric-btn.danger-border {
    color: #f44a40;
    border: 1px solid #f44a40;
    background: #fff;
}
</style>


 <link rel="stylesheet" href="./resources/chat/css/chat.css" /> 

<script
   src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
   <script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>


<body>
  <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
   </div>
   <div class="" style="margin-top:50px; margin-bottom:100px ;margin-left:200px "><!-- listing-area -->
      <div class="container" ng-cloak ng-app="chatApp" style="max-width: 2000px" >
         <div class="row channer" style="border-radius: 2px; height: 750px;">
            <div class="col-3 channer" style="box-shadow: 0px 15px 14px  rgba(178 178 194 / 64%);border-radius: 20px;">
               <div class="row">
                  <div class="col-12 mb-4" style="background-color:#0D0F36; padding:10px 0px;border-radius: 15px 15px 0px 0px;">
                        <h4 class="text-center" style="color:white">Chat List</h4>
                  </div>
               </div>
               <!-- 채팅 리스트 -->
               <div class="chatList"></div>
               
               
            </div>
            
            <div class="col-8 ml-2 " style="box-shadow: 10px 15px 20px rgba(178 178 194 / 64%);border-radius: 30px;">
               <div class="row" >
                  <div class="col-12 py-2 d-flex" style="background-color:#0D0F36;border-radius: 15px 15px 0px 0px;">
                     
                       <!-- <span>list</span> -->
                       <div class="col-3">
                        <button type="button" id="chatout" class="genric-btn danger-border circle mr-2 px-3"
                           style="float: left; display: none; font-size:15px;" onclick="history.back()">채팅나가기</button>
                        </div>
                        <div class="col-5"></div>
						<div class="col-4 ">
	                       
	                        <button type="button" data-toggle="modal"
	                           data-target="#reportModal" id="Chatreport" class="genric-btn danger circle arrow ml-2 px-3"
	                           style="float: right; display: none; font-size:15px;">신고하기</button>
	                         
	                         <c:if test="${author eq 'B' }">
		                         <button type="button" data-toggle="modal"
			                        data-target="#payModal" id="payement" class="genric-btn primary-border circle mr-2 px-3"
			                           style="float: right; display: none; font-size:15px; border-radius:30px" 
		                           onclick="paymentconfirm();sercodecheck();promotioncheck();selrankcheck()">결제하기</button>
                        	 </c:if>
                        </div>
                     
                  </div>
               </div>
               <!-- 채팅 창 -->
               <div class="chat_wrap " >

                  <!--    <div class="floatLeft" id="loginOn">
                  <img class="profile_img" id="setPic">
                  src 사진 경로 동적 생성
               </div> -->
                  <!--                <div class="name_container font_noto" id="setName">
                  이름 동적 생성
               </div>
 -->

                  <div class="listing-details-area chatMiddle" style="height: 500px">
                     <ul>
                        <!-- 동적 생성 -->
                     </ul>
                  </div>
                  <div class="chatBottom">
                     <textarea placeholder="메세지를 입력해 주세요." style="border-radius:20px; border:1px solid #c3c5ea"></textarea>
                  </div>
               </div>

            </div>

            
         </div>
      </div>
     </div>
   
     
      <!-- 여기끝남 -->





      <!-- format -->
      <div class="chatMiddle format">
         <ul>
            <li>
               <div class="sender">
                  <span></span>
               </div>
               <div class="message">
                  <span></span>
               </div>
            </li>
         </ul>
      </div>









      <div class="chatMiddle format">
         <ul>
            <!-- 동적 생성 -->
         </ul>
      </div>
      <div class="modal">
         <div class="modal_window">
            <div class="chat_delete_background"></div>
            <div class="chat_delete_content">
               <p>해당 채팅방을 삭제하시겠습니까?</p>
               <div id="chat_delete_btn">
                  <button type="button" id="delete_yes">예</button>
                  <button type="button" id="delete_no">아니오</button>
               </div>
            </div>
         </div>
      </div>




      <!-- Modal Start -->
      <!-- 신고 모달 -->
      <div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
         aria-labelledby="reportModalLabel" aria-hidden="true">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">신고</h5>
                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                  <form id="dataForm" method="post" enctype="multipart/form-data">
                     <div class="form-group">
                        <label><input type="radio" name="reportType"
                           value="욕설/비방" onclick="radiodisabled()"> 욕설/비방</label><br>
                        <label><input type="radio" name="reportType" value="음란물"
                           onclick="radiodisabled()"> 음란물</label><br> <label><input
                           type="radio" name="reportType" value="스팸/부적절한 광고"
                           onclick="radiodisabled()"> 스팸/부적절한 광고</label><br> <label><input
                           type="radio" name="reportType" value="혐오/잔인한 사진"
                           onclick="radiodisabled()"> 혐오/잔인한 사진</label><br>
                        <div class="form-group">
                           <label><input type="radio" name="reportType"
                              value="기타사유" onclick="radioactive()"> 기타사유</label>
                           <textarea class="form-control" id="reportSubject"
                              name="reportSubject" disabled></textarea>
                        </div>
                        <div class="col-12">
                           <div id="profileThumnail" class="justify-content-center"
                              style="text-align: center;">
                              <input type="file" id="imgupload" name="imgupload"
                                 accept="image/*">
                           </div>
                        </div>
                     </div>
                  </form>
               </div>
               <div class="modal-footer">
                  <a href="#" class="genric-btn danger radius" data-dismiss="modal"
                     onclick="reportReview()">신고</a> <a href="#"
                     class="genric-btn primary radius" data-dismiss="modal"
                     onclick="readiodisabled()">취소</a>
               </div>
            </div>
         </div>
      </div>
      <!-- 신고 모달 -->


      <!-- 결제 모달-->
      <div class="modal fade" id="payModal" tabindex="-1" role="dialog"
      aria-labelledby="payModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document" style="max-width: 400px;">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel"
                  style="text-align: center;">결제하기</h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <form>

         
            <div class="modal-body">
               <div class="">
                  <img id="sellerpay" src="assets/img/comment/comment_1.png"> <span id="paycheckId"></span>
                  <div>
                      <span id="serviceid"></span>

                  </div>
               </div>
               <table class="paytb">
                  <!--여기 결제-->
                  <tr>
                     <!-- 서비스코드 들어와야함 -->
                     <input type="hidden" id="servicecode" name="servicecode" value="servicecode">
                     <input type="hidden" id="ser_cate" name="ser_cate" value="ser_cate">
                     <input type="hidden" id="sub_cate" name="sub_cate" value="sub_cate">
                     <input type="hidden" id="sellerrank" name="sellerrank" value="sellerrank">
                     <td>서비스 금액</td>
                     <td><input type="number" id="chatmoney"placeholder="상대방과 협의한 금액을 입력해주세요"
                        style="width: 250px;"  onkeyup="copchatmoney()"/></td>
                  </tr>
                  <tr>
                     <td>서비스 진행일</td>
                     <td><input type="radio" name="paydate" value="ndate" id="ndate" checked>정해진 날짜가 없어요 <br /> <input type="radio"
                           name="paydate" value="ydate" id="ydate">협의한
                        날짜가 있어요 <input type="date" id="conference" > ~ <input type="date" id="endconference" ></td>
                     </tr>
                  <tr>
                     <td>결제수단</td>
                     <td><input type="radio" name="paymethod" value="creditpay"
                        checked>신용/체크카드 
                        <!-- <input type="radio" name="paymethod"
                        value="kakaopay">카카오페이</td> -->
                  </tr>
                  <tr>
                     <td>쿠폰</td>
                     <td id="coupontest">
                  <input type="radio" name="coupon" value="coupon" checked>사용하지 않음 <br />
                  <input type="radio" name="coupon" value="coupon" id="couponrank" onclick="couponcheck()"><span id="couponspan"></span>
                  <!--여기서 체크-->
                     </td>
                  </tr>
                  <tr>
                     <td>서비스금액</td>
                     <td id="copchatmoney1">5000</td>
                  </tr>
                     <td>쿠폰 할인</td>
                     <td style="color: red;" id="couponmoney">-원</td>
                  </tr>

               </table>
               <div class="br">
                  <h6 style="display: inline;">최종 결제금액</h6>
                  <span style="font-weight: 200;" id="lastmoney">--원</span>
               </div>
               <div class="br">
                  <span><input type="checkbox" id="primary-checkbox">개인정보수집 및 이용동의(필수)</span> <a
                     style="float: right;" data-toggle="modal" data-target="#useModal">보기</a>
               </div>

            </div>
         </form>
            
            <div class="modal-footer">
               <a href="#" class="genric-btn primary  radius powerbtn"
                  data-toggle="modal" data-dismiss="modal" onclick="chatpaymentOK()">결제</a> <a href="#"
                  class="genric-btn primary radius powerbtn" data-dismiss="modal">취소</a>
            </div>
         </div>
      </div>
   </div>
      <!-- 결제 모달 끝-->
      <!-- 이용약관 모달-->
      <div class="modal fade" id="useModal" tabindex="-1" role="dialog"
      aria-labelledby="useModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document"
         style="max-width: 600px; margin: 12.75rem auto">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel"
                  style="text-align: center;">이용약관</h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <div>개인정보 수집 및 이용 동의(고객)</div>
               <p>
               <div>분류</div>
               필수 정보

               <div>수집∙이용 동의 목적</div>
               안전결제 서비스 제공 및 소비자 분쟁 해결, 환불 처리

               <div>항목</div>
               결제 카드 번호, 계좌 정보(은행명, 예금주명, 계좌번호)

               <div>보유∙이용 기간</div>
               개인정보 이용목적 달성 시까지 보존합니다. 단, 관계 법령의 규정에 따라 보존이 필요한 경우 해당 기간까지 보존 후
               지체없이 파기합니다. 개인정보 제공에 동의하지 않을 수 있으며 동의하지 않을 경우 서비스 이용이 제한될 수 있습니다.
               </p>
            </div>
         </div>
      </div>
   </div>
      <!-- 이용 약관 모달 끝-->

   </div>


   <script>
      // 웹소켓
      let websocket;

      // 총 읽지 않은 갯수
      let countAll = 0;

      getRoomList(); // 채팅 방 목록을 불러온다.

      function getRoomList() {
         // 채팅 방 목록 가져오기
         $
               .ajax({
                  url : "chatRoomList.do",
                  data : {
                     userid : "${loginMember.s_email}"
                  },
                  dataType : "json",
                  async : false, // async : false를 줌으로써 비동기를 동기로 처리 할 수 있다.
                  success : function(data) {

                     // 현재 로그인 된 User들
                     let loginList = "";

                     // 로그인 된 User들을 가져온다.
                     $.ajax({
                        url : "chatSession.do",
                        data : {},
                        async : false,
                        dataType : "json",
                        success : function(data) {
                           for (var i = 0; i < data.length; i++) {
                               console.log("로그인유저",data[i]);
                              loginList += data[i];
                              console.log(data[i]);
                           }
                        }
                     });

                     $chatWrap = $(".chatList");
                     $chatWrap.html("");

                     var $div; // 1단계
                     var $img;
                     var divs;
                     //var str1;
                     if (data.length > 0) {
                        // 읽지 않은 메세지 초기화
                        countAll = 0;

                        // 태그 동적 추가
                        console.log("태그동적추카",data);
                        for ( var i in data) {
                           var $span; // 2단계
                           // 자신이 구매자 입장일 때
                           if (data[i].userid == "${loginMember.s_email}") {
                               var sellerimg = document.querySelector("#sellerpay"); 
                               var s_img = data[i].s_img;
                              console.log("구매자 아이디 :::"
                                    + data[i].userid
                                    + "판매자 아이디 :::"
                                    + data[i].masterid);
                              $div = $(
                                    "<div class='chatList_box enterRoomList' style='display:inline-block; width: 80%;' onclick='enterRoom(this);'>")
                                    .attr("id", data[i].roomid)
                                    .attr("userId",
                                          data[i].masterid)
										  .attr("ser_code", data[i].ser_code)
										  ;
                              $img = $("<img class='profile_img' src='"+data[i].s_img+"'>");
                             $("#sellerpay").attr("src","data[i].s_img");
                              
                                   //$img = $("<img class='profile_img' src='resources/user/assets/img/profile/${loginMember.s_img}.png'>");
                              $div.append($img);
                              $divs = $("<span class='userNameId'>")
                                    .text(data[i].masterid);
                              //str1 = getIamge(data[i].masterid);
                              //console.log("!@#!@#"+getIamge(data[i].masterid));

                              // 프로필 가져오기

                           } //자신이 구매자일떄 end
                           // 자신이 판매자 입장일 때
                           else {
                              console.log("구매자 아이디 :::"
                                    + data[i].userid
                                    + "판매자 아이디 :::"
                                    + data[i].masterid);
                              // 현재 구매자가 로그인 상태 일 때
                              $div = $(
                                    "<div class='chatList_box enterRoomList' style='display:inline-block; width: 80%;' onclick='enterRoom(this);'>")
                                    .attr("id", data[i].roomid)
                                    .attr("userId", data[i].userid);
                              //$img = $("<img class='profile_img' src='/resources/images/temp-profile.png'>");
                              $img = $("<img class='profile_img' src='"+data[i].s_img+"'>");
                              $div.append($img);
                              $divs = $("<span class='userNameId'>")
                                    .text(data[i].userid);

                           } // 구매자가 아닌 판매자일떄  else End

                           // 읽지 않은 메세지가 0이 아닐 때
                           if (data[i].unReadCount != 0) {
                              $span = $(
                                    "<span id='unReadCount' class='notRead'style='border-radius:3px;background-color: red; float:right; color: white; font-size: 20px;' >")
                                    .text(data[i].unReadCount);
                           } else {
                              $span = $("<span id='unReadCount' style='float:right'>");
                           }

                           //$img = $img.attr("src",str1);

                           var $btn1 = $(
                                 "<button type='button' class='chat_exit' style='float:right; display: inline-block; border:none; background-color:transparent;'>")
                                 .attr("id", data[i].roomid)

                           var $img2 = $("<img src='resources/img/exit.png' style=' width: 20px; margin-top: 4px;'>")

                           $btn1.append($img2);
                           $div.append($divs);
                           $div.append($span);
                           $chatWrap.append($div);
                           $chatWrap.append($btn1);

                           // String을 int로 바꿔주고 더해준다.
                           countAll += parseInt(data[i].unReadCount);
                           console.log("메세지 안 읽은 숫자  ::" + countAll);
                        }// for 태그 동적 추가 END
                     } // IF 절 END
                  } // success(data) 구문 END 
               });
      }// getroomlist END
      $(window).on('load', function() {

         // 2초에 한번씩 채팅 목록 불러오기(실시간 알림 전용)
         setInterval(function() {
            // 방 목록 불러오기
            getRoomList();

         }, 20000);
   
      });

      function getImage(obj) {
         console.log("이미지 받아옴 :::" + obj);

         var fileCallPath = encodeURIComponent(obj.profileUploadPath + "\\"
               + obj.pfuuid + "_" + obj.profileImgName);
         var str = "/member/profileDisplay?fileName=" + fileCallPath;
         console.log("경로 !!:::" + str);
         var imageId = obj.userid;
         //console.log("이미지 아이디 ::"+imageId);
         /* if(custom=="master"){
            $(".enterRoomList > img").attr("src",str);
         } */
         var list = $(".enterRoomList");

         console.log("length   " + list.length);

         $(list).each(function(idx, obj) {

            if ($(this).attr("userId") == imageId) {
               $(this).find("img").attr("src", str);
            }
         })
      }

      // 채팅방 관련
      let roomid;

      // 메세지 입력 시 
      // enter 키 이벤트
      $(document).on('keydown', 'div.chatBottom textarea', function(e) {
         if (e.keyCode == 13 && !e.shiftKey) {
            e.preventDefault(); // 엔터키가 입력되는 것을 막아준다.
            const message = $(this).val(); // 현재 입력된 메세지를 담는다.
            let search3 = $('div.chatBottom textarea').val();
            if (search3.replace(/\s|  /gi, "").length == 0) {
               return false;
               $('div.chatBottom textarea').focus();
            }

            sendMessage(message); // 메세지 보내는 곳 
            // textarea 비우기
            clearTextarea();
         }
      }); // 메세지 입력후 enter  END

      // 소켓 닫기
      $("#chatout").click(function() {
         $("#chatout").toggle();
         clearChatroom();

         websocket.close();
         console.log("소켓닫기");
      })

      // 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
      function enterRoom(obj) {
         //지금 여기

         //if ($(obj).attr("clickable") == "true") {

         // 채팅방 나가기 클릭버튼 display:none 해제 
         $("#chatout").toggle();
         $("#payement").toggle();
         $("#Chatreport").toggle();
         
         // 현재 html에 추가되었던 동적 태그 전부 지우기
         $('div.chatMiddle:not(.format) ul').html("");
         // obj(this)로 들어온 태그에서 id에 담긴 방번호 추출

         console.log("check합니다.");
         roomid = obj.getAttribute("id");
		 ser_code = obj.getAttribute("ser_code");
         console.log("채팅 방 아이디 ::::" + roomid);
		 console.log("서비스코드 : " + ser_code);
		 var hiddensercode = $("#servicecode").val(ser_code);
		 console.log(obj);

         // 해당 채팅 방의 메세지 목록 불러오기
         $.ajax({
            url : roomid + ".do",
            data : {
               userid : "${loginMember.s_email}"
            },
            async : false,
            dataType : "json",
            success : function(data) {
               for (var i = 0; i < data.length; i++) {
                  // 채팅 목록 동적 추가
                  CheckLR(data[i]);
                  console.log("방번호확인");
               }
            }
         });
         // 웹소켓 연결
         connect();
         console.log("enterRoom1");
         var re_member = document.querySelector(".left").querySelector(".sender").getElementsByTagName("span")[0].innerText;
         console.log("엔터룸 기멤버" + re_member); 
         document.querySelector("#paycheckId").innerHTML = re_member;

         $(obj).attr("clickable", "false");
         //}
      }// 채팅방 클릭 시 방번호 배정후 웹소켓 연결
      // 채팅 방 클릭 시 방번호 배정 후 웹소켓 연결
      // 채팅하기로 넘어왔을 시 작동 

      let room_id =
   <%=request.getParameter("room_id")%>
      ;
      console.log(room_id);
      console.log("룸아이디 가져오기 :::" + room_id);
      if (room_id != null) {
         chattingRoom(room_id);
      }

      function chattingRoom(obj) {
         // 채팅방 나가기 클릭버튼 display:none 해제 
         $("#chatout").toggle();
         // 현재 html에 추가되었던 동적 태그 전부 지우기
         $('div.chatMiddle:not(.format) ul').html("");
         // obj(this)로 들어온 태그에서 id에 담긴 방번호 추출
         roomid = obj;
         // 해당 채팅 방의 메세지 목록 불러오기
         $.ajax({
            url : roomid + ".do",
            data : {
               userid : "${loginMember.s_email}"
            },
            async : false,
            dataType : "json",
            success : function(data) {
               for (var i = 0; i < data.length; i++) {
                  // 채팅 목록 동적 추가
                  CheckLR(data[i]);
                  console.log("방번호확인");
               }
            }
         });
         // 웹소켓 연결
         connect();
         console.log("enterRoom2");
         //   $(obj).attr("clickable","false");
      }// 채팅방 클릭 시 방번호 배정후 웹소켓 연결
    
      //입장 버튼을 눌렀을 때 호출되는 함수
      function connect() {
         // 웹소켓 주소
         var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/websocket/echo.do";
         console.log("커넥트 웹소켓 주소 ::" + wsUri);
         // 소켓 객체 생성
         websocket = new WebSocket(wsUri);

         //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
         websocket.onopen = onOpen;
         websocket.onmessage = onMessage;

      }

      //웹 소켓에 연결되었을 때 호출될 함수
      function onOpen() {
         console.log("onOpen 실행 :::" + roomid);
         // ENTER-CHAT 이라는 메세지를 보내어, Java Map에 session 추가
         const data = {
            "roomid" : roomid,
            "messageid" : "",
            "sentid" : "${ loginMember.s_email }",
            "nickname" : "${ loginMember.s_nickname }",
            "message" : "ENTER-CHAT",
         /*"unReadCount" : 0*/
         };
         let jsonData = JSON.stringify(data);
         websocket.send(jsonData);
         console.log("웹소켓 연결되었을때 ::::" + websocket);
         console.log("웹소켓 연결되었을때123123123 ::::" + jsonData);
      }

      // * 1 메시지 전송
      function sendMessage(message) {
         console.log("SendMessage 메세지 전송 !!::: " + message);
         const data = {
            "roomid" : roomid,
            "messageid" : "",
            "sentid" : "${ loginMember.s_email }",
            "nickname" : "${ loginMember.s_nickname }",
            "message" : message,
            "lr" : "left"
         };
         CheckLR(data);

         let jsonData = JSON.stringify(data);
         websocket.send(jsonData); // 메세지 보내는 곳 
      }

      // * 2 메세지 수신
      function onMessage(evt) {
         console.log("onMessage :::: ");
         let receive = evt.data.split(",");
         console.log("recieve :::: " + receive);

         const data = {
            "sentid" : receive[0],
            "nickname" : receive[1],
            "message" : receive[2],
            "lr" : "left"
         };
         console.log("수신자 :::" + data.sentid);
         if (data.sentid != "${ loginMember.s_nickname }") {
            CheckLR(data);
         }
      }

      // * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
      function CheckLR(data) {
         console.log("1111111");
         //console.log("누가보낸것이냐left")
         // userid이 loginSession의 userid과 다르면 왼쪽, 같으면 오른쪽
         const LR = (data.sentid != "${ loginMember.s_email }") ? "left"
               : "right";
         // 메세지 추가
         console.log("LR : " + LR);
         appendMessageTag(LR, data.sentid, data.nickname, data.message);
      }

      // * 3 메세지 태그 append
      function appendMessageTag(LR_className, sentid, nickname, message) {
         console.log("222222");
         const chatLi = createMessageTag(LR_className, sentid, nickname,
               message);
         //console.log("chatLi :::::" + chatLi)

         $('div.chatMiddle:not(.format) ul').append(chatLi);

         // 스크롤바 아래 고정
         $('div.chatMiddle').scrollTop(
               $('div.chatMiddle').prop('scrollHeight'));
      }

      // * 4 메세지 태그 생성
      function createMessageTag(LR_className, sentid, nickname, message) {

         // 형식 가져오기
         let chatLi = $('div.chatMiddle.format ul li').clone(); // $('div.chatMiddle.format ul li').clone();

         chatLi.addClass(LR_className); // left : right 클래스 추가
         // find() : chatLi의 하위 요소 찾기
         chatLi.find('.sender span').text(sentid); // 이름 추가
         chatLi.find('.message span').text(message); // 메세지 추가

         return chatLi;
      };

      // * 5 - 채팅창 비우기
      function clearTextarea() {
         $('div.chatBottom textarea').val('');
         return false;
      };
      function clearChatroom() {
         $(".chatMiddle").empty();
      }

      $(".chat_exit").click(function() {
         //  채팅방 나가기 이미지 클릭시

         $(".modal").show();
         let chat_delete_roomid = $(".chat_exit").attr("id");
         console.log("방번호!!!!!:::" + chat_delete_roomid);
         $("#delete_yes").click(function() {
            $.ajax({
               url : chat_delete_roomid + "_delete.do",
               data : {
                  roomid : chat_delete_roomid
               },
               success : function(data) {
                  if (data == "success") {
                     alert("채팅방 삭제되었습니다.");
                     $(".modal").hide();

                  } else {
                     alert("삭제가 되지 않았씁니다.");
                     $(".modal").hide();
                  }
               }

            })

         })
         $("#delete_no").click(function() {
            $(".modal").hide();
         })

      })
      
      var rvcode = "";
      
      /* 신고 사유 textarea 끄고 켜는 함수 */
      function radiodisabled() {
         $("#reportSubject").attr("disabled", true);
         $("#reportSubject").val("");
      }

      function radioactive() {
         $("#reportSubject").attr("disabled", false);
      }
      
      
      
      /* 신고 사유 textarea 끄고 켜는 함수 */
      function reportReview() {
         var form = $("#dataForm")[0];
         console.log(form);
         var formData = new FormData(form);
       
         var re_type = $('input[name="reportType"]:checked').val();
         //console.log(re_type);
         var re_member = document.querySelector(".left").querySelector(".sender").getElementsByTagName("span")[0].innerText;
         //console.log("신고멤버:1111111" + re_member); 
         var re_subject = $("#reportSubject").val();
         //console.log("신고내용:!11" + re_subject);
         var re_img = document.querySelector('#imgupload').value;
         //console.log("신고이미지 : 33333333"+ re_img);
         formData.append('re_member', re_member);
         formData.append('re_subject', re_subject);
         formData.append('re_type', re_type);
                  
         // reportcontroller
         $.ajax({
            url: "reportChatting.do",
            type:"post",
            data: formData,
            enctype: "multipart/form-data",
            processData : false,
            contentType : false,
            success: function(result) {
               if(result == "OK") {
               console.log("신고함!");
               }else {
                  console.log("실패함")
               }
            }
         })
      }

      // $('.chatList_box enterRoomList').on("click",function(){
      //    var re_member = document.querySelector(".left").querySelector(".sender").getElementsByTagName("span")[0].innerText;
      //    console.log("신고멤버:1111111" + re_member); 
      //    document.querySelector("#paycheckId").innerHTML = re_member;

      // })


      

      //채팅 결제 함수
      function chatpaymentOK() {
   
         var IMP = window.IMP;
         var code = "imp56117193";
         IMP.init(code);

         var masterid = document.querySelector("#paycheckId").innerText; // hong나옴
         console.log("상대방아이디",masterid);
         var chatmoney = document.querySelector("#chatmoney").value; // 인풋값 결제금액
         console.log("결제금액",chatmoney);
         var chatdate = $('input[name="paydate"]:checked').val(); // 인풋값 결제날짜
         console.log("결제날짜",chatdate);
         var paymethod = $('intpu[name="paymethod"]:checked').val(); // 인풋값 결제방법
         console.log("결제방법",paymethod);
         var startservice = document.querySelector("#conference").value; // 협의한 서비스 날짜
         console.log("서비스날짜",startservice);
         var endservice = document.querySelector("#endconference").value; // 협의한 서비스 날짜 끝
         console.log("서비스날짜 끝",endservice);
         var coupon = $('input[name="coupon"]:checked').val(); // 쿠폰 사용 여부
         console.log("쿠폰",coupon);
         var servicemoney= document.querySelector("#copchatmoney1").textContent;// 서비스 금액
        console.log("서비스 금액",servicemoney);
         var couponmoney = document.querySelector("#couponmoney").textContent; // 쿠폰 금액
         console.log("쿠폰 금액",couponmoney);
         var lastmoney = document.querySelector("#lastmoney").textContent;
         console.log("최종금액",lastmoney);
         var servicecode = document.getElementById('servicecode').value; //서비스코드 히든임
         console.log("서비스코드",servicecode);
		 var ser_cate = document.getElementById('ser_cate').value; //서비스코드 히든임
		 console.log("서비스카테고리",ser_cate);
		 var sub_cate = document.getElementById('sub_cate').value; //서비스코드 히든임
		 console.log("서비스하위카테고리",sub_cate);
		//  var adminpay = document.getElementById('sellerrank').innerText; // 판매자 등급
		//  console.log("판매자 등급",adminpay);
       var adminpay = document.getElementById('sellerrank'); // 판매자 등급
		 console.log("판매자 등급",adminpay.innerText);
		 if(adminpay.innerText == "1" ){
		 $('#sellerrank').val(servicemoney / 8) ;
		 }else if(adminpay.innerText == "2"){
		 $('#sellerrank').val(servicemoney / 5) ;
		 }else if (adminpay.innerText == "3"){
		 $('#sellerrank').val(servicemoney / 3) ;
		 }else if (adminpay.innerText == "4"){
		 $('#sellerrank').val(servicemoney / 1) ;
		 }
       var adminpat1 = adminpay.value;





         //결제요청

         IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '채팅결제', // 상품명
            amount : lastmoney,    //금액
            buyer_email : '',
            buyer_name : masterid, //판매자아이디
            //buyer_tel : '010-1234-5678',
            //buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456',
            //결제완료후 이동할 페이지
            m_redirect_url : 'http://localhost:8080/project/chat/chatPayComplete.do'
         }, function(rsp) {
            if (!($('#primary-checkbox').is(':checked'))) {
			alert("약관에 동의하지 않으면 결제할 수 없습니다.");
		}
           else if ( rsp.success ) { // 결제 성공시
               var msg = '결제가 완료되었습니다.';

               var result = {
                     "s_email" : masterid,  
                     "pay_price" : chatmoney,
                     "chatdate" : chatdate,
                     "pay_type" : paymethod,
                     "event_start" : startservice,
                     "event_end" : endservice,
                     "pay_originp" : servicemoney,
                     "pay_coupon" : coupon,
                     "s_code" : servicecode,
					 "pay_cate" : ser_cate,
					 "pay_cate1" : sub_cate,
					 "pay_com" : adminpat1

               }
               console.log("결제완료",result);
               $.ajax({
                  url : "chatpayment.do",
                  type : "post",
                  data : JSON.stringify(result),
                  contentType : "application/json;charSet=utf-8",
                  dataType : "json",
                  success : function (data) {
                      console.log("결제완료",data);
                  } 
               });
               console.log("결제성공",result);
               alert(msg);
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
         }
         });


      }
	  //판매자 등급확인
	  function selrankcheck(){
		  var sellerid = document.querySelector("#paycheckId").innerText;
		  console.log("판매자아이디 :",sellerid);
		  $.ajax({
			  url : "selrankcheck.do",
			  type : "post",
			  data : {
				  sellerid : sellerid
			  },
			  dataType : "json",
			  success : function (data) {
                  console.log("판매자 등급",data);
				  document.getElementById('sellerrank').innerText = data.s_rank;
              $("#sellerpay").attr("src",data.s_img);
              $("#sellerpay").attr("style","width:100px;height:100px;");
			  } 
		   });
		}
	  //프로모션 등록 여부체크
	  function promotioncheck() {
		  
	  }
	  function sercodecheck() {
		  var servicecode = document.getElementById('servicecode').value;
		  console.log("로그찍어보자",servicecode);
		  $.ajax({
			  url:"sercodecheck.do",
			  type:"post",
			  data: {
				  servicecode : servicecode
			  },
			  dataType : "json",
			  success : function(data) {
                  console.log("data입니다",data);
				       var chatmoney = $('#chatmoney').val(data.ser_price);
				       var sercate = $('#ser_cate').val(data.ser_cate);
				       var sub_cate =$("#sub_cate").val(data.sub_cate);
                    var serviceid = document.getElementById("serviceid").innerHTML=data.ser_title;
                  console.log("이건 서비스 타이틀입니다",serviceid);

				  console.log("서비스코드",data);
			  }
		  })
	  }

      //쿠폰 가져오기
      function paymentconfirm(){
         var sellerid = document.querySelector("#paycheckId").innerText;
         console.log("판매자아이디 :||||||||||||||||",sellerid);

         $.ajax({
            url: "sellerIdcheck.do",
            type: "post",
            data: {
               sellerId: sellerid
            },
            dataType : "json",
            success: function(data){
               var couponval = document.querySelector("#couponrank");
               $('#couponspan').text('');
               console.log("서버에서 받은 데이터 : " + data.coupon); // data.coupon 1
               if(data.coupon == '1' ){
               $("#coupontest").val('5');
                  couponval.value = "2";
				$('#couponspan').text('2% 할인 사용하기');
               }else if(data.coupon == '2'){
                  couponval.value = "5";
              	$('#couponspan').text('5% 할인 사용하기');
               }else if(data.coupon == '3'){
                  couponval.value = "7";
                  $('#couponspan').text('7% 할인 사용하기');
               }else if(data.coupon == '4'){
                  couponval.value = "10";
                  $('#couponspan').text('10% 할인 사용하기');
               }else if(data.coupon == '0'){
                $("#couponrank").remove();
               }
               $("#coupon").val(data.coupon);
            }
            ,error: function(request,status,error){
               console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
         })
      }
      //결제금액 확인
      function couponcheck(){
         var servicemoney = document.querySelector("#copchatmoney1").textContent;
         var servicemoneysplit = document.querySelector("#copchatmoney1").textContent.split(",").join("");
         console.log("서비스머니",servicemoney);
         var couponmoney = document.querySelector("#couponmoney").textContent;
         var couponmoneysplit = document.querySelector("#couponmoney").textContent.split(",").join("");
         console.log("쿠폰머니",couponmoney);
         var lastmoney = document.querySelector("#lastmoney").textContent;
         var lastmoneysplit = document.querySelector("#lastmoney").textContent.split(",").join("");
         console.log("최종금액",lastmoney);
         var couponper = document.querySelector("#couponrank").value;
         console.log("쿠폰확율",couponper);
		 
         var check = document.querySelector("#couponmoney").innerHTML = servicemoneysplit / 100 * couponper;
         console.log(check);
         console.log("쿠폰머니2",couponmoney);
         document.querySelector("#lastmoney").innerText = servicemoneysplit - check ;
		 
         console.log("최종금액2",lastmoney);
		 var adminpay = document.getElementById('sellerrank'); // 판매자 등급
		 console.log("판매자 등급",adminpay.innerText);
		 if(adminpay.innerText == "1" ){
		 $('#sellerrank').val(servicemoneysplit / 8) ;
		 }else if(adminpay.innerText == "2"){
		 $('#sellerrank').val(servicemoneysplit / 5) ;
		 }else if (adminpay.innerText == "3"){
		 $('#sellerrank').val(servicemoneysplit / 3) ;
		 }else if (adminpay.innerText == "4"){
		 $('#sellerrank').val(servicemoneysplit / 1) ;
		 }

		 }

      //keyup 이벤트
     function copchatmoney(){
      var money = document.getElementById('chatmoney').value
      money = money.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
      document.getElementById('copchatmoney1').innerText = money;
      document.getElementById('lastmoney').innerText = money;
      }


   </script>
</body>

<!--   <script src='/resources/chat/js/chatting/chat.js'></script>-->


</html>