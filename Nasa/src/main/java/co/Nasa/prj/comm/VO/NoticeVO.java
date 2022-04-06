package co.Nasa.prj.comm.VO;

import lombok.Data;


@Data
public class NoticeVO {
	String no_code;
	String no_id;
	String no_title;
	String no_subject;
	String no_date;
	String filecode;
	String no_status;
	String no_img;
	String no_originimg;
	
	String s_nickname;
	
	// 페이징
	int start;
	int end;
	
	public void calcStartEnd(int pageNum, int amount) {
		setEnd(pageNum * amount);
		setStart(getEnd() - amount + 1);
	}
}
