<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>              
            
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="mb-3 ">
                            <h6><i  class="icon-credit-card mr-1"></i>결제관리 <i class="fas fa-chevron-right mx-2"></i>판매자결제내역</h6>
                        </div>
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
                           구매자검색
                     </h5>
                    <div class="card mb-4">
                        <div class="card-body">
                           <form id="searchForm" method="get">
                            <table class="table caption-top table-bordered  text-center">
                                <tbody>
                                	<tr>
                                        <th class="align-middle table-primary">구매자아이디</th>
                                        <td>
                                        	
                                        		<input class="form-control custom-shadow" id="" name="b_email" type="text" value='<c:out value="${pageMaker.cri.b_email }"/>'>
                                    		
                                    	</td>
                                        <th class="align-middle table-primary">서비스명</th>
                                        <td>
                                        	
                                        		<input class="form-control custom-shadow" id="" name="ser_title" type="text" value='<c:out value="${pageMaker.cri.ser_title }"/>'>
                                    		
                                    	</td>
                                    </tr>
                                     <tr>
                                    </tr>
                                       <tr>
                                    	<th class="align-middle table-primary">1차 카테고리</th>
                                    	<td>
                                    		<select id="searchCategory" name="pay_cate" class="custom-select  form-control custom-shadow ">
				                                <option value="" selected>선택</option>
				                                <option value="CAT1" <c:out value="${pageMaker.cri.pay_cate eq 'CAT1'? 'selected':'' }"/>>앱</option>
				                                <option value="CAT2" <c:out value="${pageMaker.cri.pay_cate eq 'CAT2'? 'selected':'' }"/>>웹</option>
				                                <option value="CAT3" <c:out value="${pageMaker.cri.pay_cate eq 'CAT3'? 'selected':'' }"/>>게임</option>
				                                <option value="CAT4" <c:out value="${pageMaker.cri.pay_cate eq 'CAT4'? 'selected':'' }"/>>보안</option>
				                                <option value="CAT5" <c:out value="${pageMaker.cri.pay_cate eq 'CAT5'? 'selected':'' }"/>>기술지원</option>
				                                <option value="CAT6" <c:out value="${pageMaker.cri.pay_cate eq 'CAT6'? 'selected':'' }"/>>기획</option>
				                            </select>
                                    	</td>
                                    	<th class="align-middle table-primary">2차 카테고리</th>
                                    	<td>
                                    		<select id="sub_cate" name="pay_cate1" class="custom-select  form-control custom-shadow">
				                                
				                            </select>
                                    	</td>
                                    </tr>
                                   
                                    <tr>
                                        <th class="align-middle table-primary">결제일자</th>
                                        <td colspan="3">
                                        	<div class="d-flex align-items-center">
                                        		<div class="col-3 p-0">
	                                        	<input type="date" name="pay_date" class="form-control"  value='<c:out value="${pageMaker.cri.pay_date }"/>'>
	                                        	</div>
	                                        	<span class="mx-2"><i class="fas fa-minus"></i></span>
	                                        	<div class="col-3 p-0">
	                                        	<input type="date" name="pay_date2" class="form-control" value='<c:out value="${pageMaker.cri.pay_date2 }"/>' >
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
                            구매자내역조회
                        </h5>
                	    <div class="card">
                            <div class="card-body">
                                <div class=" mb-3">총 <span class="mx-1 text-danger">${total }</span>건</div>
		                     <table class="table table-bordered thead-light text-center table-hover">		                        
		                         <thead class="table-active">
		                         	<tr>
		                         		<th width="10%">결제코드</th>
		                         		<th>구매자</th>
		                         		<th>결제금액</th>
		                         		<th>구매상태</th>        		
		                         	</tr>
		                         </thead>
		                         <tbody>
		                          <c:if test="${!empty paymentLists }">
		                            <c:forEach var="payment" items="${paymentLists }">
			                             <tr class="paymentList" onclick="javascript:clickTrRow(this);">
			                                <td>${payment.pay_code }</td>
			                                <td>${payment.b_email }</td>
			                                <td>${payment.pay_price }</td>
			                                <c:if test="${empty payment.pay_enddate  }">
			                                 <td class="text-danger">확정대기</td>
			                                </c:if>
			                                 <c:if test="${!empty payment.pay_enddate  }">
			                                 <td class="text-primary">${fn:substring(payment.pay_enddate,0,11) }</td>
			                                </c:if>
			                             </tr>
		                             </c:forEach>
		                            </c:if>
		                             <c:if test="${empty paymentLists }">
		                             	<td colspan="5">조회 된 데이터가 없습니다.</td>
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
				                    
				                    <form id="actionForm" action="manage_buyerPayment.do" method="get">
										 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
										 <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
										 <input type="hidden" name="b_email" value="${pageMaker.cri.b_email }">
							             <input type="hidden" name="ser_title" value="${pageMaker.cri.ser_title }">
							             <input type="hidden" name="pay_cate" value="${pageMaker.cri.pay_cate }">
							             <input type="hidden" name="pay_cate1" value="${pageMaker.cri.pay_cate1 }">
							             <input type="hidden" name="pay_date" value="${pageMaker.cri.pay_date }">
										 
									</form>
		                   </div>
               			</div>
                	</div>
                	<div class="col-6">
                           <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            상세조회
                        </h5>
                	    <div class="card">
		                   <div class="card-body">
                                <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                        <tr>
                                            <th width="20%" class="table-primary align-middle">결제코드</th>
                                            <td><input class="form-control custom-shadow " id="pay_code" name="" value="" type="text" readonly ></td>
                                            <th class="table-primary align-middle">결제날짜</th>
                                            <td><input class="form-control custom-shadow " id="pay_date" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">구매자아이디</th>
                                            <td><input class="form-control custom-shadow" id="b_email" name="" value="" type="text" readonly></td>
                                             <th class="table-primary align-middle">구매자상태</th>
                                            <td><input class="form-control custom-shadow" id="b_status" name="" value="" type="text" readonly></td>
                                            <!-- c:if 사용자 or 블랙리스트 -->
                                           
                                        </tr>
                                        <tr>
                                        	 <th class="table-primary align-middle">구매확정</th>
                                            <td><input class="form-control custom-shadow " id="pay_end" name="" value="" type="text" readonly></td>
                                            <!-- c:if 확정전, 확정완료 -->
                                             <th class="table-primary align-middle">확정날짜</th>
                                            <td><input class="form-control custom-shadow " id="pay_enddate" name="" value="" type="text" readonly></td>
                                            <!-- c:if 해당없음, 2021-01-28 -->
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">서비스코드</th>
                                            <td><input class="form-control custom-shadow" id="s_code" name="" value="" type="text" readonly></td>
                                            <th class="table-primary align-middle">서비스구분</th>
                                            <td colspan="3"><input class="form-control custom-shadow" id="ser_team" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                        	<th class="table-primary align-middle">카테고리</th>
                                            <td colspan="3">
                                            	<div class="d-flex">
                                            	<div class="col-5 p-0">
                                            		<input class="form-control custom-shadow " id="ser_cate" name="" value="" type="text" readonly>
                                            	</div>
                                            	<div class="col-6 ml-3 p-0">
                                            		<input class="form-control custom-shadow " id="sub_name" name="" value="" type="text" readonly>
                                            	</div>
                                               </div>
                                            
                                            </td>
                                        </tr>
                                        <tr>
                                        	<th class="table-primary align-middle">서비스명</th>
                                            <td colspan="3"><input class="form-control custom-shadow" id="ser_title" name="" value="" type="text" readonly></td>
                                        </tr>
                                        
                                        <tr>
                                            <th class="table-primary align-middle">판매자구분</th>
                                            <td><input class="form-control custom-shadow" id="s_author" name="" value="" type="text" readonly></td>
                                            <th class="table-primary align-middle">판매자아이디</th>
                                            <td><input class="form-control custom-shadow" id="s_email" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">결제금액</th>
                                            <td><input class="form-control custom-shadow" id="pay_price" name="" value="" type="text" readonly></td>
                                            <th class="table-primary align-middle">쿠폰사용</th>
                                            <td><input class="form-control custom-shadow" id="pay_coupon" name="" value="" type="text" readonly></td>
                                            <!-- 쿠폰 사용x -> 해당없음 출력 -->
                                        </tr>
                                    </tbody>
                                </table>
		                   </div>
               			</div>
                	</div>
                 </div>
             </div>


<script type="text/javascript">
//전체목록 페이징

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

//결제날짜 변경
let startDate =$("input[name='pay_date']");
let endDate =$("input[name='pay_date2']");
const handlePayDate =()=>{
	$(endDate).val($(startDate).val())
	$(endDate).attr("min",$(startDate).val())

}

$("input[name='pay_date']").on("change",handlePayDate);

//초기화
const hadleResetLists =()=>{
	$(startDate).val("")
	$(endDate).val("")
	$("input[name='b_email']").val('')
	$("input[name='ser_title']").val('')
	$("select[name='pay_cate']").val('').prop("selected",true);
	searchForm.action="manage_buyerPayment.do";
	searchForm.submit();
}
$("#resetBtn").on("click",hadleResetLists);

//검색
//검색버튼
const searchReport=()=>{

		searchForm.action="manage_buyerPayment.do";
		searchForm.submit();
}
$("#searchBtn").on("click",searchReport);

//카테고리 select
const getOption=()=>{
	  var obj = {
		   "CAT1" :{
			   "SUB1-1":"앱개선,버그수정",
			   "SUB1-2":"네이티브웹",
			   "SUB1-3":"앱생성"
		   },
		   "CAT2" :{
			   "SUB2-1":"웹사이트 제작",
			   "SUB2-2":"웹사이트개선,버그수정",
			   "SUB2-3":"프론트엔드,퍼블리싱",
			   "SUB2-4":"검색최적화"
		   },
		   "CAT3":{
			   "SUB3-1":"전체",
			   "SUB3-2":"2D",
			   "SUB3-3":"3D",
			   "SUB3-4":"AR"
		   },
		   "CAT4":{
			   "SUB4-1":"웹",
			   "SUB4-2":"WINDOWS",
			   "SUB4-3":"MAC",
			   "SUB4-4":"안드로이드",
			   "SUB4-5":"아이폰"
		   },
		   "CAT5":{
			   "SUB5-1":"엑셀",
			   "SUB5-2":"조립컴퓨터",
			   "SUB5-3":"컴퓨터수리",
			   "SUB5-4":"작업환경세팅"
		   },
		   "CAT6":{
			   "SUB6-1":"엑셀",
			   "SUB6-2":"조립컴퓨터",
			   "SUB6-3":"컴퓨터수리"
		   }
	  } 
	  return obj;
   }
const handleCategoryChange=()=>{
	let arrType=getOption();
	let optionType=$("#sub_cate");
	optionType.empty();
	
	let val=$("#searchCategory").val();
	
	 if(val=="CAT1"){
		for(prop in arrType["CAT1"]){
			optionType.append('<option value='+prop+' >'+arrType["CAT1"][prop]+'</option>')
		}
	} 
	 if(val=="CAT2"){
			for(prop in arrType["CAT2"]){
				optionType.append('<option value='+prop+' >'+arrType["CAT2"][prop]+'</option>')
			}
		} 
	 if(val=="CAT3"){
			for(prop in arrType["CAT3"]){
				optionType.append('<option value='+prop+' >'+arrType["CAT3"][prop]+'</option>')
			}
		} 
	 
	 if(val=="CAT4"){
			for(prop in arrType["CAT4"]){
				optionType.append('<option value='+prop+' >'+arrType["CAT4"][prop]+'</option>')
			}
		} 
	 if(val=="CAT5"){
			for(prop in arrType["CAT5"]){
				optionType.append('<option value='+prop+' >'+arrType["CAT5"][prop]+'</option>')
			}
		}
	 if(val=="CAT6"){
			for(prop in arrType["CAT6"]){
				optionType.append('<option value='+prop+' >'+arrType["CAT6"][prop]+'</option>')
			}
		}
	
	 
}

handleCategoryChange();
$("#searchCategory").on("change",handleCategoryChange);


const selectPayment=()=>{
	const code = event.target.parentNode.firstChild.nextSibling.innerText;
	$.ajax({
		url:"ajaxSelectBuyerPayment.do",
		type:"post",
		data:{"pay_code":code}
	}).done(function(result){
		console.log(result)
		$("#pay_code").val(result.pay_code)
		$("#pay_date").val(result.pay_date)
		$("#b_email").val(result.b_email)
		let b_status=result.b_status;
		b_status=="U"?$("#b_status").val("사용자"):
			b_status="M"?$("#b_status").val("블랙리스트"):$("b_status").val("영구정지")
		let pay_end = result.pay_enddate
		pay_enddate!=null?$("#pay_end").val("확정대기"):$("#pay_end").val("확정완료")
		pay_enddate!=null?$("#pay_enddate").val("확정대기"):$("#pay_enddate").val(pay_end)
		$("#s_code").val(result.s_code)
		$("#ser_cate").val(result.cat_name)
		$("#sub_name").val(result.sub_name)
		$("#s_author").val(result.s_author)
		$("#ser_title").val(result.ser_title)
		$("#s_email").val(result.s_email)
		$("#ser_team").val(result.ser_team)
		$("#pay_price").val(result.pay_price)
		let coupon= result.pay_coupon;
		coupon!=null?$("#pay_coupon").val(result.pay_coupon+"% 쿠폰"):$("#pay_coupon").val("없음")
	})
}

const paymentList = document.querySelectorAll(".paymentList")

Array.from(paymentList).forEach(function (element) {
    $(element).off("click").on('click', selectPayment);
})

</script>
		
			


            
              
             
            
                
               
          