package co.Nasa.prj.coupon.service;

import java.util.List;

import co.Nasa.prj.comm.VO.CouponVO;

public interface CouponService {
	// 구매자 쿠폰 조회
	CouponVO buyerCouponSelect(CouponVO vo);
}
