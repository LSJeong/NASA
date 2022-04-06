package co.Nasa.prj.sub_category.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.comm.VO.SubCategoryVO;
import co.Nasa.prj.sub_category.service.Sub_CategoryService;

@Controller
public class Sub_CategoryController {
	@Autowired
	private Sub_CategoryService subCategoryDao;
	
	@RequestMapping("/subcategoryCall.do")
	@ResponseBody
	public List<SubCategoryVO> subcategoryCall(@Param("cat_no") String cat_no){
		System.out.println(cat_no);
		return subCategoryDao.subcategoryCall(cat_no);
	}
}
