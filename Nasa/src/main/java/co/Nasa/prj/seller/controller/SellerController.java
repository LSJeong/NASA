package co.Nasa.prj.seller.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.Nasa.prj.comm.VO.PagingDTO;
import co.Nasa.prj.comm.VO.PaymentVO;
import co.Nasa.prj.comm.VO.ReviewVO;
import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.comm.VO.ServiceVO;
import co.Nasa.prj.comm.VO.WishlistVO;
import co.Nasa.prj.payment.service.PaymentMapper;
import co.Nasa.prj.review.service.ReviewMapper;
import co.Nasa.prj.seller.service.SellerService;
import co.Nasa.prj.service.service.ServiceService;
import co.Nasa.prj.wishlist.service.WishlistMapper;

@Controller
public class SellerController {

	@Autowired
	SellerService sellerDAO;
	@Autowired
	ServiceService serviceDao;
	@Autowired
	PaymentMapper paymentDao;
	@Autowired
	WishlistMapper wishlistDao;
	@Autowired
	ReviewMapper reviewDao;
	
	@Value("#{upload['profileupload']}")
	private String profileupload;

	@RequestMapping("/goSellerMypage.do")
	public String goSellerMypage(HttpSession session, Model model) {
		model.addAttribute("sellerInfo", sellerDAO.SellerSelect((String) session.getAttribute("id")));
		model.addAttribute("rank", sellerDAO.sellerRank((String) session.getAttribute("id")));
		return "seller/sellerMypage";
	}

	@RequestMapping("/sellerSales.do")
	public String sellerSales(Model model, HttpSession session) {
		ServiceVO vo = new ServiceVO();
		vo.setS_email((String) session.getAttribute("id"));
		model.addAttribute("serviceList", serviceDao.serviceSelectList(vo));
		model.addAttribute("seller", sellerDAO.SellerSelect((String) session.getAttribute("id")));
		return "seller/sellerSales";
	}

	// 판매자 회원가입 유형 선택
	@RequestMapping("/sellerJoin.do")
	public String sellerJoin() {
		return "seller/sellerJoin";
	}

	// 개인 판매자 회원가입
	@RequestMapping("/sellerPersonjoin.do")
	public String sellerPersonjoin() {
		return "seller/sellerPersonjoin";
	}

	// 기업 판매자 회원가입
	@RequestMapping("/sellerCompanyjoin.do")
	public String sellerCompanyjoin() {
		return "seller/sellerCompanyjoin";
	}

	@RequestMapping("/serviceInsert.do")
	public String serviceInsert() {
		return "seller/serviceInsert";
	}

	@RequestMapping("/knowhowInsertForm.do")
	public String knowhowInsertForm() {
		return "seller/knowhowInsert";
	}

//	@RequestMapping("/knowhowInsert.do")
//	public String knowhowInsert() {
//
//		return "seller/knowhowInsert";
//	}

	@RequestMapping("/sellerDetail.do")
	public String sellerDetail(Model model, @RequestParam("s_email") String s_email, HttpSession session, PagingDTO pagingdto, String pagestatus) {
		model.addAttribute("sellerInfo", sellerDAO.SellerSelect(s_email));
		ServiceVO vo = new ServiceVO();
		String w = "no";
		vo.setS_email(s_email);
		if("B".equals((String)session.getAttribute("author"))) {
			WishlistVO wishlistvo = new WishlistVO();
			wishlistvo.setB_id((String)session.getAttribute("id"));
			List<WishlistVO> wishlist = wishlistDao.selectBuyerWishlist(wishlistvo);
			for(int i = 0; i < wishlist.size(); i++) {
				if(wishlist.get(i).getS_id().equals(s_email)) {
					w = "exist";
				}
			}
		}
		ReviewVO reviewvo = new ReviewVO();
		reviewvo.setS_email(s_email);
		int cntReviews = reviewDao.countAllSellerDetailReview(reviewvo);
		model.addAttribute("cntReviews", cntReviews);
		
		reviewvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<ReviewVO> reviewList = reviewDao.sellerDetailReview(reviewvo);
		model.addAttribute("reviewList", reviewList);
		pagingdto.setTotal(cntReviews);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
		if("r".equals(pagestatus)) {
			model.addAttribute("tabcode", pagestatus);
		}
		model.addAttribute("wish", w);
		model.addAttribute("serviceList", serviceDao.sellerDetailService(vo));
		return "seller/sellerDetail";
	}
	
	@RequestMapping("/deleteSeller.do")
	@ResponseBody
	public String deleteSeller(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, @Param("dPassword") String dPassword, BCryptPasswordEncoder passwordEncoder) {
		String deleteStatus = "codeD";
		
		PaymentVO paymentvo = new PaymentVO();
		SellerVO sellervo = new SellerVO();
		
		paymentvo.setS_email((String) session.getAttribute("id"));
		sellervo.setS_email((String) session.getAttribute("id"));
		
		List<PaymentVO> paymentDList = paymentDao.sellerPaymentDList(paymentvo);
		sellervo = sellerDAO.ChatSellerselect(sellervo);
		
		if(!passwordEncoder.matches(dPassword, sellervo.getS_password())) {
			System.out.println(sellervo.getS_password());
			deleteStatus = "codeP";
			return deleteStatus;
		}
		
		for(int i = 0; i < paymentDList.size(); i++) {
			if(paymentDList.get(i).getPay_enddate() == null) {
				deleteStatus = "codeS";
				return deleteStatus;
			}
		}
		
		sellerDAO.deleteSeller(sellervo);
		
		return deleteStatus;
	}

	@RequestMapping("/sellerUpdate.do")
	public String sellerUpdate(Model model, HttpSession session) {
		model.addAttribute("sellerInfo", sellerDAO.SellerSelect((String) session.getAttribute("id")));
		return "seller/sellerUpdate";
	}

	@RequestMapping("/sellerCalendar.do")
	public String sellerCalendar() {
		return "seller/sellerCalendar";
	}

	// 판매자 닉네임 중복 체크
	@RequestMapping("/ajaxnickCheck.do")
	@ResponseBody
	public String ajaxnickCheck(@Param("s_nickname") String s_nickname, SellerVO vo) {
		vo.setS_nickname(s_nickname);
		int n = sellerDAO.SellerNicknameCheck(vo);
		String result;
		if (n == 0) {
			result = "T";
		} else {
			result = "F";
		}
		System.out.println(vo.getS_nickname());
		return result;
	}

	// 판매자 이메일 중복 체크
	@RequestMapping("/ajaxemailCheck.do")
	@ResponseBody
	public String ajaxemailCheck(@Param("s_email") String s_email, SellerVO vo) {
		vo.setS_email(s_email);
		int n = sellerDAO.SellerEmailCheck(vo);
		String result;
		if (n == 0) {
			result = "T";
		} else {
			result = "F";
		}
		System.out.println("확인" + vo.getS_email());
		return result;
	}

	// 판매자 이메일 인증
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/ajaxemailSend.do")
	@ResponseBody
	public String ajaxSPemailSend(@Param("s_email") String s_email) throws Exception {
		int serti = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);
		String from = "admin@nasa.com";
		String to = s_email;
		String title = "NASA 회원가입 인증번호 입니다.";
		String content = "[인증번호] " + serti + " 입니다.";
		String num = "";
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);

			mailSender.send(mail);
			num = Integer.toString(serti);
		} catch (Exception e) {
			num = "error";
		}
		return num;
	}

	// 개인 판매자 회원 가입
	@RequestMapping("/ajaxSPjoin.do")
	@ResponseBody
	public String ajaxSPjoin(SellerVO vo,BCryptPasswordEncoder passwordEncoder) {
		vo.setS_author("개인");
		String encodedPassword = passwordEncoder.encode(vo.getS_password());
		vo.setS_password(encodedPassword);
		System.out.println(vo.toString());
		int n = sellerDAO.SellerInsert(vo);
		String result = "F";
		if (n != 0) {
			result = "T";
		}
		return result;
	}

	// 기업 판매자 회원 가입
	@RequestMapping("/ajaxSCjoin.do")
	@ResponseBody
	public String ajaxSCjoin(SellerVO vo,BCryptPasswordEncoder passwordEncoder) {
		vo.setS_author("기업");
		String encodedPassword = passwordEncoder.encode(vo.getS_password());
		vo.setS_password(encodedPassword);

		System.out.println(vo.toString());
		int n = sellerDAO.SellerInsert(vo);
		String result = "F";
		if (n != 0) {
			result = "T";
		}
		return result;
	}

	// 판매자 회원 가입 - 추가정보 등록
	@RequestMapping("/ajaxjoinUpdate.do")
	@ResponseBody
	public String ajaxSPjoinUpdate(SellerVO vo, MultipartFile imgupload) {
		System.out.println("***이메일*** : " + vo.getS_email());
		System.out.println("***확인하기*** : " + vo.toString());

		// img upload
		String originalFileName = imgupload.getOriginalFilename();
		String saveurl = profileupload;
//		String saveurl = "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\resources\\user\\assets\\img\\profile\\";
		String savepath = saveurl + originalFileName;
		System.out.println(savepath);

//		String img = "resources/user/assets/img/profile/" + originalFileName;
		String img = "/upload/profile/" + originalFileName;
		vo.setS_img(img);
		System.out.println("***이미지*** : " + vo.getS_img());

		try {
			imgupload.transferTo(new File(savepath));

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int n = sellerDAO.SellerUpdate(vo);
		String result = "F";
		if (n != 0) {
			result = "T";
		}
		return result;
	}

	// 판매자 전체프로필 수정
	@ResponseBody
	@RequestMapping("/SellerProfileUpdate.do")
	public String SellerProfileUpdate(SellerVO vo, MultipartFile imgupload, HttpSession session,
			@RequestParam("pwCheck") String pwCheck, BCryptPasswordEncoder passwordEncoder) {
		System.out.println("=============" + imgupload.getOriginalFilename());
		System.out.println(pwCheck);
		vo.setS_email((String) session.getAttribute("id"));

		SellerVO svo = new SellerVO();
		svo = sellerDAO.SellerSelect((String) session.getAttribute("id"));
		
		String beforimg = svo.getS_img();

		if (pwCheck.equals("basic")) {
			vo.setS_password(svo.getS_password());
		}else {
			String encodedPassword = passwordEncoder.encode(vo.getS_password());
			vo.setS_password(encodedPassword);
		}

		String originalFileName = imgupload.getOriginalFilename();
		if (originalFileName.equals("")) {
			vo.setS_img(beforimg);
		} else {
			String saveurl = profileupload;
			String savepath = saveurl + originalFileName;
			System.out.println(savepath);

			String b_img = "/upload/profile/" + originalFileName;

			vo.setS_img(b_img);

			try {
				imgupload.transferTo(new File(savepath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		int n = sellerDAO.SellerProfileUpdate(vo);
		if (n != 1) {
			return "F";
		}
		return "T";
	}

}