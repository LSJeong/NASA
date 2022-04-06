package co.Nasa.prj.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;




@Controller
public class AdminController {

	@RequestMapping("/ckeditor.do")
	public String go_cheditor() {
		System.out.println("/ckeditor.do");
		return "CKEditor";
	}
//	@RequestMapping("/chatting.do")
//	public String go_chatting() {
//		System.out.println("/chatting.do");
//		return "buyer/Chatting";
//	}
	@RequestMapping("/fileupload.do")
	public String go_fileupload() {
		System.out.println("/fileupload.do");
		return "fileupload";
	}
	@RequestMapping("/bis.do")
	public String go_bis() {
		System.out.println("/bis.do");
		return "bis";
	}
}
