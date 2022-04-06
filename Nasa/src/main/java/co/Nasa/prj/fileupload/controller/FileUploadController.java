package co.Nasa.prj.fileupload.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import co.Nasa.prj.comm.VO.NoticeVO;
import co.Nasa.prj.notice.service.NoticeService;


@Controller
public class FileUploadController {
	
	@Autowired
	NoticeService NoticeDao;
	
	
	@Value("#{upload['editorfile']}")
	private String upload;
	
	 //이미지 보여주기 밑 이미지 업로드 아작스.
	   @RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	   @ResponseBody
	   public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
	      JsonObject jsonObject = new JsonObject();
	      //일반 파일 물리 경로
	        //String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
	        
	      //경로 할 때 마다 계속 바꿔줘야함 아니면 절대 에디터 이미지 업로드 안됨.
	        //Eclipse 파일 물리 경로 방식 (이클립스 내부에 저장)
	      //String SAVE_PATH = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\editor\\";
	      String SAVE_PATH = upload;

	      // 내부경로로 저장
	      String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
	      System.out.println("컨택트" + contextRoot);
	      String fileRoot = contextRoot+"resources/fileupload/";
	      System.out.println("파일루트" + fileRoot);
	      String originalFileName = multipartFile.getOriginalFilename();   //오리지날 파일명
	      System.out.println("파일이름" +originalFileName);
	      
	      String extension = originalFileName.substring(originalFileName.lastIndexOf("."));   //파일 확장자
	      System.out.println("확장자" +extension);
	      String savedFileName = UUID.randomUUID() + extension;   //저장될 파일 명
	      System.out.println("UUID" +savedFileName);
	      System.out.println("저장경로" +savedFileName);
	      
	      File targetFile = new File(fileRoot + savedFileName);
	      File mtargetFile = new File(SAVE_PATH + savedFileName);
	      try {
	         InputStream fileStream = multipartFile.getInputStream();
	         FileUtils.copyInputStreamToFile(fileStream, targetFile);   //파일 저장
	         multipartFile.transferTo(mtargetFile); //다운로드 컨트롤러 만들고 뒤에 파일명 넣어주면 해당경로 파일을 다운로드해준다.
	         jsonObject.addProperty("url", request.getContextPath() + "/resources/fileupload/"+savedFileName); 
	         // contextroot + resources + 저장할 내부 폴더명
	         jsonObject.addProperty("responseCode", "success");
	            
	      } catch (IOException e) {
	         FileUtils.deleteQuietly(targetFile);   //저장된 파일 삭제
	         jsonObject.addProperty("responseCode", "error");
	         e.printStackTrace();
	      }
	      String a = jsonObject.toString();
	      System.out.println(a);
	      return a;
	   }
	      @RequestMapping("/summernote.do")
	      public String summernote(Model model, NoticeVO vo, HttpServletRequest req,HttpServletResponse response) throws IOException{
	         response.setContentType("text/html; charset=EUC-KR");
	         PrintWriter out = response.getWriter();
	         
	         if(vo == null) {
	            out.println("<script>alert('값 넘기기 실패'); </script>");
	            out.flush();
	            return "homess";
	         }
	         out.println("<script>alert('값 넘기기 성공'); </script>");
	         out.flush();
	         
	         //서머노트 코드 원본
	         String s = req.getParameter("summernote");
	         System.out.println("s라고 저장됨 " +s);
	         System.out.println("파일자르는 이름 " +s.indexOf("src=")); //13번째에서 잘라야함.
	         if (s.indexOf("src=")==8){         
	         //이미지 파일일 경우 코드 잘라서 쓰기.
	         String d =  s.substring(0,13) + "editor/" + s.substring(39);
	         System.out.println("d라고 저장됨 " +d);
	         vo.setNo_subject(d);
	         NoticeDao.noticeInsert(vo);
	         model.addAttribute("d",d);
	         }
	         else {
	         vo.setNo_subject(s);
	         NoticeDao.noticeInsert(vo);
	         model.addAttribute("d",s);
	         }
	         return "homess";
	      }
	   }


//@ResponseBody
//@PostMapping("/summer_image.do")
//public void summer_image(MultipartFile file, HttpServletRequest request,
//		HttpServletResponse response) throws Exception {
//	response.setContentType("text/html;charset=utf-8");
//	PrintWriter out = response.getWriter();
//	String file_name = file.getOriginalFilename();
//	String server_file_name = fileDBName(file_name, savefolder);
//	System.out.println("server file : " + server_file_name);
//	file.transferTo(new File(savefolder + server_file_name));
//	out.println("resources/upload"+server_file_name);
//	out.close();
//}
//private String fileDBName(String fileName, String saveFolder) {
//	Calendar c = Calendar.getInstance();
//	int year = c.get(Calendar.YEAR);
//	int month = c.get(Calendar.MONTH);
//	int date = c.get(Calendar.DATE);
//
//	String homedir = saveFolder + year + "-" + month + "-" + date;
//	System.out.println(homedir);
//	File path1 = new File(homedir);
//	if (!(path1.exists())) {
//		path1.mkdir();
//	}
//	Random r = new Random();
//	int random = r.nextInt(100000000);
//
//	int index = fileName.lastIndexOf(".");
//
//	String fileExtension = fileName.substring(index + 1);
//	System.out.println("fileExtension = " + fileExtension);
//
//	String refileName = "bbs" + year + month + date + random + "." + fileExtension;
//	System.out.println("refileName = " + refileName);
//
//	String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
//	System.out.println("fileDBName = " + fileDBName);
//
//	return fileDBName;
//}
