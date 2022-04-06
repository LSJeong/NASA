package co.Nasa.prj.review_comment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.Review_CommentVO;
import co.Nasa.prj.review_comment.service.Review_CommentMapper;
import co.Nasa.prj.review_comment.service.Review_CommentService;

@Repository("reviewCommentDao")
public class Review_CommentServiceImpl implements Review_CommentService {
	@Autowired Review_CommentMapper map;
	
	@Override
	public List<Review_CommentVO> selectReview_CommentList() {
		return map.selectReview_CommentList();
	}

	@Override
	public Review_CommentVO selectReview_comment(Review_CommentVO vo) {
		return map.selectReview_comment(vo);
	}

	@Override
	public List<Review_CommentVO> sellerReviewCommentList(Review_CommentVO vo) {
		return map.sellerReviewCommentList(vo);
	}

	@Override
	public int sellerReviewUpdate(Review_CommentVO vo) {
		return map.sellerReviewUpdate(vo);
	}

	@Override
	public int deleteReviewComment(String rere_code) {
		return map.deleteReviewComment(rere_code);
	}

	@Override
	public int sellerReviewInsert(Review_CommentVO vo) {
		return map.sellerReviewInsert(vo);
	}

	@Override
	public Review_CommentVO reviewCommSelect(String review_code) {
		return map.reviewCommSelect(review_code);
	}

	@Override
	public int writeReview_comment(Review_CommentVO vo) {
		return map.writeReview_comment(vo);
	}

}
