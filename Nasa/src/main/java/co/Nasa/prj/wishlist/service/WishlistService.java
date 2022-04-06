package co.Nasa.prj.wishlist.service;

import java.util.List;

import co.Nasa.prj.comm.VO.WishlistVO;

public interface WishlistService {
	// 구매자 위시리스트 조회
	public List<WishlistVO> selectBuyerWishlist(WishlistVO vo);
	
	// 위시리스트 제거
	public int deleteWishlist(WishlistVO vo);
	
	// total 에 쓸 것 카운트
	public int countPagingWishlist(WishlistVO vo);
	
	// paging 할 위시리스트
	List<WishlistVO> selectPagingWishlist(WishlistVO vo);
	// insert wishlist
	public int insertWishlist(WishlistVO vo);
}
