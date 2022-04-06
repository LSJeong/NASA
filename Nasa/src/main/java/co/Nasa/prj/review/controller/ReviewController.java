package co.Nasa.prj.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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

import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.admin.service.PageDTO;
import co.Nasa.prj.buyer.service.BuyerMapper;
import co.Nasa.prj.comm.VO.BuyerVO;
import co.Nasa.prj.comm.VO.PagingDTO;
import co.Nasa.prj.comm.VO.PaymentVO;
import co.Nasa.prj.comm.VO.ReviewVO;
import co.Nasa.prj.comm.VO.ServiceVO;
import co.Nasa.prj.payment.service.PaymentMapper;
import co.Nasa.prj.review.service.ReviewMapper;
import co.Nasa.prj.review_comment.service.Review_CommentMapper;
import co.Nasa.prj.service.service.ServiceMapper;

@Controller
public class ReviewController {
	@Autowired ReviewMapper reviewDao;
	@Autowired ServiceMapper serviceDao;
	@Autowired Review_CommentMapper review_commentDao;
	@Autowired BuyerMapper buyerDao;
	@Autowired PaymentMapper paymentDao;
	
	@Value("#{upload['reviewupload']}")
	private String reviewupload;
	
	
	@RequestMapping("/deleteReview.do" )
	public ResponseEntity<String> deleteReview(ReviewVO vo) {
		int i = reviewDao.deleteReview(vo);
		
		if (i == 1) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
		}
	}
	
	@RequestMapping("/writeReview.do")
	public String writeReview(ReviewVO vo, MultipartFile reviewimg, HttpSession session, 
							  HttpServletResponse response, HttpServletRequest request) {
		BuyerVO buyervo = new BuyerVO();
		buyervo.setB_email((String) session.getAttribute("id"));
		buyervo = buyerDao.selectBuyer(buyervo);
		vo.setRev_id(buyervo.getB_email());
		vo.setRev_name(buyervo.getB_nickname());
		
		// img upload
		String originalFileName = reviewimg.getOriginalFilename();
		String extension = "";
		if(originalFileName.equals("")) {
			vo.setRev_img("");
		} else {
			extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID() + extension;
			String saveurl = reviewupload;
			String savepath = saveurl + saveFileName;
			
			String rev_img = "/upload/review/" + saveFileName;
			
			vo.setRev_img(rev_img);
			
			try { 
				reviewimg.transferTo(new File(savepath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} // try end
		}
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + vo);
		reviewDao.insertReview(vo);
		
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping(value = "/reviewUpdate.do", produces = "text/plain;charset=UTF-8")
	public String reviewUpdate(ReviewVO vo, MultipartFile revimg,HttpSession session, HttpServletResponse response,
			HttpServletRequest request) {
		ReviewVO rvvo = new ReviewVO();
		rvvo.setRev_code(vo.getRev_code());
		rvvo = reviewDao.selectReview(rvvo);
		
		// img upload
		String originalFileName = revimg.getOriginalFilename();
		if(originalFileName.equals("")) {
			vo.setRev_img(rvvo.getRev_img());
		} else {
			String saveurl = reviewupload;
//			String saveurl = "C:\\nasa\\NASA02\\Nasa\\src\\main\\webapp\\resources\\user\\assets\\img\\review\\";
			String savepath = saveurl + originalFileName;
			String rev_img = "/upload/review/" + originalFileName;
			//String rev_img = "resources/user/assets/img/review/" + originalFileName;
			
			vo.setRev_img(rev_img);
			
			try { 
				revimg.transferTo(new File(savepath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} // try end
		}
		
		reviewDao.updateReview(vo);
		
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("/sellerReview.do")
	public String sellerReview(Model model, HttpSession session,  HttpServletRequest request, PagingDTO pagingdto) {
		String s_email = (String)session.getAttribute("id");
		ServiceVO vo = new ServiceVO();
		vo.setS_email(s_email);
		vo.setSer_code(request.getParameter("scode"));
		
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		
		List<ReviewVO> reviewList = reviewDao.sellerReviewList(vo);
		pagingdto.setTotal(reviewDao.sellerReviewCount(vo));

		model.addAttribute("serviceList", serviceDao.serviceSelectList(vo));
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		model.addAttribute("address", "sellerReview.do?scode="+request.getParameter("scode")+"&");
		model.addAttribute("scode", request.getParameter("scode"));
		return "seller/sellerReview";
	}
	
	@RequestMapping("reviewQualifications.do")
	@ResponseBody
	public String reviewQualifications(String scode, HttpSession session) {
		String result = "";
		
		PaymentVO paymentvo = new PaymentVO();
		ReviewVO reviewvo = new ReviewVO();
		
		paymentvo.setB_email((String) session.getAttribute("id"));
		paymentvo.setS_code(scode);
		reviewvo.setRev_id((String) session.getAttribute("id"));
		reviewvo.setScode(scode);
		
		int paymentcount = paymentDao.countReviewPayment(paymentvo);
		int reviewcount = reviewDao.countScodeReview(reviewvo);
		System.out.println("paymentcount : " + paymentcount + "//// reviewcount : " + reviewcount);
		
		if(reviewcount < paymentcount) {
			result = "OK";
		} else {
			result = "NO";
		}
		
		System.out.println(result);
		
		return result;
	}
	
	
//	@ResponseBody
//	@RequestMapping("/reviewSearch.do")
//	public List<ReviewVO> reviewSearch(Model model, @RequestParam("scode") String scode, HttpSession session) {
//		HashMap<String, String> remap = new HashMap<String, String>();
//		remap.put("s_email", (String)session.getAttribute("id"));
//		remap.put("scode", scode);
//		
//		return reviewDao.reviewSearch(remap); 
//	}
	
//	@RequestMapping("/reviewSearch.do")
//	public String reviewSearch(Model model, @RequestParam("scode") String scode, HttpSession session, PagingDTO pagingdto) {
//		HashMap<String, String> remap = new HashMap<String, String>();
//		remap.put("s_email", (String)session.getAttribute("id"));
//		remap.put("scode", scode);
//		ReviewVO vo = new ReviewVO();
//		vo.setScode(scode);
//		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
//		List<ReviewVO> reviewList = reviewDao.reviewSearch(remap);
//		
//		pagingdto.setTotal(reviewDao.sellerReviewCount2(remap));
//		
//		model.addAttribute("reviewList", reviewList);
//		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
//		model.addAttribute("selectcode", scode);
//		return "seller/sellerReviewD"; 
//	}
}
