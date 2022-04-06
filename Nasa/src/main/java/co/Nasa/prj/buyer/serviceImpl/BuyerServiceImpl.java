package co.Nasa.prj.buyer.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.buyer.service.BuyerMapper;
import co.Nasa.prj.buyer.service.BuyerService;
import co.Nasa.prj.comm.VO.BuyerVO;

@Repository("BuyerDao")
public class BuyerServiceImpl implements BuyerService {

	@Autowired
	BuyerMapper map;

	@Override
	public BuyerVO selectBuyer(BuyerVO vo) {
		return map.selectBuyer(vo);
	}

	@Override
	public int updateBuyer(BuyerVO vo) {
		return map.updateBuyer(vo);
	}

	@Override
	public int deleteBuyer(BuyerVO vo) {
		return map.deleteBuyer(vo);
	}

	@Override
	public int BuyerNicknameCheck(BuyerVO vo) {
		return map.BuyerNicknameCheck(vo);
	}

	@Override
	public int BuyerEmailCheck(BuyerVO vo) {
		return map.BuyerEmailCheck(vo);
	}

	@Override
	public int BuyerInsert(BuyerVO vo) {
		return map.BuyerInsert(vo);
	}
}
