package co.Nasa.prj.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.comm.VO.ServiceVO;
import co.Nasa.prj.service.service.ServiceMapper;
import co.Nasa.prj.service.service.ServiceService;

@Repository("serviceDao")
public class ServiceServiceImpl implements ServiceService {
	@Autowired
	private ServiceMapper map;

	@Override
	public int serviceInsert(ServiceVO vo) {
		return map.serviceInsert(vo);
	}

	@Override
	public List<ServiceVO> serviceList() {
		return map.serviceList();
	}

	@Override
	public ServiceVO serviceSelect(String ser_code) {
		return map.serviceSelect(ser_code);
	}

	@Override
	public int serviceUpdate(ServiceVO vo) {
		return map.serviceUpdate(vo);
	}

	@Override
	public List<ServiceVO> serviceSelectList(ServiceVO vo) {
		return map.serviceSelectList(vo);
	}

	@Override
	public List<ServiceVO> serviceMaxEnddateList(String s_email) {
		return map.serviceMaxEnddateList(s_email);
	}

	@Override
	public int endService(ServiceVO vo) {
		return map.endService(vo);
	}

	@Override
	public ServiceVO serviceSelectMaxEnd(ServiceVO vo) {
		return map.serviceSelectMaxEnd(vo);
	}

	@Override
	public int schEndDateCheck() {
		return map.schEndDateCheck();
	}

	@Override
	public List<ServiceVO> servicePromotion(ServiceVO vo) {
		return map.servicePromotion(vo);
	}
	
	@Override
	public List<ServiceVO> homeCategorySelect(ServiceVO vo) {
		return map.homeCategorySelect(vo);
	}	

	@Override
	public List<ServiceVO> bestServiceList() {
		return map.bestServiceList();
	}

	@Override
	public List<ServiceVO> homeCategorySelectAll(ServiceVO vo) {
		return map.homeCategorySelectAll(vo);
	}

	@Override
	public int homeCategorySelectAllCount(ServiceVO vo) {
		return map.homeCategorySelectAllCount(vo);
	}

	@Override
	public int homeCategorySelectCount(ServiceVO vo) {
		return map.homeCategorySelectCount(vo);
	}


	@Override
	public List<ServiceVO> randomSelectService(String ser_sub_cate) {
		return map.randomSelectService(ser_sub_cate);
	}

	@Override
	public List<ServiceVO> notBuyerRandomService() {
		return map.notBuyerRandomService();
	}

	@Override
	public List<ServiceVO> sellerMainServiceList(ServiceVO vo) {
		return map.sellerMainServiceList(vo);
	}

	@Override
	public int countPagingSellerService(ServiceVO vo) {
		return map.countPagingSellerService(vo);
	}

	@Override
	public List<ServiceVO> sellerMainServiceListY(ServiceVO vo) {
		return map.sellerMainServiceListY(vo);
	}

	@Override
	public int countPagingSellerServiceY(ServiceVO vo) {
		return map.countPagingSellerServiceY(vo);
	}

	@Override
	public List<ServiceVO> sellerMainServiceListU(ServiceVO vo) {
		return map.sellerMainServiceListU(vo);
	}

	@Override
	public int countPagingSellerServiceU(ServiceVO vo) {
		return map.countPagingSellerServiceU(vo);
	}

	@Override
	public int DirectendService(ServiceVO vo) {
		return map.DirectendService(vo);
	}

	@Override
	public List<ServiceVO> randomPromotion() {
		return map.randomPromotion();
	}

	@Override
	public List<ServiceVO> sellerDetailService(ServiceVO vo) {
		return map.sellerDetailService(vo);
	}


}
