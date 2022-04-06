package co.Nasa.prj.notice.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.Nasa.prj.comm.VO.NoticeVO;
import co.Nasa.prj.comm.VO.PagingDTO;
import co.Nasa.prj.notice.service.NoticeService;
import co.Nasa.prj.seller.service.SellerService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService NoticeDao;
	@Autowired
	private SellerService sellerDAO;
	
	@Value("#{upload['editorfile']}")
	private String upload;
	
	@RequestMapping("/sellerKnowhow.do")
	public String sellerKnowhow(Model model, HttpSession session, PagingDTO pagingdto) {
		//String no_id = (String)session.getAttribute("id");
		NoticeVO vo = new NoticeVO();
		vo.setNo_id((String)session.getAttribute("id"));
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		
		List<NoticeVO> list = NoticeDao.knowhowList(vo);
		pagingdto.setTotal(NoticeDao.countPagingKnowhow(vo));
		
		model.addAttribute("knowhows", list);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
		return "seller/sellerKnowhow";
	}
	
	@RequestMapping("/knowhowDetail.do")
	public String knowhowDetail(Model model, @RequestParam("no_code") String no_code) {
		System.out.println(no_code);
		NoticeVO vo = new NoticeVO();
		vo = NoticeDao.knowhowSelect(no_code);
		model.addAttribute("knowhowDetail",NoticeDao.knowhowSelect(no_code));
		model.addAttribute("sellerInfo", sellerDAO.SellerSelect(vo.getNo_id()));
		return "seller/knowhowDetail";
	}

	@ResponseBody
	@RequestMapping("/knowhowInsert.do")
	public String knowhowInsert(Model model, NoticeVO vo, HttpServletRequest req, HttpSession session,
			@RequestParam("file") MultipartFile file)
			throws IOException {

		vo.setNo_id((String)session.getAttribute("id"));
		
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if(file.getSize() > 0 && !file.getOriginalFilename().equals("")) {
				
				
				//fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\editor\\";
				//System.out.println(fileRoot);
				
				fileRoot =upload;
				
				String originalFileName = file.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				String r_img = "/upload/editorfile/" + savedFileName;
				
				File targetFile = new File(fileRoot + savedFileName);	
				try {
					InputStream fileStream = file.getInputStream();
					FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
					vo.setNo_img(r_img); //uuid
					vo.setNo_originimg((originalFileName)); //원본
					
				} catch (Exception e) {
					//파일삭제
					FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
					e.printStackTrace();
				}
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		
		System.out.println(vo.getNo_title());
		System.out.println(file.getOriginalFilename());
		// 서머노트 코드 원본
		String s = req.getParameter("summernote");
		System.out.println("s라고 저장됨 " + s);
		System.out.println("파일자르는 이름 " + s.indexOf("src=")); // 13번째에서 잘라야함.
		vo.setNo_subject(s);
		if(s.indexOf("src=")!=-1) {
			System.out.println(s);
			s = s.replaceAll(req.getContextPath() +"/resources/fileupload/",  "/upload/editorfile/");
			System.out.println(s);
			vo.setNo_subject(s);
		}
		
		String result = "FAIL";
		int n = NoticeDao.knowhowInsert(vo);
		if(n != 0) {
			result = "OK";
			model.addAttribute("d", s);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/knowhowDelete.do")
	public boolean knowhowDelete(@RequestParam("no_code") String no_code) {
		System.out.println(no_code);
		int n = NoticeDao.knowhowDelete(no_code);
		boolean b= true;
		if(n != 1) {
			b = false;
		}
		return b;
	}
	
	@RequestMapping("/knowhowUpdateForm.do")
	public String knowhowUpdateForm(Model model, @RequestParam("no_code") String no_code) {
		model.addAttribute("knowhowUpdate", NoticeDao.knowhowSelect(no_code));
		return "seller/knowhowUpdateForm";
	}
	
	@ResponseBody
	@RequestMapping("/knowhowUpdate.do")
	public String knowhowUpdate(NoticeVO vo,HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {
		
		
		NoticeVO vo2 = new NoticeVO();
		vo2 = NoticeDao.knowhowSelect(vo.getNo_code());
		
		
		try {
			// 파일이 있을때 탄다.
			if (file.getSize() > 0 && !file.getOriginalFilename().equals("")) {

				//fileRoot = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\editor\\";
				//System.out.println(fileRoot);
				//fileRoot = upload;
				
				String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
				String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

				
				String savepath = upload + savedFileName;
				String r_img = "/upload/editorfile/" + savedFileName;
				//uuid
				vo.setNo_img(r_img);
				
				//원본파일명
				vo.setNo_originimg(originalFileName);
				
				
				try {
					file.transferTo(new File(savepath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			else {
				vo.setNo_img(vo2.getNo_img());
				vo.setNo_originimg(vo2.getNo_originimg());			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String s = request.getParameter("summernote");
		System.out.println("s라고 저장됨 " + s);
		System.out.println("파일자르는 이름 " + s.indexOf("src=")); // 13번째에서 잘라야함.
		vo.setNo_subject(s);
		if(s.indexOf("src=")!=-1) {
			System.out.println(s);
			s = s.replaceAll(request.getContextPath() +"/resources/fileupload/", "/upload/editorfile/");
			System.out.println(s);
			vo.setNo_subject(s);
		}
		String result = "FAIL";
		int n = NoticeDao.knowhowUpdate(vo);
		
		if(n != 0) {
			result = "OK"; 
		}
		
		return result;
	}
	
	@RequestMapping("/go_knowhowlist.do")
	public String go_knowhowlist(Model model, PagingDTO pagingdto) {
		NoticeVO noticevo = new NoticeVO();
		pagingdto.setAmount(6);
		noticevo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<NoticeVO> knowhowlist = NoticeDao.pagingKnowhowList(noticevo);
		
		pagingdto.setTotal(NoticeDao.countPagingKnowhowList());
		System.out.println(new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum(), 6));
		model.addAttribute("knowhowlist",knowhowlist);
		
		return "seller/knowhowList";
	}
}
