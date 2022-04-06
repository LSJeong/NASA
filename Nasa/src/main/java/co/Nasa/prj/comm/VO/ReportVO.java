package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class ReportVO {
	String re_code; // report code
	String re_type;
	String re_subject; // 신고 내용
	String re_result;
	String filecode; // 첨부파일 id
	String re_reporter; // 신고자 id
	String re_res; // 피신고자 id
	String re_date;
	String re_date2;
	String re_rpoertdate; //신고처리날짜
	String re_denied; //반려사유
	
	
	String email; 
	String gb; //s인지 b인지 구매자판매자 구분
	int report; //신고횟수
	
	int start; // 쿼리에 쓸 start
	int end; // 위와 같음
	
	public void calcStartEnd(int pageNum, int amount) {
		setEnd(pageNum * amount);
		setStart(getEnd() - amount + 1);
	}
}
