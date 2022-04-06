<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>               
            
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="mb-5 ">
                            <h6><i  class=" far fa-star mr-1"></i>서비스관리 <i class="fas fa-chevron-right mx-2"></i>일반서비스 관리</h6>
                        </div>
                        <ul class="list-style-none d-flex">
                            <li class="mr-1">총 서비스 <span class="text-danger mx-1">${total }</span>개</li>
                            <div class="mx-3 bg-light position-relative" style="height: 20px; width: 3px; top:3px"></div>
                            <li class="mx-2">오늘 등록된 서비스 <span class="text-danger mx-1">${today }</span>개</li>
                            
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
                                        <td width="600px"><input class="form-control custom-shadow" id="" name="s_email" type="text"  value='<c:out value="${pageMaker.cri.s_email }"/>'></td>
                                        <th class="align-middle table-primary">서비스명</th>
                                        <td><input class="form-control custom-shadow" id="" name="ser_title" type="text" value='<c:out value="${pageMaker.cri.ser_title }"/>'></td>
                                        
                                    </tr>
                                  
                                    <tr>
                                        
                                        <th class="text-center align-middle table-primary">온/오프</th>
                                        <td>
                                            <div class="d-flex align-items-center position-relative" style="top:5px; left: 10px;">
                                                <div class="custom-control custom-radio mr-3 ">
                                                    <input type="radio" id="onlineRadio" name="ser_line" value="온라인" class="custom-control-input mr-5" <c:out value="${pageMaker.cri.ser_line eq '온라인'? 'checked':'' }"/>>
                                                    <label class="custom-control-label" for="onlineRadio">온라인</label>
                                                </div>
                                                <div class="custom-control custom-radio mr-3 ">
                                                    <input type="radio" id="onlineRadio2" name="ser_line" value="오프라인" class="custom-control-input mr-5" <c:out value="${pageMaker.cri.ser_line eq '오프라인'? 'checked':'' }"/>>
                                                    <label class="custom-control-label" for="onlineRadio2">오프라인</label>
                                                </div>
                                                <div class="custom-control custom-radio mr-3 ">
                                                    <input type="radio" id="onlineRadio3" name="ser_line" value="온/오프라인" class="custom-control-input mr-5" <c:out value="${pageMaker.cri.ser_line eq '온/오프라인'? 'checked':'' }"/>>
                                                    <label class="custom-control-label" for="onlineRadio3">온/오프라인</label>
                                                </div>
                                            </div>
                                        </td>
                                        
                                         <th class="text-center align-middle table-primary">구분</th>
                                        <td>
                                            <div class="d-flex align-items-center position-relative" style="top:5px; left: 10px;">
                                                <div class="custom-control custom-radio mr-3 ">
                                                    <input type="radio" id="customRadio1" name="ser_team" value="개인" class="custom-control-input mr-5" <c:out value="${pageMaker.cri.ser_team eq '개인'? 'checked':'' }"/>> 
                                                    <label class="custom-control-label" for="customRadio1">개인</label>
                                                </div>
                                                <div class="custom-control custom-radio mx-3">
                                                    <input type="radio" id="customRadio2" name="ser_team" value="2인이상 5인미만" class="custom-control-input mr-5" <c:out value="${pageMaker.cri.ser_team eq '2인이상 5인미만'? 'checked':'' }"/>>
                                                    <label class="custom-control-label" for="customRadio2">2인이상 5인미만</label>
                                                </div>
                                                <div class="custom-control custom-radio mx-3">
                                                    <input type="radio" id="customRadio3" name="ser_team" value="5인이상 20미만" class="custom-control-input mr-5" <c:out value="${pageMaker.cri.ser_team eq '5인이상 20미만'? 'checked':'' }"/>>
                                                    <label class="custom-control-label" for="customRadio3">5인이상 20인미만</label>
                                                </div>
                                                <div class="custom-control custom-radio mx-3">
                                                    <input type="radio" id="customRadio4" name="ser_team" value="20인 이상" class="custom-control-input mr-5" <c:out value="${pageMaker.cri.ser_team eq '20인 이상'? 'checked':'' }"/>>
                                                    <label class="custom-control-label" for="customRadio4">20인 이상</label>
                                                </div>
                                                
                                               
                                                
                                            </div>
                                        </td>
                                    </tr>
                             
                                    <tr>
                                    	<th class="align-middle table-primary">1차 카테고리</th>
                                    	<td>
                                    		<select id="searchCategory" name="cat_no" class="custom-select  form-control custom-shadow ">
				                                <option value="" selected>선택</option>
				                                <option value="CAT1" <c:out value="${pageMaker.cri.cat_no eq 'CAT1'? 'selected':'' }"/>>앱</option>
				                                <option value="CAT2" <c:out value="${pageMaker.cri.cat_no eq 'CAT2'? 'selected':'' }"/>>웹</option>
				                                <option value="CAT3" <c:out value="${pageMaker.cri.cat_no eq 'CAT3'? 'selected':'' }"/>>게임</option>
				                                <option value="CAT4" <c:out value="${pageMaker.cri.cat_no eq 'CAT4'? 'selected':'' }"/>>보안</option>
				                                <option value="CAT5" <c:out value="${pageMaker.cri.cat_no eq 'CAT5'? 'selected':'' }"/>>기술지원</option>
				                                <option value="CAT6" <c:out value="${pageMaker.cri.cat_no eq 'CAT6'? 'selected':'' }"/>>기획</option>
				                            </select>
                                    	</td>
                                    	<th class="align-middle table-primary">2차 카테고리</th>
                                    	<td>
                                    		<select id="sub_cate" name="sub_no" class="custom-select  form-control custom-shadow">
				                                
				                            </select>
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
                	<div class="col-6">
                	   <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            판매내역
                           <!--  <div >
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input mx-2" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                    <label class="form-check-label" for="inlineRadio1">리뷰순</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input mx-2" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                    <label class="form-check-label" for="inlineRadio1">평점순</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input mx-2" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                    <label class="form-check-label" for="inlineRadio1">위시순</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input mx-2" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                    <label class="form-check-label" for="inlineRadio1">판매순</label>
                                </div>
                            </div> -->
                        </h5>
                	    <div class="card">
                            <div class="card-body">
                                <div class=" mb-3">총 <span class="mx-1 text-danger">${searchTotal }</span>건</div>
		                     <table class="table table-bordered thead-light text-center table-hover">		                        
		                         <thead class="table-active">
		                         	<tr >
		                         		<th>순번</th>
		                         		<th width="250px">판매자</th>
		                         		<th>서비스명</th>
		                         		<th>상태</th>       		
		                         	</tr>
		                         </thead>
		                         <tbody>
		                           <c:if test="${!empty serviceLists }">
			                          <c:forEach var="service" items="${serviceLists }">
			                             <tr class="serviceList" onclick="javascript:clickTrRow(this);">
			                                <td>${service.ser_code}</td>
			                                <td>${service.s_email }</td>
			                                <c:choose>
			                                	<c:when test="${fn:length(service.ser_title)>11 }">
			                                		<td>${fn:substring(service.ser_title,0,10) }...</td>
			                                	</c:when>
			                                	<c:otherwise>
			                                		<td>${service.ser_title }</td>
			                                	</c:otherwise>
			                                </c:choose>
			                                <c:if test="${empty service.ser_end }">
			                                	<td>진행</td>
			                                </c:if>
			                                <c:if test="${!empty service.ser_end }">
			                                	<td class="text-danger">종료</td>
			                                </c:if>
			                             </tr>
			                          </c:forEach>
			                         </c:if>
			                         <c:if test="${empty serviceLists }">
			                         	<tr>
			                         		<td colspan="4">조회된 데이터가 없습니다.</td>
			                         	</tr>
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
			                    
			                    
			                    <form id="actionForm" action="manage_service.do" method="get">
						            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						            <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						            <input type="hidden" name="s_email" value="${pageMaker.cri.s_email }">
						            <input type="hidden" name="ser_title" value="${pageMaker.cri.ser_title }">
						            <input type="hidden" name="ser_line" value="${pageMaker.cri.ser_line }">
						            <input type="hidden" name="ser_team" value="${pageMaker.cri.ser_team }">
						            <input type="hidden" name="cat_no" value="${pageMaker.cri.cat_no }">
						        </form>
		                   </div>
               			</div>
                	</div>
                	<div class="col-6">
                           <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            상세조회
                        </h5>
                	    <div class="card">
                	    <!-- 유효기간이 남아있을 경우 / 유효기간 종료되면 버튼 안보임 -->
                          <!-- <div class="d-flex justify-content-end mr-4">
                                <button class="btn btn-outline-primary mr-3 mt-3">종료</button>
                            </div> -->
		                   <div class="card-body">
                                <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                        <tr>
                                            <th width="130px" class="table-primary align-middle">서비스코드</th>
                                            <td><input class="form-control custom-shadow " id="ser_code" name="" value="" type="text" readonly ></td>
                                            <th class="table-primary align-middle">구분</th>
                                            <td><input class="form-control custom-shadow " id="ser_author" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">카테고리</th>
                                            <td colspan="3" >
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
                                            <th class="table-primary align-middle">판매자</th>
                                            <td colspan="3"><input class="form-control custom-shadow" id="ser_email" name="" value="" type="text" readonly></td>
                                            
                                        </tr>
                                        
                                        <tr>
                                        	<th class="table-primary align-middle">서비스명</th>
                                            <td colspan="3"><input class="form-control custom-shadow" id="ser_title" name="" value="" type="text" readonly></td>
                                        </tr>
                                        <tr>
                                         <th class="table-primary align-middle">금액</th>
                                            <td colspan="3">
                                              <div class="col-6 p-0 d-flex align-items-center">
                                             	<input class="form-control custom-shadow" id="ser_price" name="" value="" type="text" readonly><span class="ml-2">원</span>
                                           	  </div>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<th class="table-primary align-middle">유효기간</th>
                                            <td colspan="3">
                                             	<input class="form-control custom-shadow" id="ser_date" name="" value="" type="text" readonly>
                                            </td>
                                        </tr>
                                        
                                    </tbody>
                                </table>
                                
                                 <div class="mt-3">
		                     		<i class="fas fa-chevron-circle-right mb-3 mr-2" style="color:#8771ea"></i>프로모션
		                     	</div>
		                     	
                                <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                       
                                        <tr>                                     
                                            <th width="130px" class="table-primary align-middle">상태</th>
                                            <td>
                                              <div class="col-6 p-0 d-flex align-items-center">                                                
                                                <input class="form-control custom-shadow mb-1"  id="pro_status" name="" type="text" readonly> <span class="ml-2"></span>               
                                              </div>
                                            </td>
                                            <th width="90px" class="table-primary align-middle">할인율</th>
                                            <td > 
                                              <div class="col-5 p-0 d-flex align-items-center">                                             
                                                <input class="form-control custom-shadow mb-1 mr-2"  id="prodiscount" name="" type="text" readonly> <span>%</span>                
                                              </div>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<th class="table-primary align-middle">할인가격</th>
                                            <td colspan="3"> 
                                              <div class="col-7 p-0 d-flex align-items-center">                                             
                                                <input class="form-control custom-shadow mb-1 mr-2"  id="ser_sale_com" name="" type="text" readonly> <span>원</span>                
                                              </div>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<th class="table-primary align-middle">유효기간</th>
                                            <td colspan="3">
                                            	<div class="d-flex align-items-center">
	                                        		<div class="col-5 p-0">
		                                        		<input class="form-control custom-shadow " id="pro_start" name="" value="" type="text" readonly>
		                                        	</div>
		                                        	<span class="mx-4"><i class="fas fa-minus"></i></span>
		                                        	<div class="col-5 p-0">
		                                        		<input class="form-control custom-shadow " id="pro_end" name="" value="" type="text" readonly>
		                                        	</div>
	                                        	</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                
                                
                                <div class="">
		                     		<i class="fas fa-chevron-circle-right mb-3 mr-2" style="color:#8771ea"></i>추가정보
		                     	</div>
		                     	
                                <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                       
                                        <tr>                                     
                                            <th class="table-primary align-middle">누적판매</th>
                                            <td>
                                              <div class="col-5 p-0 d-flex align-items-center">                                                
                                                <input class="form-control custom-shadow mb-1"  id="totalPay" name="" type="text" readonly> <span class="ml-2">원</span>               
                                              </div>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<th class="table-primary align-middle">리뷰수</th>
                                            <td > 
                                              <div class="col-5 p-0 d-flex align-items-center">                                             
                                                <input class="form-control custom-shadow mb-1 mr-2"  id="totalReview" name="" type="text" readonly> <span>개</span>                
                                              </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
		
			                     
		                   </div>
               			</div>
                	</div>
                </div>
			
			<div class="row">
				<div class="col-12">
				<h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            상세설명
                 </h5>
					<div class="card">
		               <div class="card-body">
		                  <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                        <tr>                                     
                                            <th class="table-primary align-middle">기술수준</th>
                                            <td>                                              
                                                <input class="form-control custom-shadow mb-1"  id="ser_skill" name="" type="text" readonly>                 
                                            </td>
                                        	<th class="table-primary align-middle">팀규모</th>
                                            <td > 
                                                <input class="form-control custom-shadow mb-1 mr-2"  id="ser_team" name="" type="text" readonly>                
                                              
                                            </td>
                                            <th class="table-primary align-middle">방식</th>
                                            <td > 
                                                <input class="form-control custom-shadow mb-1 mr-2"  id="ser_line" name="" type="text" readonly>                
                                              
                                            </td>
                                        </tr>
                                        <tr>
                                        </tr>
                                        <tr>                                     
                                            <th  class="table-primary align-middle">개발언어</th>
                                             <td colspan="5">
                                                <input class="form-control custom-shadow mb-1 mr-2"  id="ser_lang" name="" type="text" readonly>           
                                        	</td>
                                        </tr>
                                        <tr>                                     
                                            <th  class="table-primary align-middle">프레임워크</th>
                                             <td colspan="5">
                                                <input class="form-control custom-shadow mb-1 mr-2"  id="ser_frame" name="" type="text" readonly>                
                                        	</td>
                                        </tr>
                                        <tr>                                     
                                            <th  class="table-primary align-middle">DBMS</th>
                                             <td colspan="5">
                                                <input class="form-control custom-shadow mb-1 mr-2"  id="ser_dbms" name="" type="text" readonly>               
                                        	</td>
                                        </tr>
                                    </tbody>
                                </table>
                                
                             <div class="mt-5">
		                        <i class="fas fa-chevron-circle-right mb-3 mr-2" style="color:#8771ea"></i>서비스제공절차
		                     </div>
                             <textarea rows="8" class="form-control" id="ser_offer" readonly></textarea>
                             <div class="mt-5">
		                        <i class="fas fa-chevron-circle-right mb-3 mr-2" style="color:#8771ea"></i>서비스설명
		                     </div>
                             <textarea rows="8" class="form-control" id="ser_sub" readonly></textarea>      
		                </div>
                	</div>
                </div>
			</div>
         </div>
                        
<script type="text/javascript">
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

const selectService=()=>{
	const code = event.target.parentNode.firstChild.nextSibling.innerText;
	
	$.ajax({
		url:"ajaxSelectService.do",
		type:"post",
		data:{"ser_code":code}
	}).done(function(result){
		console.log(result)
		$("#ser_code").val(result.serviceInfo.ser_code);
		let cat_name=result.serviceInfo.cat_name;//1차카테고리
		let sub_name=result.serviceInfo.sub_name;//2차카테고리
		console.log(sub_name)
		$("#ser_cate").val(cat_name);
		$("#sub_name").val(sub_name);
		$("#ser_email").val(result.serviceInfo.s_email);
		$("#ser_title").val(result.serviceInfo.ser_title);
		$("#ser_price").val(result.serviceInfo.ser_price);
		let end_date=result.serviceInfo.ser_end;
		let end;
		end_date!=null?end=end_date:end="상시진행"
		$("#ser_date").val(result.serviceInfo.ser_start +" ~ "+end);
		
		//구분
		let author= result.serviceInfo.ser_team
		author=="개인"?$("#ser_author").val("개인"):$("#ser_author").val("기업")
		
		$("#ser_skill").val(result.serviceInfo.ser_skill); 
		$("#ser_team").val(result.serviceInfo.ser_team); 
		$("#ser_line").val(result.serviceInfo.ser_line); 
		$("#ser_lang").val(result.serviceInfo.ser_lang); 
		$("#ser_frame").val(result.serviceInfo.ser_frame); 
		$("#ser_dbms").val(result.serviceInfo.ser_dbms); 
		$("#ser_offer").val(result.serviceInfo.ser_offer); 
		$("#ser_sub").val(result.serviceInfo.ser_sub); 
		
		let totalPay = result.totalPay;
		if (totalPay!=null){
			$("#totalPay").val(result.totalPay)
		}else{
			$("#totalPay").val('0')
		}
		$("#totalReview").val(result.totalReview);
		
	    let status = result.promotion.pro_status;
	    status=="N"? $("#pro_status").val("진행 중") :
	    		status=="Y"?$("#pro_status").val("종료"):$("#pro_status").val("없음")
	    			 
	    
	    let discount = result.promotion.prodiscount;
	    discount!=null?$("#prodiscount").val(discount):$("#prodiscount").val("없음");
	    
	    let sale = result.promotion.ser_sale_com;
	    sale!=null?$("#ser_sale_com").val(sale):$("#ser_sale_com").val("없음");
	    
	    let proStart = result.promotion.pro_start;
	    proStart!=null?$("#pro_start").val(proStart):$("#pro_start").val("없음");
	    
	    let proEnd = result.promotion.pro_end;
	    proEnd!=null?$("#pro_end ").val(proEnd):$("#pro_end").val("없음");
		
		
		
	})
}
const serviceList = document.querySelectorAll(".serviceList");
//서비스 select
    Array.from(serviceList).forEach(function (element) {
        $(element).off("click").on('click', selectService);
    })

//초기화 버튼
const hadleResetLists =()=>{

	$("input[name='s_email']").val('')
	$("input[name='ser_title']").val('');
	$("input[name='ser_team']").val('');
	$("input[name='ser_line']").val('');
	
	$("select[name='cat_no']").val('').prop("selected",true);
	searchForm.action="manage_service.do";
	searchForm.submit();
}
$("#resetBtn").on("click",hadleResetLists);
    
//검색버튼
const searchReport=()=>{
	
//	if(type!="choice"||reporterId!=""||startDate!=""){
		searchForm.action="manage_service.do";
		searchForm.submit();
//	}else{
//		alert("검색어를 입력해주세요.")
//	}
	
	
}
$("#searchBtn").on("click",searchReport);
</script>                        
                        
                    
                	  
              
             
            
                
               
          