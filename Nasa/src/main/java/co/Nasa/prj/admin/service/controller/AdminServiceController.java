package co.Nasa.prj.admin.service.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Map;


import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.AdminServiceService;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.admin.service.PageDTO;



@Controller
public class AdminServiceController {
	@Autowired
	AdminServiceService adminServiceDao;
	
	
	@RequestMapping("/manage_service.do")
	public String manage_service(Model model, Criteria cri) {
		model.addAttribute("serviceLists", adminServiceDao.getServiceListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, adminServiceDao.searchTotalService(cri)));
		model.addAttribute("searchTotal", adminServiceDao.searchTotalService(cri));
		model.addAttribute("total", adminServiceDao.totalService());
		model.addAttribute("today", adminServiceDao.todayService());
		
		return "admin/service/manageService";
	}
	
	@ResponseBody
	@PostMapping("/ajaxSelectService.do")
	public Map<String, Object> ajaxSelectService(AdminAuthorVO vo, @RequestParam("ser_code")String s_code, @RequestParam("ser_code")String scode) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("serviceInfo",adminServiceDao.detailedService(vo));
		map.put("totalPay", adminServiceDao.totalPay(s_code));
		map.put("totalReview", adminServiceDao.totalReview(scode));
		map.put("promotion", adminServiceDao.promotionService(vo.getSer_code()));
		return map;
	}
	@RequestMapping("/manage_powerService.do")
	public String manage_powerService() {
		return "admin/service/managepowerService";
	}
}
