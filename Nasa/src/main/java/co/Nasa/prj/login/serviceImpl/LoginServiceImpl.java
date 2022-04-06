package co.Nasa.prj.login.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.AdminVO;
import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.login.service.LoginMapper;
import co.Nasa.prj.login.service.LoginService;
import co.Nasa.prj.login.service.LoginVO;

@Repository("LoginDao")
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginMapper map;
	

	@Override
	public List<LoginVO> selectListbuyer() {
		// TODO Auto-generated method stub
		return map.selectListbuyer();
	}

	@Override
	public LoginVO selectbuyer(LoginVO vo) {
		// TODO Auto-generated method stub
		return map.selectbuyer(vo);
	}

	@Override
	public LoginVO selectbuyerId(LoginVO vo) {
		// TODO Auto-generated method stub
		return map.selectbuyerId(vo);
	}

	@Override
	public LoginVO readMemberInfo(String b_email) {
		// TODO Auto-generated method stub
		return map.readMemberInfo(b_email);
	}

	@Override
	public SellerVO selectseller(SellerVO vo) {
		// TODO Auto-generated method stub
		return map.selectseller(vo);
	}

	@Override
	public AdminVO selectadmin(AdminVO vo) {
		// TODO Auto-generated method stub
		return map.selectadmin(vo);
	}


}