<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            
            
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="mb-3 ">
                            <h6><i  class="fas fa-gift mr-1"></i>프로모션관리 <i class="fas fa-chevron-right mx-2"></i>전체프로모션조회</h6>
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
            	<div class="mb-5">
            	새로운 프로모션을 등록하시겠습니까?
           		 </div>
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                    <h5 class="p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                           프로모션검색
                     </h5>
                    <div class="card mb-4">
                        <div class="card-body">
                            <table class="table caption-top table-bordered  text-center">
                                <tbody>
                                    <tr>
                                        <th class="align-middle table-primary">1차 카테고리</th>
                                        <td>
                                        	<div class="col-6">
                                        	<select class="custom-select  form-control custom-shadow ">
				                                <option selected="">선택</option>
				                                <option value="1">July 19</option>
				                                <option value="2">Jun 19</option>
				                            </select>
				                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="align-middle table-primary">2차 카테고리</th>
                                        <td>
                                        	<div class="col-6">
                                        	<select class="custom-select  form-control custom-shadow" disabled>
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
                                    <tr>
                                        <th class="align-middle table-primary">등록일자</th>
                                        <td>
                                        	<div class="d-flex align-items-center">
                                        		<div class="col-3">
	                                        	<input type="date" class="form-control" value="2018-05-13">
	                                        	</div>
	                                        	<span class="mx-2"><i class="fas fa-minus"></i></span>
	                                        	<div class="col-3">
	                                        	<input type="date" class="form-control" value="2018-05-13">
	                                        	</div>
                                        	</div>
                                        </td>
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
	                        <button class="btn btn-outline-secondary">검색<i class="ml-2 icon-magnifier search"></i></button>
	                    </div>
                   </div>
               </div>
               
               
               
                              <div class="row my-5">
                	<div class="col-6">
                	   <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            프로모션 조회
                        </h5>
                	    <div class="card">
                            <div class="card-body">
                            	
                            	<ul class="nav nav-tabs mb-3">
                                    <li class="nav-item">
                                        <a href="manage_promotion.do"  class="nav-link ">
                                            <i class="mdi mdi-home-variant d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block">전체프로모션</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="run_promotion.do"  class="nav-link">
                                            <i class="mdi mdi-account-circle d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block">진행중프로모션</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="promotion_complete.do" class="nav-link active">
                                            <i class="mdi mdi-settings-outline d-lg-none d-block mr-1"></i>
                                            <span class="d-none d-lg-block">종료프로모션</span>
                                        </a>
                                    </li>
                                  
                                    
                                    <li style="margin-left:200px;">
                                        <button class="btn btn-outline-danger" data-toggle="modal" data-target="#register-promotion-modal">등록하기</button>
                                        
                                    </li>
                                    
                                </ul>
                                    
                                    	
                                    
                            
                            
                              <div class=" my-4">총 <span class="mx-1 text-danger">50</span>건</div>
		                     <table class="table table-bordered thead-light text-center table-hover">		                        
		                         <thead class="table-active">
		                         	<tr>
		                         		<th>프로모션코드</th>
		                         		<th>1차카테고리</th>
		                         		<th>2차카테고리</th>       		
		                         		<th>구분</th>
		                         		<th>제목</th>
		                         	</tr>
		                         </thead>
		                         <tbody>
		                             <tr>
		                                <td>2222</td>
		                                <td>2222</td>
		                                <td>sssss</td>
		                                <td class="text-primary">진행</td>
		                                <td>자바 10% 할인</td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td>기업</td>
		                                <td>종료</td>
		                                <td></td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td ></td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                             </tr>
                                     <tr>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                                <td></td>
		                             </tr>
		                        </tbody>
		                     </table>
		
			                     <div class="d-flex justify-content-center mt-5">
			                        <div class="dataTables_paginate paging_simple_numbers" id="zero_config_paginate"><ul class="pagination"><li class="paginate_button page-item previous" id="zero_config_previous"><a href="#" aria-controls="zero_config" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item "><a href="#" aria-controls="zero_config" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="zero_config" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="zero_config" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item next" id="zero_config_next"><a href="#" aria-controls="zero_config" data-dt-idx="4" tabindex="0" class="page-link">Next</a></li></ul></div>
			                    </div>
		                   </div>
               			</div>
                	</div>
                	<div class="col-6">
                           <h5 class="mt-3 p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                            프로모션 상세조회
                        </h5>
                	    <div class="card">
                         
		                   <div class="card-body">
                                <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">프로모션코드</th>
                                            <td ><input class="form-control custom-shadow " id="" name="" value="1234444" type="text" disabled ></td>
                                            <th width="18%" class="table-primary align-middle">할인율</th>
                                            <td>                                               
                                            	<div class="col-6 p-0 d-flex align-items-center">
                                            		<input class="form-control custom-shadow mr-2 text-danger" id="" name="" value="10" type="text" disabled >%
                                        	   </div>
                                        	</td>
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">카테고리</th>
                                            <td colspan="3" ><input class="form-control custom-shadow " id="" name="" value="1234444" type="text" disabled ></td>
                                            
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">제목</th>
                                            <td colspan="3"><input class="form-control custom-shadow " id="" name="" value="1234444" type="text" disabled ></td>
                                            
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">할인율</th>
                                            <td>                                               
                                            	<div class="col-6 p-0 d-flex align-items-center">
                                            		<input class="form-control custom-shadow mr-2 text-danger" id="" name="" value="10" type="text" disabled >%
                                        	   </div>
                                        	</td>
                                            <th class="table-primary align-middle">누적판매율</th>
                                            <td><input class="form-control custom-shadow " id="" name="" value="1234444" type="text" disabled ></td>
                                        </tr>
                                         
                                    </tbody>
                                </table>
		
			                     
		                   </div>
               			</div>
                	</div>
                </div>
                
                
                <!-- 반려모달 -->
                
                
                <div id="register-promotion-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="dark-header-modalLabel" style="display: none;" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header modal-colored-header bg-primary">
                                                <h4 class="modal-title" id="dark-header-modalLabel">프로모션 등록하기</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            </div>
                                            <div class="modal-body">
                                                <table class="table caption-top table-bordered thead-light  text-center">		                        
                                    <tbody>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">1차 카테고리</th>
                                            <td >
                                            	<select class="custom-select  form-control custom-shadow">
				                                <option selected="">선택</option>
				                                <option value="1">July 19</option>
				                                <option value="2">Jun 19</option>
				                            </select>
                                            </td>
                                         
                                        </tr>
                                        <tr>
                                        	<th width="18%" class="table-primary align-middle">2차 카테고리</th>
                                            <td>
                                            	<select class="custom-select  form-control custom-shadow">
				                                <option selected="">선택</option>
				                                <option value="1">July 19</option>
				                                <option value="2">Jun 19</option>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="18%" class="table-primary align-middle">제목</th>
                                            <td colspan="3"><input class="form-control custom-shadow " id="" name="" value="1234444" type="text" disabled ></td>
                                            
                                        </tr>
                                        <tr>
                                           
                                            <th width="18%" class="table-primary align-middle">할인율</th>
                                            <td colspan="3">
                                               <div class="col-3 p-0 d-flex align-items-center">
                                            	<input class="form-control custom-shadow mr-3 " id="" name="" value="10" type="text" disabled >%
                                        	   </div>
                                        	</td>
                                        </tr>
                                         <tr>
                                            <th  class="table-primary align-middle">유효기간</th>
                                            <td colspan="3">
                                            	<div class="d-flex align-items-center">
                                        		<div class="col-5 p-0">
	                                        	<input type="date" class="form-control" value="2018-05-13">
	                                        	</div>
	                                        	<span class="mx-2"><i class="fas fa-minus"></i></span>
	                                        	<div class="col-5 p-0">
	                                        	<input type="date" class="form-control" value="2018-05-13">
	                                        	</div>
                                        	</div>
                                            </td>
                                        </tr>
                                        
                                        
                                    </tbody>
                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary">저장</button>
                                                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal-dialog -->
                                </div>
                
                
              
             
             
             
             
             
             
             </div>
		
			


            
              
             
            
                
               
          