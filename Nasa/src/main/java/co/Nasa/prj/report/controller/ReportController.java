package co.Nasa.prj.report.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.Nasa.prj.comm.VO.PagingDTO;
import co.Nasa.prj.comm.VO.ReportVO;
import co.Nasa.prj.comm.VO.ReviewVO;
import co.Nasa.prj.comm.VO.Review_CommentVO;
import co.Nasa.prj.report.service.ReportMapper;
import co.Nasa.prj.review.service.ReviewMapper;
import co.Nasa.prj.review.service.ReviewService;
import co.Nasa.prj.review_comment.service.Review_CommentMapper;

@Controller
public class ReportController {
	@Autowired 
	private ReportMapper userReportDao;
	@Autowired
	private Review_CommentMapper review_commentDao;
	@Autowired
	private ReviewMapper reviewDao;
	
	@Value("#{upload['upload']}")
	private String upload;
	@Value("#{upload['loupload']}")
	private String loupload;
	
	
	@RequestMapping("/sellerReport.do")
	public String sellerReport(Model model, HttpSession session, PagingDTO pagingdto) {
		ReportVO vo = new ReportVO();
		vo.setRe_reporter((String)session.getAttribute("id"));
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<ReportVO> reportList = userReportDao.selectSellerReportList(vo);
		pagingdto.setTotal(userReportDao.countPagingSellerReport(vo));
		
		model.addAttribute("reports", reportList);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
		return "seller/sellerReport";
	}
	
	@RequestMapping("/reportReview.do")
	public ResponseEntity<String> reportReview(ReviewVO reviewvo, ReportVO reportvo,
											   HttpSession session, HttpServletResponse response, 
											   HttpServletRequest request) {
		
		reviewvo = reviewDao.selectReview(reviewvo);
		reportvo.setRe_reporter((String)session.getAttribute("id"));
		reportvo.setRe_res(reviewvo.getRev_id());
		int i = userReportDao.insertBuyerReportsSeller(reportvo);
		
		if (i == 1) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
		}
	}
	
	@RequestMapping("/reportReview_comment.do")
	public ResponseEntity<String> reportReview_comment(Review_CommentVO rcvo, ReportVO rpvo, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		rcvo = review_commentDao.selectReview_comment(rcvo);
		System.out.println(rpvo);
		rpvo.setRe_reporter((String)session.getAttribute("id"));
		rpvo.setRe_res(rcvo.getRere_sel_id());
		int i = userReportDao.insertBuyerReportsSeller(rpvo);
		
		if (i == 1) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
		}
	}
	
	//report 여기까지함
	@ResponseBody
	@RequestMapping(value = "/reportChatting.do",produces = "text/plain;charset=UTF-8")
	public String reportChatting(HttpSession session,
			MultipartFile imgupload, HttpServletRequest req
			) {
		System.out.println("check");
		System.out.println("remember" + req.getParameter("re_member"));
		System.out.println("report type : |||||" + req.getParameter("reportType"));
		System.out.println("re_subject : |||||" + req.getParameter("re_subject"));
		
		
		int n = 0 ;
		String result = "";
		ReportVO vo = new ReportVO();
		vo.setRe_reporter((String) session.getAttribute("id"));
		System.out.println("vo값 찍어보기||||||||||||||||||||||||||||||||||||||||||||||||||||||"
				+ "" + vo.getRe_reporter());
		vo.setRe_type(req.getParameter("reportType"));
		vo.setRe_res(req.getParameter("re_member"));
		vo.setRe_subject(req.getParameter("re_subject"));

		String originaFileName = imgupload.getOriginalFilename();
		if(originaFileName.equals("")) {

		}else {
			//외부 업로드
			String saveurl =upload;
			
			//내부업로드
			//String saveurl =loupload;
			
			String savepath =saveurl +originaFileName;
			System.out.println(savepath);

			String r_img = "/upload/" + originaFileName;
			vo.setFilecode(r_img);
			System.out.println("파일코드 입력" + vo.getFilecode());
			
			try {
				imgupload.transferTo(new File(savepath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		n = userReportDao.insertChattingReport(vo);
		
		if(n>0) {
			result = "OK";
		}else {
			result = "NO";
		}
		return result;
 	}
	
	@ResponseBody
	@RequestMapping("/sellerReviewReport.do")
	public String sellerReviewReport(@RequestParam("rere_code") String re_code, @RequestParam("re_type") String re_type, @RequestParam("re_subject") String re_subject,
			HttpSession session) {
		ReviewVO rvo = new ReviewVO();
		rvo.setRev_code(re_code);
		rvo = reviewDao.selectReview(rvo);
		
		ReportVO vo = new ReportVO();
		
		vo.setRe_reporter((String)session.getAttribute("id"));
		vo.setRe_res(rvo.getRev_id());
		vo.setRe_type(re_type);
		vo.setRe_subject(re_subject);
		
		int n = userReportDao.sellerReviewReport(vo);
		System.out.println(n);
		if(n != 1) {
			return "F";
		}
		return "T";
	}
}
