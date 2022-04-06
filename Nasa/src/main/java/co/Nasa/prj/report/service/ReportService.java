package co.Nasa.prj.report.service;

import java.util.List;

import co.Nasa.prj.comm.VO.ReportVO;

public interface ReportService {
	// 구매자 신고내역 조회
	List<ReportVO> selectBuyerReportList(ReportVO vo);
	
	//판매자 신고내역 조회
	List<ReportVO> selectSellerReportList(ReportVO vo);
	
	// 구매자가 판매자 리뷰댓글 신고
	int insertBuyerReportsSeller(ReportVO vo);
	
	//채팅 신고
	int insertChattingReport(ReportVO vo);
	

	// 판매자가 구매자 댓글 신고
	int sellerReviewReport(ReportVO vo);

	//구매자 신고내역 페이징 단위 조회
	List<ReportVO> selectPagingBuyerReportList(ReportVO vo);
	
	// total count (buyer)
	int countPagingBuyerReport(ReportVO vo);
	
	int countPagingSellerReport(ReportVO vo);

}
