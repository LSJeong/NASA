<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<div class="home-blog-area section-padding30" style="padding-top: 130px;;">
    <div class="container">
        <div class="row">
            <h3 style="font-weight: bold; border-bottom: 5px solid #7d64aa; margin-bottom: 50px;">판매자의 노하우</h3>
        </div>
        <div class="row">
            <c:forEach items="${knowhowlist }" var="knowhow">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-team mb-30">
                        <div class="team-img">
                            <img src="${knowhow.no_img }" alt="" style="width: 370px; height: 400px;">
                        </div>
                        <div class="team-caption" style="margin-top : 20px;">
                            <span>${knowhow.s_nickname }</span>
                            <h3><a href="knowhowDetail.do?no_code=${knowhow.no_code }">${knowhow.no_title }</a></h3>
                            <p>${knowhow.no_date }</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="row justify-content-center mt-10">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${paging.prev }">
                        <li class="page-item"><a class="page-link" href="go_knowhowlist.do?pageNum=${paging.startPage - 1 }&amount=${paging.amount}">&lt;</a></li>
                    </c:if>
                    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                        <c:choose>
                            <c:when test="${p == paging.pageNum }">
                                <li class="page-item"><b class="page-link">${p }</b></li>
                            </c:when>
                            <c:when test="${p != paging.pageNum }">
                                <li class="page-item"><a class="page-link" href="go_knowhowlist.do?pageNum=${p }&amount=${paging.amount}">${p }</a></li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${paging.next }">
                        <li class="page-item"><a class="page-link" href="go_knowhowlist.do?pageNum=${paging.endPage+1 }&amount=${paging.amount}">&gt;</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script>
    function searchFrm(p){
        if(p){
            frm.pageNum.value = p;
        }
		frm.submit()
	}
</script>
</body>
</html>