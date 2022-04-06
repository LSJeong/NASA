package co.Nasa.prj.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.NoticeVO;
import co.Nasa.prj.notice.service.NoticeMapper;
import co.Nasa.prj.notice.service.NoticeService;

@Repository("NoticeDao")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeMapper map;

	@Override
	public int noticeInsert(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeInsert(vo);
	}

	@Override
	public int knowhowInsert(NoticeVO vo) {
		return map.knowhowInsert(vo);
	}

	@Override
	public List<NoticeVO> knowhowSelectList() {
		return map.knowhowSelectList();
	}

	@Override
	public NoticeVO knowhowSelect(String no_code) {
		return map.knowhowSelect(no_code);
	}

	@Override
	public int knowhowDelete(String no_code) {
		return map.knowhowDelete(no_code);
	}

	@Override
	public int knowhowUpdate(NoticeVO vo) {
		return map.knowhowUpdate(vo);
	}

	@Override
	public List<NoticeVO> knowhowList(NoticeVO vo) {
		return map.knowhowList(vo);
	}

	@Override
	public int countPagingKnowhow(NoticeVO vo) {
		return map.countPagingKnowhow(vo);
	}

	@Override
	public List<NoticeVO> pagingKnowhowList(NoticeVO vo) {
		return map.pagingKnowhowList(vo);
	}

	@Override
	public int countPagingKnowhowList() {
		return map.countPagingKnowhowList();
	}

}
