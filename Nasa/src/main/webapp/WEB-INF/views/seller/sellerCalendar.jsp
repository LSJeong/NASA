<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='resources/user/fullcalendar-5.10.1/lib/main.css' rel='stylesheet' />
<style>
    #calendar {
        width: 800px;
        height: 500px;
    }

    .servicetable {
        width: 800px;
    }

    .imgtd {
        width: 200px;
        height: 200px;
    }
    th {
        width: 80px;
    }
    .thtext {
        top: 10px;
        font-size: 20px;
    }

    .tdtext {
        bottom: 10px;
    }
</style>
<script src='resources/user/fullcalendar-5.10.1/lib/main.js'></script>
</head>
<body>
<div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="hero-cap text-center pt-50">
                    <h2>일정관리</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Hero End -->
<!--================Blog Area =================-->
<section class="blog_area section-padding">
    <div class="container">
        <div class="row">
            <div class="col-3">
                <div class="blog_right_sidebar">
                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">MYPAGE MENU</h4>
                        <ul class="list cat-list">
								<li><a href="sellerService.do" class="d-flex">
									    <p>서비스 관리</p>
								</a></li>
								<li><a href="sellerPromotion.do" class="d-flex">
										<p>프로모션 관리</p>
								</a></li>
								<li><a href="powerservice.do" class="d-flex">
										<p>파워서비스 내역</p>
								</a></li>
								<li><a href="sellerCalendar.do" class="d-flex">
										<p style="font-weight: bold;">일정 관리</p>
								</a></li>
								<li><a href="sellerReview.do?scode=0" class="d-flex">
										<p>리뷰 관리</p>
								</a></li>
								<li><a href="sellerPayment.do" class="d-flex">
										<p>결제 조회</p>
								</a></li>
								<li><a href="sellerSales.do" class="d-flex">
										<p>매출 확인</p>
								</a></li>
								<li><a href="sellerReport.do" class="d-flex">
										<p>신고 관리</p>
								</a></li>
								<li><a href="sellerKnowhow.do" class="d-flex">
										<p>판매자 노하우</p>
								</a></li>
							</ul>
                    </aside>                            
                </div>
            </div>
            <div class="col-9">                
                <div class="blog_left_sidebar">
                    <article class="blog_item">
                        <div class="justify-content-center">
                            <div class="blog_details">
                                <!-- 달력 자리 -->
                                <div id='calendar'></div>
                                <br>
                                <div class="d-inline-block" style="margin-bottom: 25px;">
                                    <h2 style="margin-bottom: 5px;">일정 조회</h2>
                                    <div style="font-size: 13px;">서비스 제목을 클릭하면 관련 정보를 확인할 수 있습니다.</div>
                                </div>
                                <table class="servicetable">
                                    <tbody>                                        
                                        <tr>
                                            <th rowspan="5" class="imgtd" style="text-align: center;"><img id="ser_img"
                                                    src="resources/user/assets/img/search-default-profile.jpg"
                                                    style="height: 175px; width: 175px; border-radius: 8px;"></th>
                                            <th>구 매 자 : </th>
                                            <td id="b_nickname"></td>
                                        </tr>
                                        <tr>
                                            <th>서 비 스 : </th>
                                            <td><a id="ser_title"></a></th>                                            
                                        </tr>
                                        <tr>
                                            <th>카테고리 : </th>
                                            <td id="cate"></td>
                                        </tr>
                                        <tr>
                                            <th>가  격 : </th>
                                            <td id="pay_price_tochar"></td>
                                        </tr>
                                        <tr>
                                            <th>거래기간 : </th>
                                            <td id="paydate"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>                                                       
                        </div>                        
                    </article>
                </div>
            </div>            
        </div>
    </div>
    <input type="hidden" name="pay_code_input" value="">
    <input type="hidden" name="s_code_input" value="">
</section>
<script>
    // 수정할 것...
   document.addEventListener('DOMContentLoaded', function () {
        let xhtp = new XMLHttpRequest();
        xhtp.open('get', 'CalendarListS.do');
        xhtp.send();
        xhtp.onload = function () {
            let dbData = JSON.parse(xhtp.responseText);
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {

                initialView: 'dayGridMonth',
                dayMaxEvents: true, // allow "more" link when too many events               
                locale: 'kor',
                eventClick: function (ev) {
                    console.log(ev.event.extendedProps.pay_code);
                    console.log(ev.event.extendedProps.s_code);
                    $('input[name=pay_code_input]').attr('value', ev.event.extendedProps.pay_code);
                    $('input[name=s_code_input]').attr('value', ev.event.extendedProps.s_code);   
                    getCalServList();
                },
                events: dbData
            });
            calendar.render();
            console.log(dbData);

            function getCalServList() {
                var b_nickname = $(event.target).text();
                var pay_code = $('input[name=pay_code_input]').val();
                var s_code = $('input[name=s_code_input]').val();

                $.ajax({
                    url: "ajaxGetCalServListS.do",
                    type: "post",
                    data: {
                        "b_nickname": b_nickname,
                        "pay_code": pay_code,
                        "s_code": s_code,
                    },
                    success: function (data) {                        
                        console.log(data);
                        $("#ser_img").attr("src", data.ser_img);
                        $("#b_nickname").text(data.b_nickname);
                        $("#ser_title").text(data.ser_title);
                        $("#ser_title").attr("onclick", "location.href='serviceDetail.do?ser_code=" + data.s_code + "'");
                        $("#ser_title").attr("style", "cursor:pointer; background-color: #dddddd;");  
                        $("#cate").text(data.category + " > " + data.sub_category);                      
                        $("#pay_price_tochar").text(data.pay_price_tochar + "원");
                        $("#paydate").text(data.event_start + " ~ " + data.event_end_original);

                    }
                })
            }
        }
    });
</script>
</body>
</html>