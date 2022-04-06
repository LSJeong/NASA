package co.Nasa.prj.wishlist.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.comm.VO.WishlistVO;
import co.Nasa.prj.seller.service.SellerMapper;
import co.Nasa.prj.wishlist.service.WishlistMapper;

@Controller
public class WishlistController {
	@Autowired WishlistMapper wishlistDao;
	@Autowired SellerMapper sellerDao;
	
	@RequestMapping("/wishlistDelete.do")
	@ResponseBody
	public String wishlistDelete(WishlistVO vo) {
		wishlistDao.deleteWishlist(vo);
		return "d";
	}
	
	@RequestMapping("/insertWishlist.do")
	public void insertWishlist(WishlistVO vo) {
		wishlistDao.insertWishlist(vo);
	}
	
	@RequestMapping("/wishplus.do")
	@ResponseBody
	public String wishplus(String nickname, HttpSession session) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + nickname);
		WishlistVO wishlistvo = new WishlistVO();
		SellerVO sellervo = new SellerVO();
		String wsid = "";
		
		wishlistvo.setB_id((String) session.getAttribute("id"));
		
		List<WishlistVO> wishlist = wishlistDao.selectBuyerWishlist(wishlistvo);
		List<SellerVO> sellerlist = sellerDao.selectSellerList();
		
		for(int i = 0; i < sellerlist.size(); i++) {
			if(sellerlist.get(i).getS_nickname().equals(nickname)) {
				wsid = sellerlist.get(i).getS_email();
			}
		}
		
		if(wishlist.size() == 0) {
			wishlistvo.setS_id(wsid);
			wishlistDao.insertWishlist(wishlistvo);
			return "plus";
		}
		
		if(wishlist.size() != 0) {
			for(int i = 0; i < wishlist.size(); i++) {
				if(wishlist.get(i).getS_id().equals(wsid)) {
					System.out.println("!!!!!!!!!!!!이미 있음!!!!!!!!!!!!");
					return "plus";
				}
			}
		}
		
		wishlistvo.setS_id(wsid);
		wishlistDao.insertWishlist(wishlistvo);
		
		return "plus";
	}
	
	@RequestMapping("/wishminus.do")
	@ResponseBody
	public String wishminus(String nickname, HttpSession session) {
		WishlistVO wishlistvo = new WishlistVO();
		String wsid = "";
		
		List<SellerVO> sellerlist = sellerDao.selectSellerList();
		
		for(int i = 0; i < sellerlist.size(); i++) {
			if(sellerlist.get(i).getS_nickname().equals(nickname)) {
				wsid = sellerlist.get(i).getS_email();
			}
		}
		
		wishlistvo.setB_id((String) session.getAttribute("id"));
		wishlistvo.setS_id(wsid);
		wishlistDao.deleteWishlist(wishlistvo);
		
		return "minus";
	}
}
