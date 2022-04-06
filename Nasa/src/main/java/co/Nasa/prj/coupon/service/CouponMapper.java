package co.Nasa.prj.coupon.service;

import co.Nasa.prj.comm.VO.CouponVO;

public interface CouponMapper {
	// 구매자 쿠폰 조회
	CouponVO buyerCouponSelect(CouponVO vo);
	
	
}
