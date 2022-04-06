package co.Nasa.prj.admin.service;

import java.util.List;


import co.Nasa.prj.comm.VO.ServiceVO;

public interface AdminServiceService {

	List<AdminAuthorVO> getServiceListWithPaging(Criteria cri); //서비스 전체목록
	public int searchTotalService(Criteria cri); 
	public int totalService();
	public int todayService();
	public AdminAuthorVO detailedService(AdminAuthorVO vo); //서비스 선택
	
	public String totalPay(String code);//누적구매금액
	public int totalReview(String code); //누적리뷰수
	public AdminAuthorVO promotionService(String code);

}
