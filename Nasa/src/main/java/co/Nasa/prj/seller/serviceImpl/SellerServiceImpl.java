package co.Nasa.prj.seller.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.seller.service.SellerMapper;
import co.Nasa.prj.seller.service.SellerService;

@Repository("sellerDAO")
public class SellerServiceImpl implements SellerService {
	
	@Autowired
	SellerMapper map;

	@Override
	public int SellerNicknameCheck(SellerVO vo) {
		return map.SellerNicknameCheck(vo);
	}
	

	@Override
	public int SellerEmailCheck(SellerVO vo) {
		return map.SellerEmailCheck(vo);
	}

	@Override
	public List<SellerVO> selectSellerList() {
		return map.selectSellerList();
	}


	@Override
	public int SellerInsert(SellerVO vo) {
		return map.SellerInsert(vo);
	}


	@Override
	public int SellerUpdate(SellerVO vo) {
		return map.SellerUpdate(vo);
	}


	@Override
	public SellerVO SellerSelect(String s_email) {
		return map.SellerSelect(s_email);
	}


	@Override
	public int SellerProfileUpdate(SellerVO vo) {
		return map.SellerProfileUpdate(vo);
	}


	@Override
	public SellerVO chatsellerselect(SellerVO vo) {
		// TODO Auto-generated method stub
		return map.chatsellerselect(vo);
	}


	@Override
	public SellerVO SellerNickSelect(String s_nickname) {
		// TODO Auto-generated method stub
		return map.SellerNickSelect(s_nickname);
	}

	@Override
	public List<SellerVO> bestSellerList() {
		return map.bestSellerList();
  }
	public SellerVO ChatSellerselect(SellerVO vo) {
		// TODO Auto-generated method stub
		return map.ChatSellerselect(vo);

	}


	@Override
	public Integer sellerRank(String s_email) {
		return map.sellerRank(s_email);
	}


	@Override
	public int deleteSeller(SellerVO vo) {
		return map.deleteSeller(vo);
	}

}
