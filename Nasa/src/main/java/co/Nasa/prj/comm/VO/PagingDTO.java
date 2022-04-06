package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class PagingDTO {
	private int startPage; // 시작 페이지
	private int endPage; // 종료 페이지
	private boolean prev, next; // 앞 뒤 버튼 -> boolean인 이유 : true false로 페이지 내에서 버튼 표시할지 안할지 판단 
	
	private int total; // 표현해야할 항목 갯수
	private int pageNum = 1; // 표시할 페이지. 기본값으로 1을 줘서 처음에 0이 들어오지 않게 함.
	private int amount = 10; // 한 페이지 내에 표시할 갯수 지정. 만약에 변경하고 싶으면 컨트롤러에서 setamount 해주기.
	
	// buyercontroller -> wishlist.do / wishlist.jsp 에 적용돼있음.
	
	
	public void setTotal(int total) {
		this.pageNum = getPageNum();
		System.out.println("total pagenum : " + this.pageNum);
		this.total=total;
		this.endPage = (int)(Math.ceil(this.pageNum/10.0))*10;
		this.startPage  = this.endPage-9;
		int realEnd = (int)Math.ceil(this.total/(double)this.amount);
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
	
	public PagingDTO() {}
	
	public PagingDTO(int total, int page) {
		this.pageNum= page;
		System.out.println("dto pageNum = " + this.pageNum);
		
		this.amount= getAmount();
		this.total=total;
		
		this.endPage = (int)(Math.ceil(this.pageNum/10.0))*10;
		this.startPage  = this.endPage-9;
		int realEnd = (int)Math.ceil(this.total/(double)this.amount);
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
		if(startPage < 0) {
			this.startPage = 1;
		}
	}
	
	// 노하우용
	public PagingDTO(int total, int page, int amount) {
		this.pageNum= page;
		System.out.println("dto pageNum = " + this.pageNum);
		
		this.amount= amount;
		this.total=total;
		
		this.endPage = (int)(Math.ceil(this.pageNum/10.0))*10;
		this.startPage  = this.endPage-9;
		int realEnd = (int)Math.ceil(this.total/(double)this.amount);
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
		if(startPage < 0) {
			this.startPage = 1;
		}
	}
}
