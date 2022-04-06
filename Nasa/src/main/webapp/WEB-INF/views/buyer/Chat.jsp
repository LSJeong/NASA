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

html, body {
	background: linear-gradient(120deg, #443d43, #ed8ffa);
	overflow: hidden;
}

.container {
	background: rgba(255, 255, 255, 0.05);
	width: 95%;
	height: 95%;
	border-radius: 0.2em;
	position: relative;
	left: 50px;
	top: 30px;
	box-shadow: 1px 1px 12px rgba(0, 0, 0, 0.1);
}

.chatTop {
	background: rgba(255, 255, 255, 0.05);
	color: rgba(255, 255, 255, 0.9);
	font-size: 0.9em;
	padding: 1em;
	margin: 0;
	font-weight: 300;
	text-align: center;
}

.left1 {
	background: rgba(255, 255, 255, 0.1);
	width: 25%;
	height: 100%;
	float: left;
	border-top-right-radius: 0.2em;
	border-bottom-right-radius: 0.2em;
}

.chatBottom {
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
}

textarea::placeholder {
	color: white;
}

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
	overflow: scroll;
	overflow-x: hidden;
}

.right1 {
	width: 70%;
	float: right;
	border-radius: 1px;
	background: rgba(255, 255, 255, 0.2);
	padding: 1em 0;
	margin-right: 30px;
	height: auto;
	border-radius: 5px;
	overflow: auto;
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

/////////////////////
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

.

.chatList_box, .chatList_box2 {
	margin: 2px;
	border: 2px solid silver;
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

.w-btn-neon2 {
    position: relative;
    border: none;
    min-width: 70px;
    min-height: 10px;
    background: linear-gradient(
        90deg,
        #f44a40 0%,
        #f44a40 100%
    );
    border-radius: 3px;
    color: rgb(248, 253, 253);
    cursor: pointer;
    box-shadow: 12px 12px 24px rgba(238, 89, 89, 0.64);
    font-weight: 700;
    transition: 0.3s;
          margin-right: 10px;
}

.w-btn-neon2:hover {
color: #f44a40;
    border: 1px solid #f44a40;
    background: #fff;
    transform: scale(1.2);
}

.w-btn-neon2:hover::after {
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
}
</style>
<link rel="stylesheet" href="./resources/chat/css/chat.css" />


<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


	<div class='container' ng-cloak ng-app="chatApp">
		<div class="channer" style="border-radius: 2px">
			<div class="channer left1">

				<!-- 채팅 리스트 -->
				<div class="chatListContainer font_jua display-none"
					style="padding: 3px;">
					<div class="chatTop">
						<div
							style="font-size: 14px; padding: 15px 0; margin-left: 4px; background-color: #7d64aa; color: white; text-align: center;">NASA
							LIST</div>
					</div>
					<div class="chatList"></div>
				</div>
			</div>

			<div class="channer right1">
				<!-- 채팅 창 -->
				<div class="chat_wrap" style="padding: 3px">
					<div class="header">
						CHAT
						<button type="button" id="chatout" class="w-btn-neon2"
							style=" float: right; display: none;">채팅나가기</button>
					
						<button type="button" id="payement" class="w-btn-neon2"
							style="float: right; display: none;">결제하기</button>
								<button type="button" data-toggle="modal" data-target="#reportModal" id="Chatreport" class="w-btn-neon2"
							style="float: right; display: none;">신고하기</button>
					</div>
					<!-- 	<div class="floatLeft" id="loginOn">
						<img class="profile_img" id="setPic">
						src 사진 경로 동적 생성
					</div> -->
					<!-- 					<div class="name_container font_noto" id="setName">
						이름 동적 생성
					</div>
 -->

					<div class="chatMiddle">
						<ul>
							<!-- 동적 생성 -->
						</ul>
					</div>
					<div class="chatBottom">
						<textarea placeholder="메세지를 입력해 주세요."></textarea>
					</div>
				</div>

			</div>
		</div>
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
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label><input type="radio" name="reportType" value="욕설/비방" onclick="radiodisabled()">
								욕설/비방</label><br>
							<label><input type="radio" name="reportType" value="음란물" onclick="radiodisabled()">
								음란물</label><br>
							<label><input type="radio" name="reportType" value="스팸, 부적절한 광고" onclick="radiodisabled()"> 스팸, 부적절한 광고</label><br>
							<label><input type="radio" name="reportType" value="혐오 혹은 잔인한 사진" onclick="radiodisabled()"> 혐오 혹은 잔인한 사진</label><br>
							<div class="form-group">
								<label><input type="radio" name="reportType" value="기타 사유" onclick="radioactive()"> 기타 사유</label>
								<textarea class="form-control" id="reportSubject" name="reportSubject"
									disabled></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="#" class="genric-btn danger radius" data-dismiss="modal" onclick="reportReview()">신고</a>
					<a href="#" class="genric-btn primary radius" data-dismiss="modal" onclick="readiodisabled()">취소</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고 모달 -->
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
							userid : "${loginMember.b_email}"
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
								console.log(data);
								for ( var i in data) {
									var $span; // 2단계
									// 자신이 구매자 입장일 때
									if (data[i].userid == "${loginMember.b_email}") {
										console.log("구매자 아이디 :::"
												+ data[i].userid
												+ "판매자 아이디 :::"
												+ data[i].masterid);
										$div = $(
												"<div class='chatList_box enterRoomList' style='display:inline-block; width: 80%;' onclick='enterRoom(this);'>")
												.attr("id", data[i].roomid)
												.attr("userId",
														data[i].masterid);
										$img = $("<img class='profile_img' src='resources/img/buzz.png'>");
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
										$img = $("<img class='profile_img' src='resources/img/buzz.png'>");
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
			console.log("채팅 방 아이디 ::::" + roomid);

			// 해당 채팅 방의 메세지 목록 불러오기
			$.ajax({
				url : roomid + ".do",
				data : {
					userid : "${loginMember.b_email}"
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
			//$(obj).attr("clickable", "false");
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
					userid : "${loginMember.b_email}"
				},
				async : false,
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						// 채팅 목록 동적 추가
						CheckLR(data[i]);
					}
				}
			});
			// 웹소켓 연결
			connect();
			console.log("enterRoom2");
			//	$(obj).attr("clickable","false");
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
				"sentid" : "${ loginMember.b_email }",
				"nickname" : "${ loginMember.b_nickname }",
				"message" : "ENTER-CHAT",
			/*"unReadCount" : 0*/
			};
			let jsonData = JSON.stringify(data);
			websocket.send(jsonData);
			console.log("웹소켓 연결되었을때 ::::" + websocket);
		}

		// * 1 메시지 전송
		function sendMessage(message) {
			console.log("SendMessage 메세지 전송 !!::: " + message);
			const data = {
				"roomid" : roomid,
				"messageid" : "",
				"sentid" : "${ loginMember.b_email }",
				"nickname" : "${ loginMember.b_nickname }",
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
			if (data.sentid != "${ loginMember.b_nickname }") {
				CheckLR(data);
			}
		}

		// * 2-1 추가 된 것이 내가 보낸 것인지, 상대방이 보낸 것인지 확인하기
		function CheckLR(data) {
			console.log("1111111");
			//console.log("누가보낸것이냐left")
			// userid이 loginSession의 userid과 다르면 왼쪽, 같으면 오른쪽
			const LR = (data.sentid != "${ loginMember.b_email }") ? "left"
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
			console.log(rere_code);
			var re_type = $('input[name="reportType"]:checked').val();
			console.log(re_type);
			var re_subject = $("#reportSubject").val();
			
						
			// reportcontroller
			$.ajax({
				url: "reportReview_comment.do",
				type:"post",
				data:{rere_code : rere_code,
					re_type : re_type,
					re_subject : re_subject},
				success: function() {
					console.log("신고함!");
				}
			})
		}
	</script>


<!--   <script src='/resources/chat/js/chatting/chat.js'></script>-->


