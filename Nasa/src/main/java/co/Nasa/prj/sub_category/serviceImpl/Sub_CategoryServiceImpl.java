package co.Nasa.prj.sub_category.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.SubCategoryVO;
import co.Nasa.prj.sub_category.service.Sub_CategoryMapper;
import co.Nasa.prj.sub_category.service.Sub_CategoryService;

@Repository("subCategoryDao")
public class Sub_CategoryServiceImpl implements Sub_CategoryService {
	@Autowired
	private Sub_CategoryMapper map;

	@Override
	public List<SubCategoryVO> sub_categoryList() {
		return map.sub_categoryList();
	}

	@Override
	public List<SubCategoryVO> subcategoryCall(String cat_no) {
		return map.subcategoryCall(cat_no);
	}

	@Override
	public SubCategoryVO selectSub_category(SubCategoryVO vo) {
		return map.selectSub_category(vo);
	}

}
