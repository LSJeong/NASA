<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="mb-3 ">
                            <h6><i  class=" icon-phone mr-1"></i>자주묻는질문관리 <i class="fas fa-chevron-right mx-2"></i>자주묻는질문 조회</h6>
                        </div>
                    </div>
                </div>
            </div>
	<div class="container-fluid">
            
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                    <h5 class="p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                           자주묻는질문 검색
                     </h5>
                    <div class="card mb-5">
                        <div class="card-body">
                            <table class="table caption-top table-bordered  text-center">
                                <tbody>
                                	<tr>
                                		<th class="align-middle table-primary">말머리</th>
                                        <td>
                                        	<div class="col-6">
                                        	<select class="custom-select  form-control custom-shadow " id="bigCategory">
				                                <option selected="">선택</option>
				                                <option value="1">July 19</option>
				                                <option value="2">Jun 19</option>
				                            </select>
				                            </div>
                                        </td>
                                	</tr>
                                   
                                    <tr>
                                        <th class="align-middle table-primary">제목</th>
                                        <td>
                                        	<div class="col-6">
                                        		<input class="form-control custom-shadow" id="" name="" type="text"></td>
                                    		</div>
                                    </tr>
                              
                                </tbody>
                            </table>
                        <style>
                            .search, .reload{
                                position: relative;
                                top:2px;
                            }
                        </style>

	                     <div class="d-flex justify-content-end my-4">
                            <button class="btn btn-outline-warning mr-3">초기화<i class="ml-2 icon-reload reload"></i></button>
	                        <button class="btn btn-outline-dark">검색<i class="ml-2 icon-magnifier search"></i></button>
	                    </div>
                   </div>
               </div>
               
               
               
       
                                    
                                    	
                                    
                            
                            
                   <div class="row my-5">
                	<div class="col-5">
                	   <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            자주묻는질문 목록
                        </h5>
                	    <div class="card">
                            <div class="card-body">
                                <div class=" mb-3">총 <span class="mx-1 text-danger">50</span>건</div>
		                     <table class="table table-bordered thead-light text-center table-hover">		                        
		                         <thead class="table-active">
		                         	<tr>
		                         		<th width="15%">선택</th>
		                         		<th width="120px">말머리</th>
		                         		<th>제목</th>       		
		                         		
		                         	</tr>
		                         </thead>
		                         <tbody>
		                             <tr>
		                                <td>
			                               <div class="custom-control custom-checkbox">
			                                    <input type="checkbox" class="custom-control-input" id="customCheck1" style="left:100px;">
			                                    <label class="custom-control-label" for="customCheck1"></label>
			                                </div>
		                                </td>
		                                <td>2222</td>
		                                <td>개인</td>
		                                
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td>기업</td>
		                                
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                               
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                               
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                               
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                
		                             </tr>
		                        </tbody>
		                     </table>
		
			                     <div class="d-flex justify-content-center mt-5">
			                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <li class="page-item">
                                                    <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                                                        <span aria-hidden="true">«</span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="javascript:void(0)">1</a></li>
                                                <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="javascript:void(0)" aria-label="Next">
                                                        <span aria-hidden="true">»</span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
			                    </div>
		                   </div>
               			</div>
                	</div>
                	<div class="col-7">
                           <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            상세조회
                        </h5>
                	    <div class="card">
                           <div class="d-flex justify-content-end mr-4">
                                <button id="modifyBtn" class="btn btn-outline-primary mt-3">수정</button>
                                 <button class="btn btn-outline-secondary ml-2 mt-3">삭제</button>
                            </div>
		                   <div class="card-body">
                                <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                        <tr>
                                            <th class="table-primary align-middle">공지코드</th>
                                            <td><input class="form-control custom-shadow " id="" name="" value="123" type="text" ></td>
                                            
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">제목</th>
                                            <td><input class="form-control custom-shadow" id="" name="" value="123" type="text" ></td>
                                            
                                        </tr>
                                        <tr>
                                            <th class="table-primary align-middle">등록날짜</th>
                                            <td><input class="form-control custom-shadow" id="" name="" value="1234-1234" type="text" readonly></td>
                                           
                                        </tr>
                                        
                                        <tr>                                     
                                            <th colspan="4" class="table-primary align-middle">공지내용</th>
                                            
                                        </tr>
                                        <tr>
                                        	<td colspan="4">                                              
                                                <textarea rows="20" class="form-control" id="message-text" readonly></textarea>
                                               
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

	
	const modifyBtn = document.querySelector("#modifyBtn");
	const goToTheModifyNotice=()=>{
		if(confirm("수정하시겠습니까?"))
		location.href="ModifyFaqForm.do"; //get방식 ?변수명= &
	}
	modifyBtn.addEventListener("click",goToTheModifyNotice);

</script>