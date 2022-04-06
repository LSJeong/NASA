package co.Nasa.prj.admin.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.board.service.AdminBoardMapper;
import co.Nasa.prj.admin.board.service.AdminBoardService;
import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
//
@Repository("adminBoardDao")
public class AdmimBoardServiceImpl implements AdminBoardService{

	@Autowired
	AdminBoardMapper map;
	@Override
	public List<AdminAuthorVO> getSelelrBoardWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getSelelrBoardWithPaging(cri);
	}
	@Override
	public int totalBoard(Criteria cri) {
		// TODO Auto-generated method stub
		return map.totalBoard(cri);
	}
	@Override
	public int searchBoardTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return map.searchBoardTotal(cri);
	}
	@Override
	public AdminAuthorVO getBoardInfo(String code) {
		// TODO Auto-generated method stub
		return map.getBoardInfo(code);
	}
	@Override
	public int todayTotalBoard() {
		// TODO Auto-generated method stub
		return map.todayTotalBoard();
	}

}
