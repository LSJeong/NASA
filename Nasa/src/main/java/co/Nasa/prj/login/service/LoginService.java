package co.Nasa.prj.login.service;

import java.util.List;

import co.Nasa.prj.comm.VO.AdminVO;
import co.Nasa.prj.comm.VO.SellerVO;


public interface LoginService {
	//구매자
	public List<LoginVO> selectListbuyer();
	LoginVO selectbuyer(LoginVO vo);
	LoginVO selectbuyerId(LoginVO vo);
	LoginVO readMemberInfo(String b_email);
	
	//셀러
	SellerVO selectseller(SellerVO vo);
	
	//admin
	AdminVO selectadmin(AdminVO vo);
	
	
	
	
	
	
	
	
	
	
	
}
