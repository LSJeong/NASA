package co.Nasa.prj.admin.sales.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.Nasa.prj.comm.VO.PaymentVO;
import co.Nasa.prj.payment.service.PaymentService;

@Controller
public class AdminSalesController {
	
	@Autowired
	PaymentService paymentDao;
	
	@RequestMapping("/sales_category.do")
	public String sales_category() {
		return "admin/sales/salesCategory";
	}
	
	@RequestMapping("/sales_promotion.do")
	public String sales_promotion() {
		return "admin/sales/salesPromotion";
	}
	
	@RequestMapping("/all_sales.do")
	public String all_sales(Model model) {
//		List<PaymentVO> salestable = paymentDao.selectpaymenttable();
//		model.addAttribute("salestable",salestable);
		
		return "admin/sales/allSales";
	}
}
