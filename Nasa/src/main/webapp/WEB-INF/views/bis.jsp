<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body>
	<section class="contact-section">
	    <div class="container">
	        <div class="row d-flex justify-content-center align-items-center">
	            <div>
                    <div class="section-tittle text-center mb-80">
                        <h1>기업 판매자<br> 사업자등록번호를 인증해주세요.</h1>
                    </div>
	            	<form class="form-contact contact_form" action="#" method="post" id="contactForm" novalidate="novalidate">
	                    <div class="row d-flex justify-content-center align-items-center">
	                        <div class="col-sm-8">                                    
	                            <div class="form-group">
	                                대표자성명<input id="bname" class="form-control valid" type="text" placeholder="대표자 성명을 입력해주세요.">
	                            </div>
	                        </div>	   
	                         <div class="col-sm-8">                                    
	                            <div class="form-group">
	                                개업일자<input id="bdate"class="form-control valid" type="text" placeholder="개업일자를 입력해주세요.">
	                            </div>
	                        </div>	                    
	                        <div class="col-sm-8">
	                            <div class="form-group">
	                                사업자등록번호<div class="d-flex">
	                                    <input id="bnumber" class="form-control valid" type="number" placeholder="숫자만 입력">                                            
	                                    </div>
	                                    <br>
	                                    <br>
	                                    <br>
	                                    
	                                    <button type="button"  class="genric-btn primary radius" style="float: left;" onclick="testbt()">확인</button>
	                            </div>
	                            
	                            
	                            
	                        </div>	                        	                        
	                    </div>                            
	                </form>
	                <br>
	                <br>
	                <div class="form-group mt-3 d-flex justify-content-center align-items-center">
	                	<div>
	                		<button type="button" class="genric-btn primary-border e-large">이전</button>&nbsp;&nbsp;&nbsp;
                            <button type="button" class="genric-btn primary e-large">다음</button>
                        </div>	                    
	                </div>
	                <br>
	                <br>
	                <div class="form-group mt-3 d-flex justify-content-center align-items-center">
	                	<a href="#" style="color: #1f2b7b;">개인 판매자로 가입하시나요?</a>
	                </div>
	            </div>                   
	        </div>
	    </div>
	</section>
	
	<script type="text/javascript">
		function testbt() {
			
	
	var data = {
			  "businesses": [
				    {
				    	 "b_no":document.querySelector("#bnumber").value,// 사업자번호 "xxxxxxx" 로 조회 시,
				    	 "start_dt":document.querySelector("#bdate").value,
				    	 "p_nm": document.querySelector("#bname").value
				   
				      
				    }
				  ]
		   }; 

	$.ajax({
		  url: "http://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=NFwkbzbbf2uEp1cOHXKWMIFV54Jy8gdGhbkTPMWP7BoQh715sxmepPFKRpsi70HzZ9BHOLvd23f%2BRzj781IjDw%3D%3D&returnType=JSON",  // serviceKey 값을 xxxxxx에 입력
		  type: "POST",
		  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
		  dataType: "JSON",
		  contentType: "application/json",
		  accept: "application/json",
		  success: function(result) {
			  console.log(result);
		      	console.log(result.data[0].valid_msg);
		      	
		      	let datas = result.data[0].valid_msg;
		      	
		      	if(datas ==='확인할 수 없습니다.'){
		      		alert('사용할 수 없습니다.')
		      	}
		      	
		  },
		  error: function(result) {
		      console.log(result.responseText); //responseText의 에러메세지 확인
		  }
		});
		}
	</script>
	
</body>
</html>