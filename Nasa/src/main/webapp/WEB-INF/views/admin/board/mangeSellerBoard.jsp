<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>       

    
     <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="mb-3 ">
                            <h6><i  class="icon-pin mr-2"></i>판매자노하우관리 <i class="fas fa-chevron-right mx-2"></i>전체 노하우 조회</h6>
                        </div>
                        
                        <ul class="list-style-none d-flex mt-4">
			                <li class="mr-1">총 게시글 <span class="text-danger mx-1">${total }</span>개
			                </li>
			                <div class="mx-3 bg-light position-relative" style="height: 20px; width: 3px; top: 3px"></div>
			                
			                    <li class="mx-2">오늘 등록된 게시글 <span class="text-danger mx-1">${todayTotal }</span>개
			                    </li>
			               
			                
			            </ul>
                    </div>
                    
                    
                </div>
            </div>
	<div class="container-fluid">
            
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                    <h5 class="p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                           판매자노하우 검색
                     </h5>
                    <div class="card mb-5">
                        <div class="card-body">
                          <form id="searchForm" method="get">
                            <table class="table caption-top table-bordered  text-center">
                                <tbody>
                                    <tr>
                                        <th class="align-middle table-primary">아이디</th>
                                        <td>
                                        	<div class="col-6">
                                        		<input class="form-control custom-shadow" id="" name="no_id" type="text" value='<c:out value="${pageMaker.cri.no_id }"/>'>
                                    		</div>
                                    	</td>
                                    </tr>
                                    <tr>
                                        <th class="align-middle table-primary">제목</th>
                                        <td>
                                        	<div class="col-6">
                                        		<input class="form-control custom-shadow" id="" name="no_title" type="text" value='<c:out value="${pageMaker.cri.no_title }"/>'>
                                    		</div>
                                    	</td>
                                    </tr>
                                    <tr>
                                        <th class="align-middle table-primary">등록일자</th>
                                        <td>
                                        	<div class="d-flex align-items-center">
                                        		<div class="col-3">
	                                        	<input type="date" class="form-control"  name="no_date" value='<c:out value="${pageMaker.cri.no_date }"/>'>
	                                        	</div>
	                                        	<span class="mx-2"><i class="fas fa-minus"></i></span>
	                                        	<div class="col-3">
	                                        	<input type="date" class="form-control"  name="no_date2" value='<c:out value="${pageMaker.cri.no_date2 }"/>'>
	                                        	</div>
                                        	</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                           </form>
                        <style>
                            .search, .reload{
                                position: relative;
                                top:2px;
                            }
                        </style>

	                     <div class="d-flex justify-content-end my-4">
                            <button id="resetBtn" class="btn btn-outline-warning mr-3">초기화<i class="ml-2 icon-reload reload"></i></button>
	                        <button id="searchBtn" class="btn btn-outline-secondary">검색<i class="ml-2 icon-magnifier search"></i></button>
	                    </div>
                   </div>
               </div>
               
               
               
       
                                    
                                    	
                                    
                            
                            
                   <div class="row my-5">
                	<div class="col-6">
                	   <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            판매자노하우 목록
                        </h5>
                	    <div class="card">
                            <div class="card-body">
                                <div class=" mb-3">총 <span class="mx-1 text-danger">${searchTotal }</span>건</div>
		                     <table class="table table-bordered thead-light text-center table-hover">		                        
		                         <thead class="table-active">
		                         	<tr>
		                         		<th width="70px">순번</th>
		                         		<th width="120px">아이디</th>
		                         		<th>제목</th>       		
		                         		<th width="150px">등록일자</th>
		                         	</tr>
		                         </thead>
		                         <tbody>
		                          <c:if test="${!empty boardLists }">
			                           <c:forEach var="board" items="${boardLists }">
			                             <tr class="boardList" onclick="javascript:clickTrRow(this);">
			                                <td>${board.no_code }</td>
			                                <td>${board.no_id }</td>
			                                <c:choose>
		                                	<c:when test="${fn:length(board.no_title)>11 }">
		                                		<td>${fn:substring(board.no_title,0,10) }...</td>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<td>${board.no_title }</td>
		                                	</c:otherwise>
		                                </c:choose>
			                                <td>${fn:substring(board.no_date,0,11) }</td>
			                             </tr>
			                           </c:forEach>     
                                   </c:if> 
                                   <c:if test="${empty boardLists }">
                                   		<tr>
                                   			<td colspan="4">조회된 데이터가 없습니다. </td>
                                   		</tr>
                                   	
                                   </c:if>
		                        </tbody>
		                     </table>
		
			                    <div class="d-flex justify-content-center mt-5">
			                        <nav aria-label="Page navigation example">
			                            <ul class="pagination">
			                                <c:if test="${pageMaker.prev }">
			                                    <li class="page-item"><a class="page-link" href="${pageMaker.startPage -1 }"
			                                            aria-label="Previous"> <span aria-hidden="true">«</span> <span
			                                                class="sr-only">이전</span>
			                                        </a></li>
			                                </c:if>
			                                <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			                                    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
			                                        <a class="page-link" href="${num }">${num }</a>
			                                    </li>
			                                </c:forEach>
			                                <c:if test="${pageMaker.next }">
			                                    <li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1 }"
			                                            aria-label="Next"> <span aria-hidden="true">»</span> <span
			                                                class="sr-only">다음</span>
			                                        </a></li>
			                                </c:if>
			                            </ul>
			                        </nav>
			                    </div>
		                   </div>
		                   
		                   <form id="actionForm" action="manage_sellerBoard.do" method="get">
							 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							 <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							 <input type="hidden" name="no_id" value="${pageMaker.cri.no_id }">
							 <input type="hidden" name="no_title" value="${pageMaker.cri.no_title }">
							 <input type="hidden" name="no_date" value="${pageMaker.cri.no_date }">
							  <input type="hidden" name="no_date2" value="${pageMaker.cri.no_date2 }">
							 
						</form>
               			</div>
                	</div>
                	<div class="col-6">
                           <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            상세조회
                        </h5>
                	    <div class="card">
                           <!-- <div class="d-flex justify-content-end mr-4">
                                <button id="modifyBtn" class="btn btn-outline-primary mt-3">수정</button>
                                 <button class="btn btn-outline-secondary ml-2 mt-3">삭제</button>
                            </div> -->
		                   <div class="card-body">
                                <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                        <tr>
                                            <th class="table-primary align-middle">순번</th>
                                            <td width="100px"><input class="form-control custom-shadow " id="no_code" name="" value="" type="text" readonly></td>
                                            <th class="table-primary align-middle">아이디</th>
                                            <td><input class="form-control custom-shadow" id="no_id" name="no_id" value="" type="text" readonly></td>
                                            
                                        </tr>
                                         <tr>
                                            <th class="table-primary align-middle">신고횟수</th>
                                            <td width="100px"><input class="form-control custom-shadow " id="s_report" name="" value="" type="text" readonly></td>
                                            <th class="table-primary align-middle">상태</th>
                                            <td><input class="form-control custom-shadow" id="s_status" name="" value="" type="text" readonly></td>
                                            
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">제목</th>
                                            <td colspan="3"><input class="form-control custom-shadow" id="no_title" name="" value="" type="text" readonly></td>
                                            
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">등록날짜</th>
                                            <td colspan="3"><input class="form-control custom-shadow" id="no_date" name="" value="" type="text" readonly></td>
                                           
                                        </tr>
                                        
                                        <tr>                                     
                                            <th colspan="4" class="table-primary align-middle">내용</th>
                                            
                                        </tr>
                                        <tr>
                                        	<td colspan="4" id="no_subject" id="no_subject" style="height:500px">                                              
                                                
                                               
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
		
			                     
		                   </div>
               			</div>
                	</div>
                </div>
                

             </div>
             
<script>

//전체목록 페이징처리
let actionForm = $("#actionForm");
$(".page-item a").on("click", function (e) {
    e.preventDefault();
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    actionForm.submit();
})

function clickTrRow(target){
	const tbody= target.parentNode;
	const trs = tbody.getElementsByTagName('tr');
	
	for(var i=0; i<trs.length;i++){
		trs[i].style.backgroundColor="";
	} 
	target.style.backgroundColor="#dadde0";
}


//등록날짜 변경
let startDate =$("input[name='no_date']");
let endDate =$("input[name='no_date2']");
const handleBoardDate =()=>{
	$(endDate).val($(startDate).val())
	
	
}
$("input[name='no_date']").on("change",handleBoardDate);

//초기화
const hadleResetLists =()=>{
	$(startDate).val("")
	$(endDate).val("")
	$("input[name='b_email']").val('')
	$("input[name='ser_title']").val('')
	$("select[name='pay_cate']").val('').prop("selected",true);
	searchForm.action="manage_sellerBoard.do";
	searchForm.submit();
}
$("#resetBtn").on("click",hadleResetLists);

//검색버튼
const searchReport=()=>{

		searchForm.action="manage_sellerBoard.do";
		searchForm.submit();
}

$("#searchBtn").on("click",searchReport);

	
const boardList = document.querySelectorAll(".boardList")

const selectBoard=()=>{
	const code = event.target.parentNode.firstChild.nextSibling.innerText;
	$.ajax({
		url:"ajaxDetailBoard.do",
		type:"post",
		data:{"no_code":code}
	}).done(function(result){
		$("#no_code").val(result.no_code)
		$("#no_id").val(result.no_id)
		$("#s_report").val(result.s_report)
		let status= result.s_status
		status=="U"?$("#s_status").val("이용중"):
				"M"?("#s_status").val("한달정지"):("#s_status").val("영구정지")
		$("#no_title").val(result.no_title)
		$("#no_date").val(result.no_date)
		let str=result.no_subject;
		$("#no_subject").html(result.no_subject)
	})
}

Array.from(boardList).forEach(function (element) {
    $(element).off("click").on('click', selectBoard);
})

</script>