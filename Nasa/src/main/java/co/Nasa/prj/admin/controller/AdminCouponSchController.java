package co.Nasa.prj.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import co.Nasa.prj.admin.service.AdminCouponMapper;

@Component
public class AdminCouponSchController {
	
	@Autowired
	AdminCouponMapper AdminDao;

	
	@Scheduled(cron = "0 0 3 1 * ?")
	// "0 0 3 1 * ?"  매월 1일 3시에 쿠폰 업데이트
	//00 03 1 * * 매월 1일 3시에
	// 0 * * * * * 1분마다
	public void test () {
		AdminDao.schcoupondelete();	//매달 1일 3시에 전체 사용자 쿠폰을 삭제
		
		AdminDao.schcouponupdate1(); //별등급 쿠폰 1 지급
		AdminDao.schcouponupdate2();	//달등급 쿠폰 2 지금
		AdminDao.schcouponupdate3();	//해등급 쿠폰 3지급
		AdminDao.schcouponupdate4();	//지구등급 쿠폰 4 지급
		
		System.out.println("dely 3000");
	}
	
	@Scheduled(cron = "0 0 2 1 * ?")
	public void gradeUpgrade() {
		AdminDao.schrankupdate();
	}
	
	@Scheduled(cron = "0 0 2 1 * ?")
	public void sellergradeUpgrade() {
		AdminDao.sellerschrankupdate();
	}

}
