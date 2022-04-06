package co.Nasa.prj.comm.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class ServiceVO {
	String ser_code;
	String pro_code;
	String s_email;
	Date ser_start;
	String ser_title;
	String ser_sub;
	String ser_cate;
	String ser_sub_cate;
	int ser_price;
	int ser_sale;
	String ser_date;
	String ser_img;
	String ser_offer;
	String ser_imgorigin;
	String ser_line;
	String ser_skill;
	String ser_team;
	String ser_lang;
	String ser_frame;
	String ser_dbms;
	String ser_subimg;
	String ser_subimg2;
	String ser_subimg3;
	String ser_originsub;
	String ser_originsub2;
	String ser_originsub3;
	String ser_status;
	String ser_reason;
	String ser_end;	
	
	// v_service_list
	String nickname;
	String category;
	String sub_category;
	String ser_price_com;
	String pro_status;
	String ser_sale_com;
	Date ser_ent;
	int reviewcount;
	int reviewavg;
	
	String column; // 리뷰 순, 등록 순 정렬
	
	String s_code;
	String pay_enddate;
	
	String pay_max;
	String pro_start;
	String pro_end;
	String prodiscount;
	String pro_max;
	String power_max;
	
	String scode;
	
	// 페이징
	int start;
	int end;
	
	public void calcStartEnd(int pageNum, int amount) {
		setEnd(pageNum * amount);
		setStart(getEnd() - amount + 1);
	}

	String cat_name;
	String sub_name;
	String s_nickname;

}
