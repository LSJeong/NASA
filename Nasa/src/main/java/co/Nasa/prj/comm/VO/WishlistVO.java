package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class WishlistVO {
	String s_id;
	String b_id;
	String wish_date;
	int start; // 쿼리에 쓸 start
	int end; // 위와 같음
	
	public void calcStartEnd(int pageNum, int amount) {
		setEnd(pageNum * amount);
		setStart(getEnd() - amount + 1);
	}
}
