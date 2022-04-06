<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>           
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
            
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="mb-3 ">
                            <h6><i  class=" far fa-bell mr-1"></i>신고관리 <i class="fas fa-chevron-right mx-2"></i>전체신고조회</h6>
                        </div>
                        
                         <ul class="list-style-none d-flex mt-4">
			                <li class="mr-1">총 신고 <span class="text-danger mx-1">${realTotal }</span>개
			                </li>
			                <div class="mx-3 bg-light position-relative" style="height: 20px; width: 3px; top: 3px"></div>
			                
			                 <li class="mx-2">오늘의 신고 <span class="text-danger mx-1">${todayReport }</span>개
			                 </li>
			                 
			                 <div class="mx-3 bg-light position-relative" style="height: 20px; width: 3px; top: 3px"></div>
			                
			                 <li class="mx-2">대기 중인 신고 <span class="text-danger mx-1">${waitTotal }</span>개
			                 </li>
			
			                
			            </ul>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                    <h5 class="p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                           신고검색
                     </h5>
                    <div class="card mb-4">
                        <div class="card-body">
                          <form id="searchForm" method="get">
                            <table class="table caption-top table-bordered  text-center">
                                <tbody>
                                    <tr>
                                        <th class="align-middle table-primary">신고유형</th>
                                        <td>
                                        	<div class="col-6">
                                        	<select name="re_type" class="custom-select  form-control custom-shadow ">
                                        		<option value="" id="choice" selected>선택</option>
				                                <option value="욕설/비방" <c:out value="${pageMaker.cri.re_type eq '욕설/비방'? 'selected':'' }"/>>비방/욕설</option>
				                                <option value="스팸, 부적절한 광고" <c:out value="${pageMaker.cri.re_type eq '스팸, 부적절한 광고'? 'selected':'' }"/>>스팸/부적절한 광고</option>
				                                <option value="혐오/잔인한 사진" <c:out value="${pageMaker.cri.re_type eq '혐오/잔인한 사진'? 'selected':'' }"/>>혐오/잔인한사진</option>
				                                <option value="음란물" <c:out value="${pageMaker.cri.re_type eq '음란물'? 'selected':'' }"/>>음란물</option>
				                                <option value="채팅신고" <c:out value="${pageMaker.cri.re_type eq '채팅신고'? 'selected':'' }"/>>채팅신고</option>
				                                <option value="기타" <c:out value="${pageMaker.cri.re_type eq '기타'? 'selected':'' }"/>>기타</option>
				                            </select>
				                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="align-middle table-primary">신고자아이디</th>
                                        <td>
                                        	<div class="col-6">
                                        		<input class="form-control custom-shadow" id="id" name="re_reporter" type="text" value='<c:out value="${pageMaker.cri.re_reporter }"/>'></td>
                                    		</div>
                                    </tr>
                                    <tr>
                                        <th class="align-middle table-primary">신고일자</th>
                                        <td>
                                        	<div class="d-flex align-items-center">
                                        		<div class="col-3">
	                                        	<input type="date" class="form-control" name="re_date" value='<c:out value="${pageMaker.cri.re_date }"/>'>
	                                        	</div>
	                                        	<span class="mx-2"><i class="fas fa-minus"></i></span>
	                                        	<div class="col-3">
	                                        	<input type="date" class="form-control" name="re_date2" value='<c:out value="${pageMaker.cri.re_date2 }"/>'>
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
                            신고조회
                        </h5>
                	    <div class="card">
                            <div class="card-body">
                             
                            	<ul class="nav nav-tabs mb-3">
                                    <li class="nav-item">
                                        <a href="report_inquiry.do"  class="nav-link  active">
                                            <i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block">신고목록</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="report_wait.do"  class="nav-link">
                                            <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block">신고대기</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="report_complete.do" class="nav-link">
                                            <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block">신고완료</span>
                                        </a>
                                    </li>
                                     <li class="nav-item">
                                        <a href="report_refuse.do" class="nav-link">
                                            <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block">신고반려</span>
                                        </a>
                                    </li>
                                </ul>
                              
                            
                              <div class=" my-4">총 <span class="mx-1 text-danger">${total }</span>건</div>
		                     <table class="table table-bordered thead-light text-center table-hover">		                        
		                         <thead class="table-active">
		                         	<tr>
		                         		<th>신고코드</th>       		
		                         		<th>신고유형</th>
		                         		<th>피신고자아이디</th>
		                         		<th>신고일자</th>
		                         		<th>상태</th>
		                         	</tr>
		                         </thead>
		                         <tbody>
		                            <c:if test="${!empty reportLists }">
			                           <c:forEach var="report" items="${reportLists }">
			                           	 <tr class="reportList" onclick="javascript:clickTrRow(this);">
			                           	 	
			                                <td>${report.re_code }</td>
			                                <td>${report.re_type }</td>
			                                <td>${report.re_res }</td>
			                                <td>${fn:substring(report.re_date,0,11) }</td>
			                                <c:if test="${empty report.re_result }">
			                                	<td class="text-primary">대기</td>
			                                </c:if>
			                                <c:if test="${report.re_result eq 'Y'}">
			                                	<td>승인</td>
			                                </c:if>
			                                <c:if test="${report.re_result eq 'D'}">
			                                	<td class="text-danger">반려</td>
			                                </c:if>
			                             </tr>
			                           </c:forEach>
		                             </c:if>
		                             <c:if test="${empty reportLists }">
		                             	<td colspan="5">조회 된 데이터가 없습니다.</td>
		                             </c:if>
                                     
		                        </tbody>
		                     </table>
		
			          <div class="d-flex justify-content-center mt-5">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev }">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageMaker.startPage -1 }" aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                            <span class="sr-only">이전</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                                    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
                                        <a class="page-link" href="${num }">${num }</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${pageMaker.next }">
                                    <li class="page-item">
                                        <a class="page-link" href="${pageMaker.endPage + 1 }" aria-label="Next">
                                            <span aria-hidden="true">»</span>
                                            <span class="sr-only">다음</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                      <form id="actionForm" action="report_inquiry.do" method="get">
			            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			            <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			            <input type="hidden" name="re_type" value="${pageMaker.cri.re_type }">
			            <input type="hidden" name="re_reporter" value="${pageMaker.cri.re_reporter }">
			            <input type="hidden" name="re_date" value="${pageMaker.cri.re_date }">
			             <input type="hidden" name="re_date2" value="${pageMaker.cri.re_date2 }">
			            
			        </form>
                    
		                   </div>
               			</div>
                	</div>
                	<div class="col-6">
                           <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            신고 상세조회
                        </h5>
                	    <div class="card">
                           <div class="d-flex justify-content-end mr-4">
                                <button class="btn btn-outline-primary mr-3 mt-3" id="confirmBtn" style="visibility:hidden">승인</button>
                                <button id="deniedBtn" class="btn btn-outline-dark  mt-3" data-toggle="modal" data-target="#refuse-report-modal" style="visibility:hidden">반려</button>
                                
                            </div>
		                   <div class="card-body">
                                <table id="report_tbl" class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">신고코드</th>
                                            <td ><input class="form-control custom-shadow " id="re_code" name="re_code" value="" type="text" readonly ></td>
                                            <th width="18%" class="table-primary align-middle">신고일자</th>
                                            <td><input class="form-control custom-shadow " id="re_date" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">신고자</th>
                                            <td colspan="3"><input class="form-control custom-shadow " id="re_reporter" name="" value="" type="text" readonly ></td>
                                            
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-danger align-middle">피신고자</th>
                                            <td colspan="3"><input class="form-control custom-shadow " id="re_res" name="re_res" value="" type="text" readonly ></td>
                                            
                                        </tr>
                                        <tr>
                                        	<th width="18%" class="table-danger align-middle">신고횟수</th>
                                            <td>
                                               <div class="col-6 p-0 d-flex align-items-center">
                                            	<input class="form-control custom-shadow mr-2 text-danger" id="total_report" name="" value="" type="text" readonly >회
                                        	   </div>
                                        	</td>
                                        	<th width="18%" class="table-primary align-middle">신고유형</th>
                                            <td><input class="form-control custom-shadow " id="re_type" name="re_type" value="" type="text" readonly ></td>
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">신고처리</th>
                                            <td ><input class="form-control custom-shadow " id="re_result" name="re_result" value="" type="text" readonly ></td>
                                            <th width="18%" class="table-primary align-middle">처리일자</th>
                                            <td><input class="form-control custom-shadow " id="re_rpoertdate" name="re_rpoertdate" value="" type="text" readonly ></td>
                                        </tr>
                                         <tr>
                                            <th colspan="4" class="table-primary align-middle">신고내용</th>
                                        </tr>
                                        <tr>
											<td colspan="4" >
												<textarea rows="5" class="form-control" id="re_subject" readonly></textarea>
											
											</td>                                 
                                        </tr>
                                        <tr >
                                            <th colspan="4" class="table-primary align-middle">첨부파일</th>
                                            
                                        </tr>
                                        <tr>
                                        	<td colspan="4" id="filecode"></td>
                                        </tr>
                                    </tbody>
                                </table>
		
			                     
		                   </div>
               			</div>
                	</div>
                </div>
                
                
                <!-- 반려모달 -->
                
              <form id="frm" type="post">  
                <div id="refuse-report-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="dark-header-modalLabel" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header modal-colored-header bg-primary">
                                                <h4 class="modal-title" id="dark-header-modalLabel">신고 반려</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table caption-top table-bordered thead-light">		                        
                                    <tbody>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">신고코드</th>
                                            <td ><input class="form-control custom-shadow " id="r_code" name="re_code" value="" type="text" readonly ></td>
                                            <th width="18%" class="table-primary align-middle">신고일자</th>
                                            <td><input class="form-control custom-shadow " id="r_date" name="re_date" value="" type="text" readonly ></td>
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">신고자</th>
                                            <td ><input class="form-control custom-shadow " id="r_id" name="re_reporter" value="" type="text" readonly ></td>
                                            <th width="18%" class="table-primary align-middle">신고유형</th>
                                            <td><input class="form-control custom-shadow " id="r_type" name="re_type" value="" type="text" readonly ></td>
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-danger align-middle">피신고자</th>
                                            <td ><input class="form-control custom-shadow " id="res_id" name="re_res" value="" type="text" readonly ></td>
                                            <th width="18%" class="table-danger align-middle">신고횟수</th>
                                            <td>
                                               <div class="col-6 p-0 d-flex align-items-center">
                                            	<input class="form-control custom-shadow mr-2 text-danger" id="r_total" name="" value="" type="text" readonly >회</td>
                                        	   </div>
                                        </tr>
                                         <tr>
                                            <th colspan="4" class="table-primary align-middle">반려사유</th>
                                        </tr>
                                        <tr>
											<td colspan="4" >
												<textarea rows="10" class="form-control" id="r_denied" wrap="hard"></textarea>
											
											</td>                                        
                                        </tr>
                                        
                                    </tbody>
                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" id="savedBtn" class="btn btn-primary">반려</button>
                                                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div>
                </form>
                
              
             
             
             
             
             
             
             </div>
		
			

<script type="text/javascript">
//신고날짜 변경
let startDate =$("input[name='re_date']");
let endDate =$("input[name='re_date2']");
const handleReportDate =()=>{
	$(endDate).val($(startDate).val())
	$(endDate).attr("min",$(startDate).val())
	
	
}
$("input[name='re_date']").on("change",handleReportDate);


function clickTrRow(target){
	const tbody= target.parentNode;
	const trs = tbody.getElementsByTagName('tr');
	
	for(var i=0; i<trs.length;i++){
		trs[i].style.backgroundColor="";
	} 
	target.style.backgroundColor="#dadde0";
}


//초기화 버튼

const hadleResetLists =()=>{
	$(startDate).val("")
	$(endDate).val("")
	$("input[name='re_reporter']").val('')
	$("select[name='re_type']").val('').prop("selected",true);
	searchForm.action="report_inquiry.do";
	searchForm.submit();
}
$("#resetBtn").on("click",hadleResetLists);


//전체목록 페이징처리
let actionForm = $("#actionForm");
$(".page-item a").on("click", function (e) {
    e.preventDefault();
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    actionForm.submit();
})

const reportList = document.querySelectorAll(".reportList");

const selectReport=()=>{
	
	const res = event.target.parentNode.lastChild.previousSibling.previousSibling.previousSibling.previousSibling.previousSibling.innerText;
	const reCode=event.target.parentElement.firstElementChild.innerText;

	$.ajax({
		url:"ajaxDetailedReport.do",
		type:"post",
		data:{"email":res,"re_code":reCode}
	}).done(function(result){
		removeTr();
		console.log(result)
		$("#re_code").val(result.re_code)
		$("#re_date").val(result.re_date)
		$("#re_reporter").val(result.re_reporter)
		$("#re_type").val(result.re_type)
		$("#re_res").val(result.re_res)
		
		//신고횟수
		let gb = result.gb;
		gb=='s'?$("#total_report").val(result.report):$("#total_report").val(result.report)
		
		//신고결과
		let re_result =result.re_result;
			re_result=='Y'?$("#re_result").val("승인"):
				re_result=='D'?$("#re_result").val("반려"):$("#re_result").val("대기")
		//신고처리날짜
		let re_date = result.re_rpoertdate
		if(re_date ==null){
			$("#re_rpoertdate").val("대기");
			$("#confirmBtn").css('visibility','visible');
			$("#deniedBtn").css('visibility','visible');
		
		}else{
			$("#re_rpoertdate").val(result.re_rpoertdate);
			$("#confirmBtn").css('visibility','hidden');
			$("#deniedBtn").css('visibility','hidden');
		}
		
	    //신고내용
	    let subject= result.re_subject;
	    subject!=null?$("#re_subject").val(result.re_subject):$("#re_subject").val("없음")
		
		console.log(result.filecode);
		//파일
		let filecode= result.filecode
		let img = "<img src='"+filecode+"' style='width:300px'>"
		
		result.filecode==null?$("#filecode").text("해당없음"):$("#filecode").text('').append(img)
		
		//신고 결과가 반려일 경우
		 function removeTr(){
			$(".new-tr").remove();
		}
		if(re_result=='D'){
			
			let innerHtml='<tr class="new-tr">'
			innerHtml+='<th colspan="4" class="table-danger align-middle">신고반려사유</th>'
			innerHtml+='</tr>'
			innerHtml+='<tr class="new-tr">'
			innerHtml+='<td class="text-start" colspan="4" height="300px">'+result.re_denied+'</td>'
			innerHtml+='</tr>'
			
			
			$('#report_tbl').append(innerHtml);
			
		}
				
		//반려모달
		$("#r_code").val(result.re_code)
		$("#r_date").val(result.re_date)
		$("#r_id").val(result.re_reporter)
		$("#r_type").val(result.re_type)
		$("#res_id").val(result.re_res)
		gb=='s'?$("#r_total").val(result.report):$("#r_total").val(result.report)
				
	})
}
Array.from(reportList).forEach(function (element) {
    $(element).off("click").on('click', selectReport);
})

//승인 버튼
const confirmReport=()=>{
	if($("#re_code").val()!=""){
	let code=$("#re_code").val();
	let id=$("#re_res").val();

	let reportData={
			re_code:code,
			email:id
	}
	
		 $.ajax({
			url:"updateConfirmReport.do",
			data : JSON.stringify(reportData),
			headers:{'Content-Type':'application/json'},
			type:"post"
		    
		}).done(function(data){
			if(data.result==5){
				alert("해당 피신고자가 서비스를 이용 중입니다.")
				
			}else if (data.result==4){
				alert("해당 피신고자가 구매내역 확정을 받지 못했습니다.")				
			}else if (data.result==3){
				alert("해당 피신고자가 파워서비스를 이용 중입니다.")
			}else{
				alert("해당 신고를 승인했습니다.")
				window.location.reload();
			}
		}).fail(function(){
			alert("시스템 관리자에게 문의하세요.")
		}) 
	}
}
$("#confirmBtn").on("click",confirmReport);


//반려모달 저장 버튼
const deniedReport=()=>{
	let r_denied=$("#r_denied").val();
	if(r_denied==""){
		alert("내용을 입력해주세요.");
		$("#r_denied").focus();
	}else{
		let code =$("#r_code").val();
		let r_denied= $("#r_denied").val().replace(/\n/g, "<br />")
		$.ajax({
			url:"ajaxUpdateDeniedReport.do",
			type:"post",
			data:{"re_code":code,"re_denied":r_denied}
		}).done(function(result){
			if(result!=0){
			   alert("해당 신고는 반려되었습니다.")
			   $("#savedBtn").attr("data-dismiss","modal");
				window.location.reload();
			}else{
				alert("관리자에게 문의하세요.");
				$("#savedBtn").attr("data-dismiss","modal");
			}
			
		}).fail(function(result){
			alert("관리자에게 문의하세요.")
			$("#savedBtn").attr("data-dismiss","modal");
		})
	}
	
}

$("#savedBtn").on("click",deniedReport);

//검색버튼
const searchReport=()=>{
	let type=$("select[name='re_type'] option:selected").val();
	let reporterId =$("input[name='re_reporter']").val();
	startDate = $(startDate).val();
	console.log(reporterId)
//	if(type!="choice"||reporterId!=""||startDate!=""){
		searchForm.action="report_inquiry.do";
		searchForm.submit();
//	}else{
//		alert("검색어를 입력해주세요.")
//	}
	
	
}
$("#searchBtn").on("click",searchReport);



</script>
            
              
             
            
                
               
          