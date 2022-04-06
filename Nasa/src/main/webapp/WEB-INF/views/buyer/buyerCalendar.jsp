<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href='resources/user/fullcalendar-5.10.1/lib/main.css' rel='stylesheet' />
<style>
    #calendar {
        width: 800px;
        height: 500px;
    }

    .servicetable {
        width: 800px;
        border: 1px solid #dddddd;
    }

    .imgtd {
        width: 200px;
        height: 200px;
    }

    th {
        width: 80px;
    }

    .fc-event-title {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
</style>

<!-- Hero Start-->
<div class="hero-area2short  slider-height2 hero-overly2 d-flex align-items-center ">
</div>
<!--Hero End -->
<!--================Blog Area =================-->
<section class="blog_area section-padding">
    <div class="container">
        <div class="row">
            <div class="col-3">
                <div class="blog_right_sidebar">
                    <aside class="single_sidebar_widget post_category_widget">
                        <h4 class="widget_title">MENU</h4>
                        <ul class="list cat-list">
                            <li>
                                <a href="buyHistory.do" class="d-flex">
                                    <p>구매내역</p>
                                </a>
                            </li>
                            <li>
                                <a href="buyerCalendar.do" class="d-flex">
                                    <p style="font-weight: bold;">일정관리</p>
                                </a>
                            </li>
                            <li>
                                <a href="wishlist.do" class="d-flex">
                                    <p>위시리스트</p>
                                </a>
                            </li>
                            <li>
                                <a href="buyerReview.do" class="d-flex">
                                    <p>리뷰확인</p>
                                </a>
                            </li>
                            <li>
                                <a href="reportHistory.do" class="d-flex">
                                    <p>신고내역</p>
                                </a>
                            </li>
                        </ul>
                    </aside>
                </div>
            </div>
            <div class="col-9">
                <div class="blog_left_sidebar">
                    <article class="blog_item">
                        <div class="justify-content-center">
                            <div class="blog_details">
                                <a class="d-inline-block">
                                    <h2>일정관리</h2>
                                </a>
                                <br>
                                <br>
                                <!-- 달력 자리 -->
                                <div id='calendar' style="margin-bottom: 30px;"></div>
                                <br>
                                <div class="d-inline-block" style="margin-bottom: 25px;">
                                    <h2 style="margin-bottom: 5px;">일정 조회</h2>
                                    <div style="font-size: 13px;">서비스 제목이나 판매자 닉네임을 클릭하면 관련 정보를 확인할 수 있습니다.</div>
                                </div>
                                <table class="servicetable">
                                    <tbody>
                                        <tr>
                                            <th rowspan="5" class="imgtd" style="text-align: center;"><img id="ser_img"
                                                    src="resources/user/assets/img/search-default-profile.jpg"
                                                    style="height: 175px; width: 175px; border-radius: 8px;"></th>
                                            <th>판 매 자 : </th>
                                            <td><a id="s_nickname"></a></td>
                                                    
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
</section>
<!--================Blog Area =================-->

<script src='resources/user/fullcalendar-5.10.1/lib/main.js'></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        let xhtp = new XMLHttpRequest();
        xhtp.open('get', 'CalendarList.do');
        xhtp.send();
        xhtp.onload = function () {
            let dbData = JSON.parse(xhtp.responseText);
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {

                initialView: 'dayGridMonth',
                dayMaxEvents: true, // allow "more" link when too many events               
                locale: 'kor',
                eventClick: function () {
                    getCalServList();
                },
                events: dbData
            });
            console.log(dbData);
            calendar.render();

            function getCalServList() {                
                var ser_title = $(event.target).text();
                var info = dbData.find(function (data) {
                    return data.title === ser_title
                });
                var pay_code = info.pay_code;

                $.ajax({
                    url: "ajaxGetCalServList.do",
                    type: "post",
                    data: {
                        "ser_title": ser_title,
                        "pay_code": pay_code
                    },
                    success: function (data) {
                        console.log("여기주목밑에밑에");
                        console.log(data);
                        $("#ser_title").text(data.ser_title);
                        $("#ser_title").attr("onclick", "location.href='serviceDetail.do?ser_code=" + data.s_code + "'");
                        $("#ser_title").attr("style", "cursor:pointer; background-color: #dddddd;");  
                        $("#cate").text(data.category + " > " + data.sub_category);
                        $("#s_nickname").text(data.s_nickname);
                        $("#s_nickname").attr("onclick", "location.href='sellerDetail.do?s_email=" + data.s_email + "'");
                        $("#s_nickname").attr("style", "cursor:pointer; background-color: #dddddd;");  
                        $("#pay_price_tochar").text(data.pay_price_tochar + "원");
                        $("#ser_img").attr("src", data.ser_img);
                        $("#paydate").text(data.event_start + " ~ " + data.event_end_original);

                    }
                })
            }
        }
    });
</script>