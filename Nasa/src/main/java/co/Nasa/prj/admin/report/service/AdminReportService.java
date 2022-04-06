package co.Nasa.prj.admin.report.service;

import java.util.List;
import java.util.Map;

import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.ReportVO;

public interface AdminReportService {

	//전체조회 reportInquiry.jsp
	public int totalReport(Criteria cri); 
	public List<ReportVO> getReportListWithPaging(Criteria cri);
	public ReportVO detailedReport(ReportVO vo); //상세조회
	
	public int todayReportTotal();
	public int waitReportTotal();
	public int realTotalReport();
	
	//신고반려
	public int updateDeniedReport(ReportVO vo);
	
	//신고승인
	public Map<String, Object> updateConfirmReport(Map<String, Object>reportMap);
	
	//신고대기조회
	public int totalReportWait(Criteria cri);
	public List<ReportVO> getReportWaitListWithPaging(Criteria cri);
	public ReportVO detailedReportWait(ReportVO vo);
	public int updateReportResult(AdminAuthorVO vo); //신고 승인
	
	//신고승인완료조회
	public int totalReportComplete(Criteria cri);
	public List<ReportVO> getReportCompleteListWithPaging(Criteria cri);
	public ReportVO detailedReportComplete(ReportVO vo);
	
	//신고반료조회
	
	public int totalReportRefuse(Criteria cri);
	public List<ReportVO> getReportRefuseListWithPaging(Criteria cri);
	public ReportVO detailedRefuseComplete(ReportVO vo);
	
	
	//블랙리스트 한달정지
	public void scheduleMemberBlackList();
	
	//블랙리스트
	public List<AdminAuthorVO> getBlackListWithPaging(Criteria cri);
	public int searchBlackListTotal(Criteria cri);
	public int blackListTotal();
	public AdminAuthorVO detailBlackMember(String email);
	public int todayBlackListMember();
	public int todayPermanentStop(); //오늘의 영구정지
	
	
}
