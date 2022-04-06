package co.Nasa.prj.coupon.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import co.Nasa.prj.comm.VO.CouponVO;
import co.Nasa.prj.coupon.service.CouponMapper;
import co.Nasa.prj.coupon.service.CouponService;

public class CouponServiceImpl implements CouponService {
	@Autowired CouponMapper map;

	@Override
	public CouponVO buyerCouponSelect(CouponVO vo) {
		return map.buyerCouponSelect(vo);
	}

}
