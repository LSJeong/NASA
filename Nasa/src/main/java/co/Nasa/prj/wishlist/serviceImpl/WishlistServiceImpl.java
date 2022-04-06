package co.Nasa.prj.wishlist.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import co.Nasa.prj.comm.VO.WishlistVO;
import co.Nasa.prj.wishlist.service.WishlistMapper;
import co.Nasa.prj.wishlist.service.WishlistService;

public class WishlistServiceImpl implements WishlistService {
	@Autowired WishlistMapper map;

	@Override
	public List<WishlistVO> selectBuyerWishlist(WishlistVO vo) {
		return map.selectBuyerWishlist(vo);
	}

	@Override
	public int deleteWishlist(WishlistVO vo) {
		return map.deleteWishlist(vo);
	}

	@Override
	public int countPagingWishlist(WishlistVO vo) {
		return map.countPagingWishlist(vo);
	}

	@Override
	public List<WishlistVO> selectPagingWishlist(WishlistVO vo) {
		return map.selectPagingWishlist(vo);
	}

	//위시리스트 확인 해야함 이거뭔지????
	@Override
	public int insertWishlist(WishlistVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
