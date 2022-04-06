package co.Nasa.prj.admin.service;

import lombok.Data;

@Data
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private int pageNum;
	private int amount;
	
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.pageNum=cri.getPageNum();
		this.amount=cri.getAmount();
		this.cri = cri;
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
}
