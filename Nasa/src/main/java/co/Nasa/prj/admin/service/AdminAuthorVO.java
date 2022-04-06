package co.Nasa.prj.admin.service;

import lombok.Data;

@Data
public class AdminAuthorVO {
	
	//buyer 구매자
	String b_email;
	String b_rank;
	String b_password;
	String b_nickname;
	String b_tel;
	String b_address;
	String b_zipcode;
	String b_detailaddress;
	String b_author;
	String b_img;
	String b_status;
	String b_date;
	String b_report;
	String token;
	String filed_code;
	String buyer_coupon;
	String b_name;
	String field_code;
	
	//판매자
	
	String s_rank;
	String s_password;
	String s_nickname;
	String s_tel;
	String s_address;
	String s_zipcode;
	String s_detailaddress;
	String s_author;
	String s_img; // 프로필 사진
	String s_business;
	String s_status;
	String s_date;
	int s_report;
	String s_school;
	String s_major;
	String s_grad; // 졸업상태
	String s_carrer;
	String s_me; // 자기소개
	String s_name;
	
	//payment 결제내역
	String pay_code; //결제내역
	
	
	String s_email; //판매자id
	String s_code; //서비스코드
	String pay_date;
	String pay_cate; //카테고리1
	String pay_cate1; //카테고리2
	String pay_type;
	String pay_coupon;
	String pay_price;
	String pay_enddate; //구매확정날짜
	String event_start; //서비스 일정 시작
	String event_end; //서비스 일정 끝
	
	
	//서비스
	String ser_code;
	String pro_code;
	
	String ser_start;
	String ser_end;
	String ser_title;
	String ser_sub;
	String ser_cate;
	String ser_sub_cate;
	String ser_price;
	String ser_sale;
	String filecode;
	String ser_img;
	String ser_offer;
	String ser_macro;
	String ser_line;
	String ser_skill;
	String ser_team;
	String ser_lang;
	String ser_frame;
	String ser_dbms;
	String ser_subimg;
	String ser_subimg2;
	String ser_subimg3;
	
	
	//파워서비스
	String power_code;
	String power_start;
	String power_end;
	String power_service;
	String power_date;
	String power_price;
	
	//신고
	String re_code; // report code
	String re_type;
	String re_subject; // 신고 내용
	String re_result;
	String re_reporter; // 신고자 id
	String re_res; // 피신고자 id
	String re_date;
	
	//카테고리
	String cat_no;
	String cat_name;
	
	String sub_no;
	String sub_name;
	
	String total_price;
	String pay_date2;
	
	//판매자 노하우
	String no_code;
	String no_id;
	String no_title;
	String no_subject;
	String no_date;
	String no_status;
	String no_img;
	String no_originimg;
	
	
	String email;
	String gb;
	String name;
	String status;
	String report;
	String blackdate;
	String nickname;
	String rank;
	String joindate;
	
	String pro_status;
	String prodiscount;
	String ser_sale_com;
	String pro_start;
	String pro_end;
	
	int start; // 쿼리에 쓸 start
	int end; 
	
	public void calcStartEnd(int pageNum, int amount) {
		setEnd(pageNum * amount);
		setStart(getEnd() - amount + 1);
	}
}
