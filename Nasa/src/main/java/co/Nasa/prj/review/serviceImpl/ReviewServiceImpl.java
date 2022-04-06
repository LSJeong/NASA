package co.Nasa.prj.review.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.ReviewVO;
import co.Nasa.prj.comm.VO.ServiceVO;
import co.Nasa.prj.review.service.ReviewMapper;
import co.Nasa.prj.review.service.ReviewService;

@Repository("reviewDao")
public class ReviewServiceImpl implements ReviewService {
	@Autowired ReviewMapper map;

	@Override
	public List<ReviewVO> buyerSelectReviewList(ReviewVO vo) {
		return map.buyerSelectReviewList(vo);
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		return map.deleteReview(vo);
	}

	@Override
	public int insertReview(ReviewVO vo) {
		return map.insertReview(vo);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return map.updateReview(vo);
	}

	@Override
	public ReviewVO selectReview(ReviewVO vo) {
		return map.selectReview(vo);
	}

	@Override
	public List<ReviewVO> sellerReviewList(ServiceVO vo) {
		return map.sellerReviewList(vo);
	}

	@Override
	public List<ReviewVO> reviewSearch(ServiceVO vo) {
		return map.reviewSearch(vo);
	}

	@Override

	public List<ReviewVO> sellerReviewSelectList(ReviewVO vo) {
		return map.sellerReviewSelectList(vo);
	}

	public List<ReviewVO> selectPagingReviewList(ReviewVO vo) {
		return map.selectPagingReviewList(vo);
	}

	@Override
	public int countPagingReview(ReviewVO vo) {
		return map.countPagingReview(vo);

	}

	@Override
	public List<ReviewVO> selectReviewandReviewComment(ReviewVO vo) {
		return map.selectReviewandReviewComment(vo);
	}

	@Override
	public int sellerReviewCount(ServiceVO vo) {
		return map.sellerReviewCount(vo);
	}

	@Override
	public int sellerReviewCount2(HashMap<String, String> remap) {
		return map.sellerReviewCount2(remap);
	}

	@Override
	public List<ReviewVO> calcRateList() {
		return map.calcRateList();
	}

	@Override
	public List<ReviewVO> pagingReviewandReviewComment(ReviewVO vo) {
		return map.pagingReviewandReviewComment(vo);
	}

	@Override
	public int countReviewandReviewComment(ReviewVO vo) {
		return map.countReviewandReviewComment(vo);
	}

	@Override
	public int countScodeReview(ReviewVO vo) {
		return map.countScodeReview(vo);
	}

	@Override
	public int countSellerDetailReview(ReviewVO vo) {
		return map.countSellerDetailReview(vo);
	}

	@Override
	public List<ReviewVO> sellerDetailReview(ReviewVO vo) {
		return map.sellerDetailReview(vo);
	}

	@Override
	public int countAllSellerDetailReview(ReviewVO vo) {
		return map.countAllSellerDetailReview(vo);
	}

	
}
