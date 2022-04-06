package co.Nasa.prj.review.service;

import java.util.HashMap;
import java.util.List;

import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.ReviewVO;
import co.Nasa.prj.comm.VO.ServiceVO;

public interface ReviewMapper {
	// 구매자 리뷰 리스트 조회
	public List<ReviewVO> buyerSelectReviewList(ReviewVO vo);
	
	// 구매자 리뷰 페이징 단위 조회
	public List<ReviewVO> selectPagingReviewList(ReviewVO vo);
	
	// 서비스 상세 페이지에서 리뷰 조회할 때 쓸 거
	public List<ReviewVO> selectReviewandReviewComment(ReviewVO vo);
	public List<ReviewVO> pagingReviewandReviewComment(ReviewVO vo);
	public int countReviewandReviewComment(ReviewVO vo);
	
	// total count (review)
	int countPagingReview(ReviewVO vo);
	
	// 리뷰 하나 조회
	public ReviewVO selectReview(ReviewVO vo);
	
	// 리뷰 삭제 기능 (구매자가 리뷰페이지에서 자신의 리뷰 삭제 눌렀을 때 그 리뷰 삭제)
	public int deleteReview(ReviewVO vo);
	
	// 리뷰 등록
	public int insertReview(ReviewVO vo);
	
	// 리뷰 업데이트
	public int updateReview(ReviewVO vo);
	
	// 판매자 리뷰 리스트 조회
	public List<ReviewVO> sellerReviewList(ServiceVO vo);
	public List<ReviewVO> sellerReviewSelectList(ReviewVO vo);
	public List<ReviewVO> reviewSearch(ServiceVO vo);
	
	int sellerReviewCount(ServiceVO vo);
	int sellerReviewCount2(HashMap<String, String> remap);
	
	List<ReviewVO> calcRateList();
	
	public int countScodeReview(ReviewVO vo);
	
	public int countAllSellerDetailReview(ReviewVO vo);
	public int countSellerDetailReview(ReviewVO vo);
	public List<ReviewVO> sellerDetailReview(ReviewVO vo);
}
