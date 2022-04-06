package co.Nasa.prj.fileupload.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MFileUploadController {

//	 @RequestMapping(value = "fileupload1")
//	 public String requestupload1(MultipartHttpServletRequest mRequest) {
//	        String src = mRequest.getParameter("src");
//	        MultipartFile mf = mRequest.getFile("file");
//
//	        String path = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
//
//	        String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//	        long fileSize = mf.getSize(); // 파일 사이즈
//
//	        System.out.println("originFileName : " + originFileName);
//	        System.out.println("fileSize : " + fileSize);
//
//	        String safeFile = path + originFileName;
//
//	        try {
//	            mf.transferTo(new File(safeFile));
//	        } catch (IllegalStateException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        } catch (IOException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        }
//
//	        return "redirect:/";
//	    }
//	 
//	 @RequestMapping(value = "fileupload2")
//	    public String requestupload2(MultipartHttpServletRequest mRequest) {
//	        List<MultipartFile> fileList = mRequest.getFiles("file");
//	        String src = mRequest.getParameter("src");
//
//	        String path = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
//
//	        for (MultipartFile mf : fileList) {
//	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//	            long fileSize = mf.getSize(); // 파일 사이즈
//
//	            System.out.println("originFileName : " + originFileName);
//	            System.out.println("fileSize : " + fileSize);
//
//	            String safeFile = path + originFileName;
//	            try {
//	                mf.transferTo(new File(safeFile));
//	            } catch (IllegalStateException e) {
//	                // TODO Auto-generated catch block
//	                e.printStackTrace();
//	            } catch (IOException e) {
//	                // TODO Auto-generated catch block
//	                e.printStackTrace();
//	            }
//	        }
//
//	        return "redirect:/";
//	    }
	 
	 @ResponseBody
	 
	 
	 
	 
		@RequestMapping(value = "file-upload.do", method = RequestMethod.POST)
		public String fileUpload(
				@RequestParam("article_file") List<MultipartFile> multipartFile
				, HttpServletRequest request) {
			String strResult = "{ \"result\":\"FAIL\" }";
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			String fileRoot;
			try {
				// 파일이 있을때 탄다.
				if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
					
					for(MultipartFile file:multipartFile) {
						fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
						System.out.println(fileRoot);
						
						String originalFileName = file.getOriginalFilename();	//오리지날 파일명
						String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
						String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
						
						File targetFile = new File(fileRoot + savedFileName);	
						try {
							InputStream fileStream = file.getInputStream();
							FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
							
						} catch (Exception e) {
							//파일삭제
							FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
							e.printStackTrace();
							break;
						}
					}
					strResult = "{ \"result\":\"OK\" }";
					System.out.println("파일이미지1");
				}
				// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
				else
					strResult = "{ \"result\":\"OK\" }";
				System.out.println("파일이미지2");
			}catch(Exception e){
				e.printStackTrace();
			}
			return strResult;
		}
}
