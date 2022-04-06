package co.Nasa.prj.review_comment.service;

import java.util.List;

import co.Nasa.prj.comm.VO.Review_CommentVO;

public interface Review_CommentService {
	// 리뷰 댓글 전체 조회
	public List<Review_CommentVO> selectReview_CommentList();
	
	// 특정 review_comment 조회
	public Review_CommentVO selectReview_comment(Review_CommentVO vo);
	
	// 특정 판매자 대댓글 조회
	public List<Review_CommentVO> sellerReviewCommentList(Review_CommentVO vo);
	
	public int sellerReviewUpdate(Review_CommentVO vo);
	
	int deleteReviewComment(String rere_code);
	int sellerReviewInsert(Review_CommentVO vo);
	public Review_CommentVO reviewCommSelect(String review_code);
	
	// 답글 작성
	public int writeReview_comment(Review_CommentVO vo);
}
