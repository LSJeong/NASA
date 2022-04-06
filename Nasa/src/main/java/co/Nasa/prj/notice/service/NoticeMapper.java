package co.Nasa.prj.notice.service;

import java.util.List;

import co.Nasa.prj.comm.VO.NoticeVO;

public interface NoticeMapper {
	List<NoticeVO> knowhowSelectList();
	NoticeVO knowhowSelect(String no_code);
	int noticeInsert(NoticeVO vo);
	int knowhowInsert(NoticeVO vo);
	int knowhowDelete(String no_code);
	int knowhowUpdate(NoticeVO vo);
	
	List<NoticeVO> knowhowList(NoticeVO vo);
	int countPagingKnowhow(NoticeVO vo);
	
	List<NoticeVO> pagingKnowhowList(NoticeVO vo);
	int countPagingKnowhowList();
}
