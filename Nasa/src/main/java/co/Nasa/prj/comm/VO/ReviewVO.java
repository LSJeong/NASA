package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class ReviewVO {
	String rev_code;
	String scode;
	String rev_name;
	String rev_sub;
	String rev_rate;
	String rev_id;
	String rev_ser_name;
	String rev_img;
	String rev_date;
	
	String rere_code;
	String review_code;
	String rere_sel_name;
	String rere_sel_id;
	String rere_sel_sub;
	String rere_date;
	

	String s_email;

	String b_img;
	String s_img;
	
	double rate;
	
	int start; // 쿼리에 쓸 start
	int end; // 위와 같음
	
	public void calcStartEnd(int pageNum, int amount) {
		setEnd(pageNum * amount);
		setStart(getEnd() - amount + 1);
	}

}
