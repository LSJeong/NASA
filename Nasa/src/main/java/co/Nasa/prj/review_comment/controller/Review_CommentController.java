package co.Nasa.prj.review_comment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.comm.VO.Review_CommentVO;
import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.review_comment.service.Review_CommentService;
import co.Nasa.prj.seller.service.SellerService;

@Controller
public class Review_CommentController {
	@Autowired
	private Review_CommentService reviewCommentDao;
	@Autowired
	private SellerService sellerDAO;
	
	@ResponseBody
	@RequestMapping("/sellerReviewUpdate.do")
	public Review_CommentVO sellerReviewUpdate(@RequestParam("rere_code") String rere_code, @RequestParam("rere_sub") String rere_sub, HttpSession session) {
		
		Review_CommentVO vo = new Review_CommentVO();
		vo.setRere_code(rere_code);
		vo.setRere_sel_sub(rere_sub);
		
		int n = reviewCommentDao.sellerReviewUpdate(vo);
	
		Review_CommentVO vo2 = new Review_CommentVO();
		vo2.setRere_code(rere_code);
		reviewCommentDao.selectReview_comment(vo2);
	
		
		return reviewCommentDao.selectReview_comment(vo2);
	}
	
	@RequestMapping("/deleteReview_comment.do")
	public ResponseEntity<String> deleteReview_comment(String rere_code) {
		System.out.println(rere_code);
		int n = reviewCommentDao.deleteReviewComment(rere_code);
		
		if (n == 1) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.FORBIDDEN);
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteReviewComment.do")
	public boolean deleteReviewComment(@RequestParam("rere_code") String rere_code) {
		int n = reviewCommentDao.deleteReviewComment(rere_code);
		if(n != 0) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/sellerReviewInsert.do")
	public Review_CommentVO sellerReviewInsert(@RequestParam("rvcode") String rvcode, @RequestParam("rere_sel_sub") String rere_sel_sub,
			HttpSession session) {
		SellerVO svo = new SellerVO();
		svo = sellerDAO.SellerSelect((String)session.getAttribute("id"));
		
		Review_CommentVO vo = new Review_CommentVO();
		vo.setReview_code(rvcode);
		vo.setRere_sel_id((String)session.getAttribute("id"));
		vo.setRere_sel_sub(rere_sel_sub);
		vo.setRere_sel_name(svo.getS_nickname());
		
		int n = reviewCommentDao.sellerReviewInsert(vo);
		
		return reviewCommentDao.reviewCommSelect(rvcode);
	}
	
	@RequestMapping("/reviewCommentUpdate.do")
	public String reviewCommentUpdate(Review_CommentVO vo, HttpSession session, HttpServletRequest request, Model model) {
		System.out.println(vo);
		vo.setRere_sel_id((String) session.getAttribute("id"));
		reviewCommentDao.sellerReviewUpdate(vo);
		model.addAttribute("nav", "review");
		return "redirect:" + request.getHeader("Referer");
	}
	
	@RequestMapping("/writeReview_comment.do")
	public String writeReview_comment(Review_CommentVO vo, HttpSession session, HttpServletRequest request) {
		vo.setRere_sel_id((String) session.getAttribute("id"));
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+vo.getReview_code());
		reviewCommentDao.writeReview_comment(vo);
		return "redirect:" + request.getHeader("Referer");
	}
}
