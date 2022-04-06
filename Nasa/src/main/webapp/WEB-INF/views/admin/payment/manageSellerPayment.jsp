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
                           판매자검색
                     </h5>
                    <div class="card mb-4">
                        <div class="card-body">
                           <form id="searchForm" method="get">
                            <table class="table caption-top table-bordered  text-center">
                                <tbody>
                                	<tr>
                                        <th class="align-middle table-primary">아이디</th>
                                        <td>
                                        	<input class="form-control custom-shadow" id="" name="s_email" type="text" value='<c:out value="${pageMaker.cri.s_email }"/>'>
                                    	</td>
                                    	<th class="align-middle table-primary">구분</th>
                                        <td>
                                            <div class="d-flex align-items-center position-relative" style="top:5px; left: 10px;">
                                                <div class="custom-control custom-radio mr-3 ">
                                                    <input type="radio" id="customRadio1" name="ser_team" value="개인" class="custom-control-input mr-5"<c:out value="${pageMaker.cri.ser_team eq '개인'? 'checked':'' }"/>>
                                                    <label class="custom-control-label" for="customRadio1">개인</label>
                                                </div>
                                                <div class="custom-control custom-radio mx-3">
                                                    <input type="radio" id="customRadio2" name="ser_team" value="기업" class="custom-control-input mr-5" <c:out value="${pageMaker.cri.ser_team eq '기업'? 'checked':'' }"/>>
                                                    <label class="custom-control-label" for="customRadio2">기업</label>
                                                </div>
                                            </div>
                                    	</td>
                                    </tr>
                                     <tr>
                                        <th class="align-middle table-primary">서비스명</th>
                                        <td colspan="3">
                                        	<input class="form-control custom-shadow" id="" name="ser_title" type="text" value='<c:out value="${pageMaker.cri.ser_title }"/>'>
                                    	</td>
                                    </tr>
                                    <tr>
                                    	<th class="align-middle table-primary">1차 카테고리</th>
                                    	<td>
                                    		<select id="searchCategory" name="ser_cate" class="custom-select  form-control custom-shadow ">
				                                <option value="" selected>선택</option>
				                                <option value="CAT1" <c:out value="${pageMaker.cri.ser_cate eq 'CAT1'? 'selected':'' }"/>>앱</option>
				                                <option value="CAT2" <c:out value="${pageMaker.cri.ser_cate eq 'CAT2'? 'selected':'' }"/>>웹</option>
				                                <option value="CAT3" <c:out value="${pageMaker.cri.ser_cate eq 'CAT3'? 'selected':'' }"/>>게임</option>
				                                <option value="CAT4" <c:out value="${pageMaker.cri.ser_cate eq 'CAT4'? 'selected':'' }"/>>보안</option>
				                                <option value="CAT5" <c:out value="${pageMaker.cri.ser_cate eq 'CAT5'? 'selected':'' }"/>>기술지원</option>
				                                <option value="CAT6" <c:out value="${pageMaker.cri.ser_cate eq 'CAT6'? 'selected':'' }"/>>기획</option>
				                            </select>
                                    	</td>
                                    	<th class="align-middle table-primary">2차 카테고리</th>
                                    	<td>
                                    		<select id="sub_cate" name="ser_sub_cate" class="custom-select  form-control custom-shadow">
				                                
				                            </select>
                                    	</td>
                                    </tr>
                                   
                                    <tr>
                                        <th class="align-middle table-primary">결제일자</th>
                                        <td colspan="3">
                                        	<div class="d-flex align-items-center">
                                        		<div class="col-3 p-0">
	                                        	<input type="date" class="form-control" name="power_date"  value='<c:out value="${pageMaker.cri.power_date }"/>'>
	                                        	</div>
	                                        	<span class="mx-4"><i class="fas fa-minus"></i></span>
	                                        	<div class="col-3 p-0">
	                                        	<input type="date" class="form-control"name="power_date2" value='<c:out value="${pageMaker.cri.power_date2 }"/>'>
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
                            판매자내역조회
                        </h5>
                	    <div class="card">
                            <div class="card-body">
                                <div class=" mb-3">총 <span class="mx-1 text-danger">${total }</span>건</div>
		                     <table class="table table-bordered thead-light text-center table-hover">		                        
		                         <thead class="table-active">
		                         	<tr>
		                         	    <th>코드</th>
		                         		<th>아이디</th>
		                         		<th>2차카테고리</th>        		
		                         		<th>결제일자</th>
		                         		
		                         	</tr>
		                         </thead>
		                         <tbody>
		                          <c:if test="${!empty sellerPayment  }">
		                           <c:forEach var="payment" items="${sellerPayment   }">
		                   
		                             <tr class="paymentList" onclick="javascript:clickTrRow(this);">
		                                <td>${payment.power_code }</td>
		                                <td>${payment.s_email }</td>
		                                <td>${payment.sub_name }</td>
		                                <td>${fn:substring(payment.power_date,0,11) }</td>
		                                
		                             </tr>
		                           </c:forEach>
		                          </c:if>
                                  <c:if test="${empty sellerPayment }">
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
				                    
				                    <form id="actionForm" action="manage_sellerPayment.do" method="get">
										 <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
										 <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
										 <input type="hidden" name="s_email" value="${pageMaker.cri.s_email }">
										 <input type="hidden" name="s_author" value="${pageMaker.cri.s_author }">
										 <input type="hidden" name="ser_title" value="${pageMaker.cri.ser_title }">
										 <input type="hidden" name="ser_cate" value="${pageMaker.cri.ser_cate }">
										 <input type="hidden" name="ser_sub_cate" value="${pageMaker.cri.ser_sub_cate }">
										 <input type="hidden" name="power_date" value="${pageMaker.cri.power_date }">
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
                                            <td><input class="form-control custom-shadow " id="power_code" name="" value="" type="text" readonly ></td>
                                            <th class="table-primary align-middle">결제금액</th>
                                            <td><input class="form-control custom-shadow " id="power_price" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                        	<th class="table-primary align-middle">결제일자</th>
                                            <td colspan="3"><input class="form-control custom-shadow " id="power_date" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">파워유효기간</th>
                                            <td colspan="3">
                                            	<div class="d-flex align-items-center">
	                                        		<div class="col-5 p-0">
		                                        		<input class="form-control custom-shadow " id="power_start" name="" value="" type="text" readonly>
		                                        	</div>
		                                        	<span class="mx-4"><i class="fas fa-minus"></i></span>
		                                        	<div class="col-5 p-0">
		                                        		<input class="form-control custom-shadow " id="power_end" name="" value="" type="text" readonly>
		                                        	</div>
	                                        	</div>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">판매자아이디</th>
                                            <td ><input class="form-control custom-shadow" id="s_email" name="" value="" type="text" readonly></td>
                                            <th class="table-primary align-middle">판매자이름</th>
                                            <td><input class="form-control custom-shadow" id="s_name" name="" value="" type="text" readonly></td>
                                        </tr>
                                         <tr>
                                            <th class="table-primary align-middle">판매자닉네임</th>
                                            <td ><input class="form-control custom-shadow" id="s_nickname" name="" value="" type="text" readonly></td>
                                            <th class="table-primary align-middle">판매자구분</th>
                                            <td><input class="form-control custom-shadow" id="s_author" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">서비스코드</th>
                                            <td><input class="form-control custom-shadow" id="ser_code" name="" value="" type="text" readonly></td>
                                            <th class="table-primary align-middle">서비스상태</th>
                                            <td colspan="3"><input class="form-control custom-shadow" id="ser_status" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                        	<th class="table-primary align-middle">카테고리</th>
                                            <td colspan="3">
                                            	<div class="d-flex">
                                            	<div class="col-5 p-0">
                                            		<input class="form-control custom-shadow " id="cat_name" name="" value="" type="text" readonly>
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
                                            <th class="table-primary align-middle">서비스기간</th>
                                            <td colspan="3">
	                                        	<div class="d-flex align-items-center">
	                                        		<div class="col-5 p-0">
		                                        		<input class="form-control custom-shadow " id="ser_start" name="" value="" type="text" readonly>
		                                        	</div>
		                                        	<span class="mx-4"><i class="fas fa-minus"></i></span>
		                                        	<div class="col-5 p-0">
		                                        		<input class="form-control custom-shadow " id="ser_end" name="" value="" type="text" readonly>
		                                        	</div>
	                                        	</div>
                                        	</td>
                                            
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
let startDate =$("input[name='power_date']");
let endDate =$("input[name='power_date2']");
const handlePower_date =()=>{
	$(endDate).val($(startDate).val())
	$(endDate).attr("min",$(startDate).val())
}

$("input[name='power_date']").on("change",handlePower_date);


//검색버튼
const searchReport=()=>{

		searchForm.action="manage_sellerPayment.do";
		searchForm.submit();
}
$("#searchBtn").on("click",searchReport);


//초기화
const hadleResetLists =()=>{
	$(startDate).val("")
	$(endDate).val("")
	$("input[name='s_email']").val('')
	$("input[name='ser_title']").val('')
	$("input[name='power_date']").val('')
	$("input[name='ser_team']").val('')
	$("input[name='s_author']").prop("checked",false);
	$("select[name='ser_cate']").val('').prop("selected",true);
	searchForm.action="manage_sellerPayment.do";
	searchForm.submit();
}
$("#resetBtn").on("click",hadleResetLists);
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
		url:"ajaxDetailSellerPayment.do",
		type:"post",
		data:{"power_code":code}
	}).done(function(result){
		console.log(result)
		$("#power_code").val(result.power_code)
		$("#power_price").val(result.power_price)
		$("#power_date").val(result.power_date)
		$("#power_start").val(result.power_start)
		$("#power_end").val(result.power_end)
		$("#s_email").val(result.s_email)
		$("#s_name").val(result.s_name)
		$("#s_nickname").val(result.s_nickname)
		$("#s_author").val(result.s_author)
		$("#ser_code").val(result.ser_code)
		let ser_status=result.ser_status
		ser_status=="N"?$("#ser_status").val("종료"):$("#ser_status").val("진행")
	    $("#cat_name").val(result.cat_name)
	    $("#sub_name").val(result.sub_name)
	    $("#ser_title").val(result.ser_title)
	    let ser_end = result.ser_date
	    ser_end=="상시"?$("#ser_start").val("상시"):$("#ser_end").val(result.ser_end)
	    $("#ser_start").val(result.ser_start)
	})
}

const paymentList = document.querySelectorAll(".paymentList")

Array.from(paymentList).forEach(function (element) {
    $(element).off("click").on('click', selectPayment);
})
</script>
			


            
              
             
            
                
               
          