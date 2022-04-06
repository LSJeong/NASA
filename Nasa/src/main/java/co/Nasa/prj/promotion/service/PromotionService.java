package co.Nasa.prj.promotion.service;

import java.util.List;

import co.Nasa.prj.comm.VO.PromotionVO;

public interface PromotionService {
	List<PromotionVO> promotionList(PromotionVO vo);
	int promotionInsert(PromotionVO vo);
	String endPromotion(String pro_service);
	
	List<PromotionVO> promotionCheck(PromotionVO vo);
	int promotionCancel(PromotionVO vo);
	int promotionEnd(PromotionVO vo);
	
	int startCheckPromotion();
	int endCheckPromotion();
	
	//서비스 종료했을때 진행/예정인 프로모션도 종료하기위해 검색
	List<PromotionVO> promotionSelectList(PromotionVO vo);
	
	int serviceEndPromotion(PromotionVO vo);
	int serviceEndPromotion2(PromotionVO vo);
	
	int countPagingPromotion(PromotionVO vo);
	
	List<PromotionVO> promotionListU(PromotionVO vo);
	int countPagingPromotionU(PromotionVO vo);
	
	List<PromotionVO> promotionListY(PromotionVO vo);
	int countPagingPromotionY(PromotionVO vo);
	
	int DirectPromCancel(PromotionVO vo);
	int DirectPromEnd(PromotionVO vo);
	
	PromotionVO goingSelectPromo(String ser_code);
}
