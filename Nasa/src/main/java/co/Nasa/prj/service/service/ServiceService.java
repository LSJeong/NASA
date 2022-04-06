package co.Nasa.prj.service.service;

import java.util.List;

import co.Nasa.prj.comm.VO.PromotionVO;
import co.Nasa.prj.comm.VO.ServiceVO;

public interface ServiceService {
	List<ServiceVO> serviceList();
	int serviceInsert(ServiceVO vo);
	ServiceVO serviceSelect(String ser_code);
	int serviceUpdate(ServiceVO vo);
	
	List<ServiceVO> serviceSelectList(ServiceVO vo);
	List<ServiceVO> serviceMaxEnddateList(String s_email);
	
	ServiceVO serviceSelectMaxEnd(ServiceVO vo);
	
	int endService(ServiceVO vo);

	int schEndDateCheck();
	
	List<ServiceVO> servicePromotion(ServiceVO vo);

	
	List<ServiceVO> homeCategorySelect(ServiceVO vo);
	public int homeCategorySelectCount(ServiceVO vo);
	
	List<ServiceVO> homeCategorySelectAll(ServiceVO vo);
	public int homeCategorySelectAllCount(ServiceVO vo);
	
	List<ServiceVO> sellerMainServiceList(ServiceVO vo);
	
	List<ServiceVO> bestServiceList();
	
	// 메인페이지 관심 카테고리 추천
	List<ServiceVO> randomSelectService(String ser_sub_cate);
	// 판매자 혹은 비 로그인 시
	List<ServiceVO> notBuyerRandomService();
	
	int countPagingSellerService(ServiceVO vo);
	
	List<ServiceVO> sellerMainServiceListU(ServiceVO vo);
	int countPagingSellerServiceU(ServiceVO vo);
	
	List<ServiceVO> sellerMainServiceListY(ServiceVO vo);
	int countPagingSellerServiceY(ServiceVO vo);
	
	int DirectendService(ServiceVO vo);
	
	// 메인페이지 랜덤 프로모션 표시
	List<ServiceVO> randomPromotion();
	
	List<ServiceVO> sellerDetailService(ServiceVO vo);
}
