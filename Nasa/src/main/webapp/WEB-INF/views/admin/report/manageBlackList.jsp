<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>           
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>      
<div class="page-breadcrumb">
                        <div class="row">
                            <div class="col-7 align-self-center">
                                <div class="mb-5 ">
                                    <h6><i  class=" icon-user-unfollow mr-1"></i>신고관리 <i class="fas fa-chevron-right mx-2"></i>블랙리스트 관리</h6>
                                </div>
                                <ul class="list-style-none d-flex">
                                    <li class="mr-1">총 블랙리스트 <span class="text-danger mx-1">${total }</span>명</li>
                                    <div class="mx-3 bg-light position-relative" style="height: 20px; width: 3px; top:3px"></div>
                                    <li class="mx-2">오늘의 블랙리스트 <span class="text-danger mx-1">${todayBlack }</span>명</li>
                                    <div class="mx-3 bg-light position-relative" style="height: 20px; width: 3px; top:3px"></div>
                                    <li class="mx-2">오늘의 영구정지 <span class="text-danger mx-1">${todayStop }</span>명</li>
                                    
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
                            <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                                   서비스검색
                             </h5>
                            <div class="card mb-4">
                                <div class="card-body">
                                  <form id="searchForm" method="get">
                                    <table class="table caption-top table-bordered  text-center">
                                        <tbody>
                                            <tr>
                                                <th class="align-middle table-primary">아이디</th>
                                                <td colspan="3"><input class="form-control custom-shadow" id="" name="email" type="text" value='<c:out value="${pageMaker.cri.email }"/>'></td>
                                                
                                            </tr>
                                            <tr>
                                                <th class="align-middle table-primary">이름</th>
                                                <td><input class="form-control custom-shadow" id="" name="name" type="text" value='<c:out value="${pageMaker.cri.name }"/>'></td>
                                                <th class="align-middle table-primary">닉네임</th>
                                                <td><input class="form-control custom-shadow" id="" name="nickname" type="text" value='<c:out value="${pageMaker.cri.nickname }"/>'></td>
                                            </tr>
                                            
                                             <tr>
                                                
                                                <th class="text-center align-middle table-primary">상태</th>
                                                <td>
                                                    <div class="d-flex align-items-center position-relative" style="top:5px; left: 10px;">
                                                        <div class="custom-control custom-radio mr-3 ">
                                                            <input type="radio" id="customRadio1" name="status" class="custom-control-input mr-5" value="M" <c:out value="${pageMaker.cri.status eq 'M'? 'checked':'' }"/>>
                                                            <label class="custom-control-label" for="customRadio1">한달정지</label>
                                                        </div>
                                                        <div class="custom-control custom-radio mx-3">
                                                            <input type="radio" id="customRadio2" name="status" class="custom-control-input mr-5" value="D" <c:out value="${pageMaker.cri.status eq 'D'? 'checked':'' }"/>>
                                                            <label class="custom-control-label" for="customRadio2">영구정지</label>
                                                        </div>
                                                    </div>
                                                </td>
                                                
                                                 <th class="text-center align-middle table-primary">구분</th>
                                                <td>
                                                    <div class="d-flex align-items-center position-relative" style="top:5px; left: 10px;">
                                                        <div class="custom-control custom-radio mr-3 ">
                                                            <input type="radio" id="customRadio3" name="gb" class="custom-control-input mr-5" value="b" <c:out value="${pageMaker.cri.gb eq 'b'? 'checked':'' }"/>>
                                                            <label class="custom-control-label" for="customRadio3">구매자</label>
                                                        </div>
                                                        <div class="custom-control custom-radio mx-3">
                                                            <input type="radio" id="customRadio4" name="gb" class="custom-control-input mr-5" value="s" value="b" <c:out value="${pageMaker.cri.gb eq 's'? 'checked':'' }"/>>
                                                            <label class="custom-control-label" for="customRadio4">판매자</label>
                                                        </div>
                                                        
                                                       
                                                        
                                                    </div>
                                                </td>
                                                
                                                
                                            </tr>
                                            
                                            <tr>
						                           <th class="align-middle table-primary">정지일자</th>
						                            <td colspan="3">
						                                <div class="d-flex align-items-center">
						                                     <div class="col-3 p-0">
							                                     <input type="date" class="form-control" name="blackdate" value='<c:out value="${pageMaker.cri.blackdate }"/>'>
							                                  </div>
							                                  <span class="mx-2"><i class="fas fa-minus"></i></span>
							                                  <div class="col-3 p-0">
							                                       <input type="date" class="form-control" name="blackdate2" value='<c:out value="${pageMaker.cri.blackdate2 }"/>'>
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
                        
                        <div class="row mt-5">
                            <div class="col-5">
                               <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                                    블랙리스트
                                    
                                </h5>
                                <div class="card">
                                    <div class="card-body">
                                        <div class=" mb-3">총 <span class="mx-1 text-danger">${searchTotal }</span>건</div>
                                     <table class="table table-bordered thead-light text-center table-hover">		                        
                                         <thead class="table-active">
                                             <tr>
                                                
                                                 <th width="250px">아이디</th>
                                                 <th>이름</th>
                                                 <th>구분</th>
                                                 <th>상태</th>	
                                             </tr>
                                         </thead>
                                         <tbody>
                                           <c:if test="${!empty blackList }">
	                                           <c:forEach var="black" items="${blackList }">
	                                             <tr class="blackList" onclick="javascript:clickTrRow(this);">
	                                                <td>${black.email }</td>
	                                                <td>${black.name }</td>
	                                                
	                                                 <c:if test="${black.gb eq 's' }">
	                                                   <td>판매자</td>
	                                                 </c:if>
	                                                 
	                                                 <c:if test="${black.gb eq 'b' }">
	                                                   <td>구매자</td>
	                                                 </c:if>
	                                                
	                                                <c:if test="${black.status eq 'M' }">
	                                                 <td>한달정지</td>
	                                                 </c:if>
	                                                 
	                                                 <c:if test="${black.status eq 'D' }">
	                                                   <td>영구정지</td>
	                                                 </c:if>
	                                             </tr>
	                                            </c:forEach>
                                             </c:if>
                                             <c:if test="${empty blackList }">
                                             	<td colspan="4">조회된 데이터가 없습니다.</td>
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
								                    
								                      <form id="actionForm" action="go_admin.do" method="get">
														 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
														 <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
														 <input type="hidden" name="email" value="${pageMaker.cri.email }">
														 <input type="hidden" name="nickname" value="${pageMaker.cri.nickname }">
														 <input type="hidden" name="status" value="${pageMaker.cri.status }">
														 <input type="hidden" name="gb" value="${pageMaker.cri.gb }">
													</form>
                                   </div>
                                   </div>
                            </div>
                            <div class="col-7">
                                   <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                                    상세조회
                                </h5>
                                <div class="card">
                               
                                   <div class="card-body my-3">
                                   		<table class="table  table-bordered thead-light  text-center">
                                   			<tbody>
                                   				<tr>
                                   					
                                   					<th width="20%" class="table-primary align-middle">회원아이디</th>
                                   					<td><input class="form-control custom-shadow " id="email" name="email" value="" type="text" readonly ></td>
                                   					<th width="20%" class="table-primary align-middle">회원등급</th>
                                   					<td><input class="form-control custom-shadow " id="rank"  value="" type="text" readonly ></td>
                                   				</tr>
                                   				<tr>
                                   					<th width="20%" class="table-primary align-middle">회원이름</th>
                                   					<td><input class="form-control custom-shadow " id="name" name="" value="" type="text" readonly ></td>
                                   					<th width="20%" class="table-primary align-middle">회원닉네임</th>
                                   					<td><input class="form-control custom-shadow " id="nickname" name="" value="" type="text" readonly ></td>
                                   				</tr>
                                   				<tr>
                                   					<th width="20%" class="table-primary align-middle">회원구분</th>
                                   					<td><input class="form-control custom-shadow " id="gb" name="" value="" type="text" readonly ></td>
                                   					<th width="20%" class="table-primary align-middle">가입일자</th>
                                   					<td><input class="form-control custom-shadow " id="joindate" name="" value="" type="text" readonly ></td>
                                   				</tr>
                                   				<tr>
                                   					<th width="20%" class="table-primary align-middle">회원상태</th>
                                   					<td><input class="form-control custom-shadow " id="status" name="" value="" type="text" readonly ></td>
                                   				</tr>
                                   				<tr>
                                   					<th width="20%" class="table-primary align-middle">신고횟수</th>
                                   					<td><input class="form-control custom-shadow " id="report" name="" value="" type="text" readonly ></td>
                                   					<th width="20%" class="table-primary align-middle">정지일자</th>
                                   					<td><input class="form-control custom-shadow " id="date" name="" value="" type="text" readonly ></td>
                                   				</tr>
                                   			</tbody>
                                   		</table>
                                   		<!-- <div class="mt-5 p-2 bg-warning text-white d-flex justify-content-between " style="border-radius:3px">
                                   			<div>신고횟수: <span class="">4</span>건</div>
                                   			
                                   		</div> -->
                                 
                
                                         
                                   </div>
                                 </div>
                            </div>
                        </div>
                    
                   
                
        
        
                 </div>
                 
    <script>
    	
    let actionForm = $("#actionForm");
    $(".page-item a").on("click", function (e) {
        e.preventDefault();
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        actionForm.submit();
    })
    
    //정지날짜 변경
	let startDate =$("input[name='blackdate']");
	let endDate =$("input[name='blackdate2']");
	const handleReportDate =()=>{
		$(endDate).val($(startDate).val())
		$(endDate).attr("min",$(startDate).val())
		
		
	}
	$("input[name='blackdate']").on("change",handleReportDate);
    //초기화버튼
	const hadleResetLists =()=>{

		$("input[name='email']").val('')
		$("input[name='name']").val('')
		$("input[name='nickname']").val('')
		$("input[name='status']").val('')
		$("input[name='gb']").val('')
	
		
		searchForm.action="manageBlackList.do";
		searchForm.submit();
	}
	$("#resetBtn").on("click",hadleResetLists);

    
    //검색버튼
	const searchReport=()=>{
	
			searchForm.action="manageBlackList.do";
			searchForm.submit();
	}
	
	$("#searchBtn").on("click",searchReport);
	
	
	function clickTrRow(target){
		const tbody= target.parentNode;
		const trs = tbody.getElementsByTagName('tr');
		
		for(var i=0; i<trs.length;i++){
			trs[i].style.backgroundColor="";
		} 
		target.style.backgroundColor="#dadde0";
	}
    
    const blackList = document.querySelectorAll(".blackList");
    
    const selectBlackList=()=>{
    	
    	const email = event.target.parentNode.firstChild.nextSibling.innerText;
    	$.ajax({
    		url:"ajaxSelectBlack.do",
    		type:"post",
    		data:{"email":email}
    	}).done(function(result){
    		$("#email").val(result.email)
    		let gb = result.gb;
    		gb=="b"?$("#gb").val("구매자"):$("#gb").val("판매자")
    		$("#name").val(result.name)
    		$("#nickname").val(result.nickname)
    		$("#report").val(result.report)
    		let status = result.status;
    		status=="M"?$("#status").val("한달정지"):$("#status").val("영구정지")
    		$("#date").val(result.blackdate)
    		$("#joindate").val(result.joindate)
    		let rank = result.rank;
    		rank=="1"?$("#rank").val("별"):
    			rank=="2"?$("#rank").val("달"):
    				rank=="3"?$("#rank").val("지구"):$("#rank").val("태양")
    		
    	})
    }
    
    Array.from(blackList).forEach(function (element) {
        $(element).off("click").on('click', selectBlackList);
    })
    
    </script>