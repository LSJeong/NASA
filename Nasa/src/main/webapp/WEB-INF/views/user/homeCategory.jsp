<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .category-title {
            color: white;
            font-weight: bold;
        }

        .searchtable {
            border: 1.5px solid #e8e8e8;
            border-radius: 8px;
        }

        .searchtable:hover {
            background: #fbf9ff;
        }

        table {
            width: 100%;
            height: 225px;
        }

        th,
        td {
            border: none;
        }

        .tableimg {
            text-align: center;
            width: 200px;
            height: 200px;
        }

        .tableimgs {
            width: 170px;
            height: 170px;
            border-radius: 8px;
        }

        .tablecategory {
            padding-left: 10px;
            font-size: 13px;
            font-weight: bold;
        }

        .tableinfos {
            text-align: right;
            padding: 10px;
        }

        .tabletitle {
            font-size: 25px;
            font-weight: bold;
            padding-left: 10px;
            bottom: 23px;
        }

        .tableprice {
            top: 5px;
            left: 20px;
            padding-right: 30px;
            font-weight: bold;
            font-size: 25px;
            text-align: right;
            width: 180px;
        }

        .tableusername {
            padding-left: 10px;
            bottom: 35px;

        }

        .tablecontext {
            padding-left: 10px;
            top: -30px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            max-width: 80px;
        }

        .tablewish {
            text-align: right;
            padding-right: 10px;
        }

        .tablebtn {
            width: 135px;
            text-align: right;
            padding-right: 10px;
            padding-bottom: 10px;
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
                        <input type="hidden" id="column" name="column" value="${param.column}">
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
    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">NASA SERVICE</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="homeCategory.do" class="d-flex">
                                        <p id="cat0">전체 서비스</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="homeCategory.do?ser_cate=CAT1" class="d-flex">
                                        <p id="cat1">앱 개발</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="homeCategory.do?ser_cate=CAT2" class="d-flex">
                                        <p id="cat2">웹 개발</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="homeCategory.do?ser_cate=CAT3" class="d-flex">
                                        <p id="cat3">게임 개발</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="homeCategory.do?ser_cate=CAT4" class="d-flex">
                                        <p id="cat4">보안</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="homeCategory.do?ser_cate=CAT5" class="d-flex">
                                        <p id="cat5">기술 지원</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="homeCategory.do?ser_cate=CAT6" class="d-flex">
                                        <p id="cat6">기획</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>
                    </div>
                </div>
                <div class="col-9">
                    <div class="position-relative d-flex justify-content-between">
                        <div class="ml-4" style="margin-bottom: 10px;">
                            <h3 id="cat-title" style="font-weight: bold; border-bottom: 5px solid #7d64aa;"></h3>
                        </div>
                        <select class="mr-3" name="column" onchange="selectList()">
                            <option value="" <c:if test="${param.column eq ''}">selected</c:if>>등록 순</option>
                            <option value="reviewcount" <c:if test="${param.column eq 'reviewcount'}">selected</c:if>>리뷰 순</option>
                        </select>
                    </div>
                    <div class="blog_left_sidebar">
                        <article class="blog_item">
                            <div class="justify-content-center">
                                <div class="blog_details" style="padding: 50px 10px 30px 10px;">
                                    <div class="col-12">
                                        <c:forEach items="${homecatelist }" var="cate">
                                            <div class="searchtable" style="margin-bottom: 10px; cursor:pointer;" onclick="location.href='serviceDetail.do?ser_code=${cate.ser_code }'">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td rowspan="4" class="tableimg">
                                                                <img class="tableimgs" src="${cate.ser_img }">
                                                            </td>
                                                            <td colspan="2" class="position-relative tablecategory">
                                                                ${cate.category } > ${cate.sub_category }
                                                            </td>
                                                            <td class="tableinfos">
                                                                평점 : ${cate.reviewavg }<br>${cate.reviewcount }개의 리뷰
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="position-relative tabletitle" colspan="3">
                                                                ${cate.ser_title }
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" class="position-relative tableusername">
                                                                ${cate.nickname }
                                                            </td>
                                                            <c:choose>
                                                                <c:when test="${not empty cate.pro_status }">
                                                                    <td class="position-relative tableprice" style="text-align: right; rgb(214, 13, 13);">
                                                                        <span style="text-decoration: line-through; font-weight: bold; font-size: 23px; color: rgb(58, 57, 57);">
                                                                            ${cate.ser_price_com }원
                                                                        </span><br>${cate.ser_sale_com }원!
                                                                    </td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td class="position-relative tableprice" style="text-align: right;">
                                                                        ${cate.ser_price_com }원
                                                                    </td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </tr>
                                                        <tr>
                                                            <td class="position-relative tablecontext">
                                                                ${cate.ser_sub }
                                                            </td>
                                                            <td class="tablewish"></td>
                                                            <td class="tablebtn">
                                                                <c:if test="${not empty cate.pro_status }">
                                                                    <img src="resources/user/assets/img/promotion.png" style="width: 100px;">
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </c:forEach>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:if test="${paging.prev }">
                                                    <li id="catePaging" class="page-item">
                                                        <a class="page-link" href="javascript:searchFrm(${paging.startPage - 1 })">&lt;</a>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                                                    <c:choose>
                                                        <c:when test="${p == paging.pageNum }">
                                                            <li class="page-item">
                                                                <b class="page-link">${p }</b>
                                                            </li>
                                                        </c:when>
                                                        <c:when test="${p != paging.pageNum }">
                                                            <li class="page-item">
                                                                <a class="page-link" href="javascript:searchFrm(${p})">${p }</a>
                                                            </li>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                                <c:if test="${paging.next }">
                                                    <li class="page-item">
                                                        <a class="page-link" href="javascript:searchFrm(${paging.endPage+1 })">&gt;</a>
                                                    </li>
                                                </c:if>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
    <script>
        function searchFrm(p) {
            if (p) {
                frm.pageNum.value = p;
            }
            selectVal = $("select[name=column] option:selected").val();
            $('#column').val(selectVal)
            frm.submit()
        };

        if (window.location.search.split("=")[1] == 'CAT1') {
            document.getElementById("cat1").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '앱 개발';
        } else if (window.location.search.split("=")[1] == 'CAT2') {
            document.getElementById("cat2").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '웹 개발';
        } else if (window.location.search.split("=")[1] == 'CAT3') {
            document.getElementById("cat3").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '게임 개발';
        } else if (window.location.search.split("=")[1] == 'CAT4') {
            document.getElementById("cat4").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '보안';
        } else if (window.location.search.split("=")[1] == 'CAT5') {
            document.getElementById("cat5").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '기술 지원';
        } else if (window.location.search.split("=")[1] == 'CAT6') {
            document.getElementById("cat6").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '기획';
        } else if (window.location.search.split("=")[2] == 'CAT1&pageNum') {
            document.getElementById("cat1").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '앱 개발';
        } else if (window.location.search.split("=")[2] == 'CAT2&pageNum') {
            document.getElementById("cat2").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '웹 개발';
        } else if (window.location.search.split("=")[2] == 'CAT3&pageNum') {
            document.getElementById("cat3").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '게임 개발';
        } else if (window.location.search.split("=")[2] == 'CAT4&pageNum') {
            document.getElementById("cat4").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '보안';
        } else if (window.location.search.split("=")[2] == 'CAT5&pageNum') {
            document.getElementById("cat5").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '기술 지원';
        } else if (window.location.search.split("=")[2] == 'CAT6&pageNum') {
            document.getElementById("cat6").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '기획';
        } else if (window.location.search.split("=")[2] == '&pageNum') {
            document.getElementById("cat0").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '전체 서비스';
        } else {
            document.getElementById("cat0").style = "font-weight: bold;";
            document.getElementById("cat-title").textContent = '전체 서비스';
        };

        function selectList() {
            selectVal = $("select[name=column] option:selected").val();
            $('#column').val(selectVal)
            frm.submit()
        }
        
    </script>
</body>

</html>