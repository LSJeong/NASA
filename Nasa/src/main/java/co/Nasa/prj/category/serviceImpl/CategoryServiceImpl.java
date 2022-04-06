package co.Nasa.prj.category.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.category.service.CategoryMapper;
import co.Nasa.prj.category.service.CategoryService;
import co.Nasa.prj.comm.VO.CategoryVO;

@Repository("categoryDao")
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryMapper map;

	@Override
	public List<CategoryVO> selectCategoryList() {
		return map.selectCategoryList();
	}

	@Override
	public CategoryVO selectCategory(CategoryVO vo) {
		return map.selectCategory(vo);
	}

}
