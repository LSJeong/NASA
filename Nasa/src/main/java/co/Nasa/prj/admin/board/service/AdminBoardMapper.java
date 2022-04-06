package co.Nasa.prj.admin.board.service;

import java.util.List;

import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;

public interface AdminBoardMapper {
	
	List<AdminAuthorVO> getSelelrBoardWithPaging(Criteria cri);
	public int totalBoard(Criteria cri); 
	public int searchBoardTotal(Criteria cri);
	public AdminAuthorVO getBoardInfo(String code);
	public int todayTotalBoard();

}
