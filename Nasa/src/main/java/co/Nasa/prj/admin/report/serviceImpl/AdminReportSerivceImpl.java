package co.Nasa.prj.admin.report.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.report.service.AdminReportMapper;
import co.Nasa.prj.admin.report.service.AdminReportService;
import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.ReportVO;

@Repository("reportDao")
public class AdminReportSerivceImpl implements AdminReportService {

	@Autowired
	AdminReportMapper map;

	
	@Override
	public int totalReport(Criteria cri) {
		// TODO Auto-generated method stub
		return map.totalReport(cri);
	}

	@Override
	public List<ReportVO> getReportListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getReportListWithPaging(cri);
	}

	@Override
	public ReportVO detailedReport(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.detailedReport(vo);
	}

	@Override
	public int totalReportWait(Criteria cri) {
		// TODO Auto-generated method stub
		return map.totalReportWait(cri);
	}

	@Override
	public List<ReportVO> getReportWaitListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getReportWaitListWithPaging(cri);
	}



	@Override
	public int updateReportResult(AdminAuthorVO vo) {
		// TODO Auto-generated method stub
		return map.updateReportResult(vo);
	}

	@Override
	public ReportVO detailedReportWait(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.detailedReportWait(vo);
	}

	@Override
	public int updateDeniedReport(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.updateDeniedReport(vo);
	}

	@Override
	public Map<String, Object> updateConfirmReport(Map<String, Object> reportMap) {
		// TODO Auto-generated method stub
		return map.updateConfirmReport(reportMap);
	}

	@Override
	public int totalReportComplete(Criteria cri) {
		// TODO Auto-generated method stub
		return map.totalReportComplete(cri);
	}

	@Override
	public List<ReportVO> getReportCompleteListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getReportCompleteListWithPaging(cri);
	}

	@Override
	public ReportVO detailedReportComplete(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.detailedReportComplete(vo);
	}

	@Override
	public int totalReportRefuse(Criteria cri) {
		// TODO Auto-generated method stub
		return map.totalReportRefuse(cri);
	}

	@Override
	public List<ReportVO> getReportRefuseListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getReportRefuseListWithPaging(cri);
	}

	@Override
	public ReportVO detailedRefuseComplete(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.detailedRefuseComplete(vo);
	}

	@Override
	public void scheduleMemberBlackList() {
		 map.scheduleSellerBlackList();
	     map.scheduleBuyerBlackList();

		
	}

	@Override
	public List<AdminAuthorVO> getBlackListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getBlackListWithPaging(cri);
	}

	@Override
	public int searchBlackListTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return map.searchBlackListTotal(cri);
	}

	@Override
	public int blackListTotal() {
		// TODO Auto-generated method stub
		return map.blackListTotal();
	}

	@Override
	public AdminAuthorVO detailBlackMember(String email) {
		// TODO Auto-generated method stub
		return map.detailBlackMember(email);
	}

	@Override
	public int todayBlackListMember() {
		// TODO Auto-generated method stub
		return map.todayBlackListMember();
	}

	@Override
	public int todayPermanentStop() {
		// TODO Auto-generated method stub
		return map.todayPermanentStop();
	}

	@Override
	public int todayReportTotal() {
		// TODO Auto-generated method stub
		return map.todayReportTotal();
	}

	@Override
	public int waitReportTotal() {
		// TODO Auto-generated method stub
		return map.waitReportTotal();
	}

	@Override
	public int realTotalReport() {
		// TODO Auto-generated method stub
		return map.realTotalReport();
	}

	



	

	




	
}
