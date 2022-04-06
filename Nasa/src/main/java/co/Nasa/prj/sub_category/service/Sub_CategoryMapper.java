package co.Nasa.prj.sub_category.service;

import java.util.List;

import co.Nasa.prj.comm.VO.SubCategoryVO;

public interface Sub_CategoryMapper {
	// sub_category 전체 리스트 가져오기
	List<SubCategoryVO> sub_categoryList();
	
	// sub_category 하나 가져오기
	SubCategoryVO selectSub_category(SubCategoryVO vo);
	
	List<SubCategoryVO> subcategoryCall(String cat_no);
}
