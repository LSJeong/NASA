<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<!-- include summernote css/js -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
    
     <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                        <div class="mb-3 ">
                            <h6><i  class="icon-pin mr-1"></i>공지사항관리 <i class="fas fa-chevron-right mx-2"></i>전체 공지사항 조회<i class="fas fa-chevron-right mx-2"></i>공지사항 등록</h6>
                        </div>
                    </div>
                </div>
            </div>
	<div class="container-fluid">
            	
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                    <h5 class="p-3 text-white bg-dark d-flex justify-content-between" style="border-radius: 5px;">
                           공지사항 등록
                     </h5>
                    <div class="card mb-5">
                        <div class="card-body">
                            <form id="frm" method="post" action="summernote.do">
                            <table class="table caption-top table-bordered ">
                                <tbody>
                                   
                                    <tr id="titleTr">
                                        <th  class="align-middle table-primary text-center">제목</th>
                                        <td>
                                        	
                                        <input class="form-control custom-shadow" id="title" name="" type="text">
                                        </td>
                                    		
                                    </tr>
                                    <tr>
                                        
                                        <td colspan="2">
											<textarea id="summernote" name=summernote></textarea>
												      
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
                            <button id="insertBtn" class="btn btn-outline-primary mr-3">등록</button>
	                        <button class="btn btn-outline-secondary" onclick="window.history.back() ">취소</button>
	                    </div>
                   </div>
               </div>
               
               
<script src="resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="resources/summernote/summernote-lite.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>         
 <script>
    $('#summernote').summernote({
		height: 600,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		callbacks : { 
	         onImageUpload : function(files, editor, welEditable) {
	               // 파일 업로드(다중업로드를 위해 반복문 사용)
	               for (var i = files.length - 1; i >= 0; i--) {
	                  uploadSummernoteImageFile(files[i], this);
	               }
	         }
	      },
	     toolbar: [
	          // 글꼴 설정
	          ['fontname', ['fontname']],
	          // 글자 크기 설정
	          ['fontsize', ['fontsize']],
	          // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	          // 글자색
	          ['color', ['forecolor','color']],
	          // 표만들기
	          ['table', ['table']],
	          // 글머리 기호, 번호매기기, 문단정렬
	          ['para', ['ul', 'ol', 'paragraph']],
	          // 줄간격
	          ['height', ['height']],
	          // 그림첨부, 링크만들기, 동영상첨부
	          ['insert',['picture','link','video']],
	          // 코드보기, 확대해서보기, 도움말
	          ['view', ['codeview','fullscreen', 'help']]
	        ],
	        // 추가한 글꼴
	      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	       // 추가한 폰트사이즈
	      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	   });


/**
* 이미지 파일 업로드
*/
// 이미지 파일 DB에 넣을 수 있게 경로로 변환.
function uploadSummernoteImageFile(file, el) {
 data = new FormData();
 data.append("file", file);
 $.ajax({
    data : data,
    type : "POST",
    url : "uploadSummernoteImageFile.do",
    contentType : false,
    enctype : 'multipart/form-data',
    processData : false,
    success : function(data) {
       $(el).summernote('editor.insertImage', data.url);
    }
 });
}

const insertBtn= document.querySelector("#insertBtn");
const handleInsertForm =()=>{
	if($("#title").val()==""){
		$("#title").focus();
		$("#title").addClass("is-invalid");
		const oldVal=$("#title").val()
		$("#title").on("propertychange change keyup paste input", function(){
			$("#title").removeClass("is-invalid");
		});
		return;
	}else{
		frm.submit();
	}
}

insertBtn.addEventListener("click",handleInsertForm);
</script>      
                                    
                                    	
                                    
                            
                            
                  
                

             </div>