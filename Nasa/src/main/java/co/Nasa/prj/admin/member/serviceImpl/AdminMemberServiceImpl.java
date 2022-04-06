package co.Nasa.prj.admin.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.member.service.AdminMemberMapper;
import co.Nasa.prj.admin.member.service.AdminMemberService;

import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.BuyerVO;
import co.Nasa.prj.comm.VO.SellerVO;

@Repository("memberDao")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	AdminMemberMapper map;

//	@Override
//	public List<BuyerVO> buyerList() {
//		// TODO Auto-generated method stub
//		return map.buyerList();
//	}
	

	@Override
	public AdminAuthorVO selectBuyer(String id) {
		// TODO Auto-generated method stub
		return map.selectBuyer(id);
	}

	@Override
	public List<SellerVO> sellerList(Criteria cri) {
		// TODO Auto-generated method stub
		return map.sellerList(cri);
	}


	@Override
	public List<AdminAuthorVO> selectBuyerPayment(Criteria cri) {
		// TODO Auto-generated method stub
		return map.selectBuyerPayment(cri);
	}


	@Override
	public List<AdminAuthorVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getListWithPaging(cri);
	}

	@Override
	public int getBuyerTotal() {
		// TODO Auto-generated method stub
		return map.getBuyerTotal();
	}

	@Override
	public int getSellerTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getSellerTotal(cri);
	}

	@Override
	public int updateMemberRank(BuyerVO vo) {
		// TODO Auto-generated method stub
		return map.updateMemberRank(vo);
	}

	@Override
	public AdminAuthorVO selectSeller(String id) {
		// TODO Auto-generated method stub
		return map.selectSeller(id);
	}

	@Override
	public int updateSellerRank(SellerVO vo) {
		// TODO Auto-generated method stub
		return map.updateSellerRank(vo);
	}

	@Override
	public List<AdminAuthorVO> selectSellerServiceList(Criteria cri) {
		// TODO Auto-generated method stub
		return map.selectSellerServiceList(cri);
	}

	@Override
	public int searchBuyerTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return map.searchBuyerTotal(cri);
	}

	@Override
	public int todayNewBuyer() {
		// TODO Auto-generated method stub
		return map.todayNewBuyer();
	}

	@Override
	public int todayWithdrawalBuyer() {
		// TODO Auto-generated method stub
		return map.todayWithdrawalBuyer();
	}

	@Override
	public int todayNewSeller() {
		// TODO Auto-generated method stub
		return map.todayNewSeller();
	}

	@Override
	public int todayWithdrawalSeller() {
		// TODO Auto-generated method stub
		return map.todayWithdrawalSeller();
	}

	@Override
	public int totalSeller() {
		// TODO Auto-generated method stub
		return map.totalSeller();
	}





	



	
	
}
