package co.Nasa.prj.report.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.ReportVO;
import co.Nasa.prj.report.service.ReportMapper;
import co.Nasa.prj.report.service.ReportService;

@Repository("userReportDao")
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportMapper map;

	@Override
	public List<ReportVO> selectBuyerReportList(ReportVO vo) {
		return map.selectBuyerReportList(vo);
	}

	@Override
	public List<ReportVO> selectSellerReportList(ReportVO vo) {
		return map.selectSellerReportList(vo);
	}

	@Override
	public int insertBuyerReportsSeller(ReportVO vo) {
		return map.insertBuyerReportsSeller(vo);
	}

	@Override
	public int insertChattingReport(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.insertChattingReport(vo);
	}

	@Override

	public int sellerReviewReport(ReportVO vo) {
		return map.sellerReviewReport(vo);
	}

	public List<ReportVO> selectPagingBuyerReportList(ReportVO vo) {
		return map.selectPagingBuyerReportList(vo);
	}

	@Override
	public int countPagingBuyerReport(ReportVO vo) {
		return map.countPagingBuyerReport(vo);

	}

	@Override
	public int countPagingSellerReport(ReportVO vo) {
		return map.countPagingSellerReport(vo);
	}

}
