package co.Nasa.prj.promotion.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.PromotionVO;
import co.Nasa.prj.promotion.service.PromotionMapper;
import co.Nasa.prj.promotion.service.PromotionService;

@Repository("promotionDao")
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	private PromotionMapper map;
	
	@Override
	public int promotionInsert(PromotionVO vo) {
		return map.promotionInsert(vo);
	}

	@Override
	public List<PromotionVO> promotionList(PromotionVO vo) {
		return map.promotionList(vo);
	}

	@Override
	public String endPromotion(String pro_service) {
		return map.endPromotion(pro_service);
	}

	@Override
	public List<PromotionVO> promotionCheck(PromotionVO vo) {
		return map.promotionCheck(vo);
	}

	@Override
	public int promotionCancel(PromotionVO vo) {
		return map.promotionCancel(vo);
	}

	@Override
	public int promotionEnd(PromotionVO vo) {
		return map.promotionEnd(vo);
	}

	@Override
	public int startCheckPromotion() {
		return map.startCheckPromotion();
	}

	@Override
	public int endCheckPromotion() {
		return map.endCheckPromotion();
	}

	@Override
	public int serviceEndPromotion(PromotionVO vo) {
		return map.serviceEndPromotion(vo);
	}

	@Override
	public List<PromotionVO> promotionSelectList(PromotionVO vo) {
		return map.promotionSelectList(vo);
	}

	@Override
	public int serviceEndPromotion2(PromotionVO vo) {
		return map.serviceEndPromotion2(vo);
	}

	@Override
	public int countPagingPromotion(PromotionVO vo) {
		return map.countPagingPromotion(vo);
	}

	@Override
	public List<PromotionVO> promotionListU(PromotionVO vo) {
		return map.promotionListU(vo);
	}

	@Override
	public int countPagingPromotionU(PromotionVO vo) {
		return map.countPagingPromotionU(vo);
	}

	@Override
	public List<PromotionVO> promotionListY(PromotionVO vo) {
		return map.promotionListY(vo);
	}

	@Override
	public int countPagingPromotionY(PromotionVO vo) {
		return map.countPagingPromotionY(vo);
	}

	@Override
	public int DirectPromCancel(PromotionVO vo) {
		return map.DirectPromCancel(vo);
	}

	@Override
	public int DirectPromEnd(PromotionVO vo) {
		return map.DirectPromEnd(vo);
	}

	@Override
	public PromotionVO goingSelectPromo(String ser_code) {
		return map.goingSelectPromo(ser_code);
	}	
	
}
