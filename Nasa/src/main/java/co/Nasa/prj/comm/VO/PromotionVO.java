package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class PromotionVO {
	String pro_code; // promotion code
	String s_email; // seller id/email
	String prodiscount; // 할인률
	String pro_start;
	String pro_end;
	String pro_service;
	String pro_status;
	
	String ser_title;
	String ser_img;
	String ser_status;
	String ser_start;
	String ser_end;
	
	// 페이징
	int start;
	int end;
	
	public void calcStartEnd(int pageNum, int amount) {
		setEnd(pageNum * amount);
		setStart(getEnd() - amount + 1);
	}
}
