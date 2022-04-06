package co.Nasa.prj.admin.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminFaqController {

	@RequestMapping("/manage_faq.do")
	public String manage_faq() {
		return "admin/faq/manageFaq";
	}
	
	@RequestMapping("/insertFaqForm.do")
	public String insertFaqForm() {
		return "admin/faq/insertFaqForm";
	}
	@RequestMapping("/ModifyFaqForm.do")
	public String ModifyFaqForm() {
		return "admin/faq/ModifyFaqForm";
	}

}
