package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class PowerServiceVO {
	String power_code;
	String s_email;
	String ser_code;
	String power_start;
	String power_end;
	String power_date;
	String power_price;

	String s_nickname;
	String s_img;
	String ser_title;
	String ser_img;
	String ser_price;
	String cat_name;
	String sub_name;
	String ser_line;
	
	int reviewcount;
	int reviewavg;
	
	// 페이징
	int start;
	int end;
	
	public void calcStartEnd(int pageNum, int amount) {
		setEnd(pageNum * amount);
		setStart(getEnd() - amount + 1);
	}
}
