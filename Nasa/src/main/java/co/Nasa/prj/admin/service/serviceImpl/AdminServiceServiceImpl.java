package co.Nasa.prj.admin.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.AdminServiceMapper;
import co.Nasa.prj.admin.service.AdminServiceService;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.ServiceVO;

@Repository("adminServiceDao")
public class AdminServiceServiceImpl implements AdminServiceService {

	@Autowired
	AdminServiceMapper map;
	@Override
	public List<AdminAuthorVO> getServiceListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getServiceListWithPaging(cri);
	}
	@Override
	public int searchTotalService(Criteria cri) {
		// TODO Auto-generated method stub
		return map.searchTotalService(cri);
	}
	@Override
	public AdminAuthorVO detailedService(AdminAuthorVO vo) {
		// TODO Auto-generated method stub
		return map.detailedService(vo);
	}
	@Override
	public String totalPay(String code) {
		// TODO Auto-generated method stub
		return map.totalPay(code);
	}
	@Override
	public int totalReview(String code) {
		// TODO Auto-generated method stub
		return map.totalReview(code);
	}
	@Override
	public int totalService() {
		// TODO Auto-generated method stub
		return map.totalService();
	}
	@Override
	public int todayService() {
		// TODO Auto-generated method stub
		return map.todayService();
	}
	@Override
	public AdminAuthorVO promotionService(String code) {
		// TODO Auto-generated method stub
		return map.promotionService(code);
	}

	
}
