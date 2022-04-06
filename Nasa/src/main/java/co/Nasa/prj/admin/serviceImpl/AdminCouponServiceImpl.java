package co.Nasa.prj.admin.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.service.AdminCouponMapper;
import co.Nasa.prj.admin.service.AdminCouponService;


@Repository("AdminCouponDao")
public class AdminCouponServiceImpl implements AdminCouponService {
	
	@Autowired
	AdminCouponMapper map;

	@Override
	public int schcouponupdate1() {
		// TODO Auto-generated method stub
		return map.schcouponupdate1();
	}

	@Override
	public int schcouponupdate2() {
		// TODO Auto-generated method stub
		return map.schcouponupdate2();
	}

	@Override
	public int schcouponupdate3() {
		// TODO Auto-generated method stub
		return map.schcouponupdate3();
	}

	@Override
	public int schcouponupdate4() {
		// TODO Auto-generated method stub
		return map.schcouponupdate4();
	}

	@Override
	public int schcoupondelete() {
		// TODO Auto-generated method stub
		return map.schcoupondelete();
	}

	@Override
	public int sellerschrankupdate() {
		// TODO Auto-generated method stub
		return map.sellerschrankupdate();
	}

}
