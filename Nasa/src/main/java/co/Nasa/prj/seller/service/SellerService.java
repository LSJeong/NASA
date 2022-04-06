package co.Nasa.prj.seller.service;

import java.util.List;

import co.Nasa.prj.comm.VO.SellerVO;

public interface SellerService {
	int SellerNicknameCheck(SellerVO vo);
	int SellerEmailCheck(SellerVO vo);
	int SellerInsert(SellerVO vo);
	int SellerUpdate(SellerVO vo);
	
	// seller 전체 조회
	public List<SellerVO> selectSellerList();

	//이메일로 한명 조회
	SellerVO SellerSelect(String s_email);

	//seller profile모든정보수정
	int SellerProfileUpdate(SellerVO vo);
	
	//채팅 셀러 조회
	public SellerVO chatsellerselect(SellerVO vo);
	
	//채팅 셀러 닉네임
	SellerVO SellerNickSelect(String s_nickname);
	

	List<SellerVO> bestSellerList();

	//채팅 셀러 등급 조회
	SellerVO ChatSellerselect(SellerVO vo);
	
	Integer sellerRank(String s_email);
	public int deleteSeller(SellerVO vo);
}
