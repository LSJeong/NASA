package co.Nasa.prj.buyer.service;

import co.Nasa.prj.comm.VO.BuyerVO;

public interface BuyerService {
	// 구매자 전체 조회
	public BuyerVO selectBuyer(BuyerVO vo);

	// 구매자 정보 수정
	public int updateBuyer(BuyerVO vo);

	// 회원 탈퇴
	public int deleteBuyer(BuyerVO vo);

	int BuyerNicknameCheck(BuyerVO vo);
	int BuyerEmailCheck(BuyerVO vo);
	int BuyerInsert(BuyerVO vo);

}
