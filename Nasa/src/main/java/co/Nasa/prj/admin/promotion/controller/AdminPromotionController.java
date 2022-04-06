package co.Nasa.prj.admin.promotion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminPromotionController {
	
	@RequestMapping("/manage_promotion.do")
	public String managePromotion() {
		return "admin/promotion/managePromotion";
	}
	
	@RequestMapping("/run_promotion.do")
	public String promotion_in_progress() {
		return "admin/promotion/runPromotion";
	}
	
	@RequestMapping("/promotion_complete.do")
	public String promotion_complete() {
		return "admin/promotion/promotionComplete";
	}
	

}
