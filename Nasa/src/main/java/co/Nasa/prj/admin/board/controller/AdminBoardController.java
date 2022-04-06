package co.Nasa.prj.admin.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.admin.board.service.AdminBoardService;
import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.admin.service.PageDTO;
import co.Nasa.prj.comm.VO.NoticeVO;

@Controller
public class AdminBoardController {
	
	@Autowired
	AdminBoardService adminBoardDao;
	
	
	@GetMapping("/manage_sellerBoard.do")
	public String manage_sellerBoard(Model model, Criteria cri) {
		model.addAttribute("boardLists", adminBoardDao.getSelelrBoardWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, adminBoardDao.searchBoardTotal(cri)));
		model.addAttribute("total",adminBoardDao.totalBoard(cri));
		model.addAttribute("searchTotal",adminBoardDao.searchBoardTotal(cri));
		model.addAttribute("todayTotal", adminBoardDao.todayTotalBoard());
		return "admin/board/mangeSellerBoard";
	}
	
	@ResponseBody
	@PostMapping("/ajaxDetailBoard.do")
	public AdminAuthorVO ajaxDetailBoard(AdminAuthorVO vo) {
		return adminBoardDao.getBoardInfo(vo.getNo_code());
	}
}
//	@RequestMapping("/manage_notice.do")
//	public String manage_notice() {
//		return "admin/notice/manageNotice";
//	}
	
//	
//	@RequestMapping("/InsertNoticeForm.do")
//	public String InsertNoticeForm() {
//		return "admin/notice/InsertNoticeForm";
//	}
//	
//	
//	@RequestMapping("/ModifyNoticeForm.do")
//	public String ModifyNoticeForm() {
//		return "admin/notice/modifyNoticeForm";
//	}
//}
