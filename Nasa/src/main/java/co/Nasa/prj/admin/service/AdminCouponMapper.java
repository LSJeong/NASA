package co.Nasa.prj.admin.service;

public interface AdminCouponMapper {

	public int schcouponupdate1();
	public int schcouponupdate2();
	public int schcouponupdate3();
	public int schcouponupdate4();
	public int schcoupondelete();
	
	// 매월 1일 구매자 등급 업데이트
	public int schrankupdate();
	
	// 매월 1일 판매자 등급 업데이트
	public int sellerschrankupdate();
}
