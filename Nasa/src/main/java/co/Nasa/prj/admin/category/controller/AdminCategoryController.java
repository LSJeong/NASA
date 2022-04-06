package co.Nasa.prj.admin.category.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCategoryController {

 @RequestMapping("/manage_category.do")
 public String manage_category() {
	 return "admin/category/manageCategory";
 }
}
