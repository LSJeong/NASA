package co.Nasa.prj.category.service;

import java.util.List;

import co.Nasa.prj.comm.VO.CategoryVO;

public interface CategoryMapper {
	// category 전체 리스트 가져오기
	List<CategoryVO> selectCategoryList();
	
	// category 한 개 조회
	CategoryVO selectCategory(CategoryVO vo);
}
