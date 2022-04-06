package co.Nasa.prj.login.service;

import java.util.List;

import co.Nasa.prj.comm.VO.AdminVO;
import co.Nasa.prj.comm.VO.SellerVO;

public interface LoginMapper {
	
	/*
	 * BUYER 로그인
	 */
	public List<LoginVO> selectListbuyer();
	LoginVO selectbuyer(LoginVO vo);
	LoginVO selectbuyerId(LoginVO vo);
	public LoginVO readMemberInfo(String b_email);
	
	
	/*
	 * seller 로그인
	 */
	SellerVO selectseller(SellerVO vo);
	
	
	/*
	 * ADMIN 로그인
	 */
	AdminVO selectadmin(AdminVO vo);
}
