package co.Nasa.prj;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.buyer.service.BuyerService;
import co.Nasa.prj.comm.VO.BuyerVO;
import co.Nasa.prj.comm.VO.PaymentVO;

import co.Nasa.prj.notice.service.NoticeService;

import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.comm.VO.ServiceVO;

import co.Nasa.prj.payment.service.PaymentService;
import co.Nasa.prj.powerservice.service.PowerServiceService;
import co.Nasa.prj.promotion.service.PromotionService;
import co.Nasa.prj.seller.service.SellerService;
import co.Nasa.prj.service.service.ServiceMapper;
import co.Nasa.prj.service.service.ServiceService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private PowerServiceService powerDao;

	@Autowired
	private PaymentService paymentDao;

	@Autowired
	private ServiceService serviceDao;

	@Autowired
	SellerService sellerDAO;

	@Autowired
	BuyerService BuyerDao;

	@Autowired
	NoticeService NoticeDao;
	
	@Autowired
	PromotionService promotionDao;

	@RequestMapping("/home.do")
	public String home(Model model, HttpSession session) {
		model.addAttribute("powerlist", powerDao.PowerServiceList());
		model.addAttribute("bestservicelist", serviceDao.bestServiceList());
		model.addAttribute("bestsellerlist", sellerDAO.bestSellerList());
		model.addAttribute("knowhowlist", NoticeDao.knowhowSelectList());
		model.addAttribute("rplist", serviceDao.randomPromotion());

		
		BuyerVO buyervo = new BuyerVO(); 
		String author = "";
		
		author = (String) session.getAttribute("author"); 
	
		if("B".equals(author)) {
			buyervo.setB_email((String) session.getAttribute("id")); 
			buyervo = BuyerDao.selectBuyer(buyervo);
			if(buyervo.getField_code() == "") {
				List<ServiceVO> recommendService = serviceDao.notBuyerRandomService();
				model.addAttribute("recommendService", recommendService);
				return "user/home";
			}
			List<ServiceVO> recommendService = serviceDao.randomSelectService(buyervo.getField_code());
			if(recommendService.size() < 1) {
				recommendService = serviceDao.notBuyerRandomService();
				model.addAttribute("recommendService", recommendService); 
			}
			model.addAttribute("recommendService", recommendService); 
		} else {
			List<ServiceVO> recommendService = serviceDao.notBuyerRandomService();
			model.addAttribute("recommendService", recommendService); 
		}
		

		return "user/home";
	}

	// 차트 그리기
	@RequestMapping(value = "/ajaxchartData.do")
	@ResponseBody
	public List<PaymentVO> ajaxChartpage(Model model) {
		List<PaymentVO> list = paymentDao.selectListChart();
		return list;
	}

	// 월별 누적판매금액 수수료
	@RequestMapping(value = "/ajaxsalesTable.do")
	@ResponseBody
	public List<Integer> ajaxsalesTable() {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 1; i < 13; i++) {
			list.addAll(paymentDao.selectpaymenttable(i));
		}
		return list;
	}

	// 월별 카운트
	@RequestMapping("/ajaxcountService.do")
	@ResponseBody
	public List<Integer> ajaxcountservice() {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 1; i < 13; i++) {
			list.addAll(paymentDao.countservice(i));
		}

		return list;
	}

	// 연도별 차트 그리기
	@RequestMapping("/ajaxyearChart.do")
	@ResponseBody
	public List<PaymentVO> ajaxyearChart(Model model) {
		List<PaymentVO> list = paymentDao.selectListYearChart();
		return list;
	}

	// 연도별 누적판매금액, 수수료 계산
	@RequestMapping("/selectYearchart.do")
	@ResponseBody
	public List<Integer> ajaxselectYearchart() {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 20; i < 24; i++) {
			list.addAll(paymentDao.selectYearchart(i));
		}
		System.out.println("리스트 찍어보자 |||||||||||||||||||||||||||" + list);
		return list;
	}

	// 연도별 카운트 조회
	@RequestMapping("/countYearChart.do")
	@ResponseBody
	public List<Integer> countYearChart() {

		List<Integer> list = new ArrayList<Integer>();
		for (int i = 20; i < 24; i++) {
			list.addAll(paymentDao.countYearChart(i));
		}
		System.out.println("카운트찍어보자 |||||||||||||||||||||||" + list);

		return list;
	}

//	// 채팅 결제
//	@RequestMapping("/chatpayment.do")
//	@ResponseBody
//	public int chatpayment(@RequestBody PaymentVO vo, HttpSession session) {
//
//		vo.setB_email((String) session.getAttribute("id"));
//		System.out.println("쿠폰 뭐라고 넘어오냐||||||||||||||||||" +vo.getPay_coupon() );
//
//
//		int res = 0;
//		if (res == 1) {
//			if (vo.getPay_coupon() == "coupon") {
//				paymentDao.insertchatpayment(vo);
//			} else {
//				paymentDao.updateChaypayment(vo);
//				paymentDao.insertchatpayment(vo);
//			}
//			System.out.println("성공적으로 인설트됨!!!!!!!!!");
//			System.out.println("결과한번보자|||||||||||||||||" + res);
//
//		}
//
//		return res;
//	}
	
	// 채팅 결제
	@RequestMapping("/chatpayment.do")
	@ResponseBody
	public int chatpayment(@RequestBody PaymentVO vo, HttpSession session) {

		vo.setB_email((String) session.getAttribute("id"));
		int res = paymentDao.insertchatpayment(vo);
		if(vo.getPay_coupon().equals("coupon")) {
			if (res == 1) {
				System.out.println("성공적으로 인설트됨!!!!!!!!!");
				System.out.println("결과한번보자|||||||||||||||||" + res);
		}
		}else {
			paymentDao.insertchatpayment(vo);
			paymentDao.updateChaypayment(vo);
			System.out.println("쿠폰들어와서 업데이트 시킴");
			
		}
		return res;

	}

	// 서비스 코드 체크
	@ResponseBody
	@RequestMapping("/sercodecheck.do")
	public ServiceVO sercodecheck(@RequestParam("servicecode") String servicecode) {
		System.out.println("sercodecheck.do");
		ServiceVO vo = new ServiceVO();
		vo.setS_code(servicecode);
		vo = serviceDao.serviceSelect(servicecode);
//		vo.getSer_price();
		return vo;
	}

	// 로그인 구매자 등급 가져오기
	@RequestMapping("/sellerIdcheck.do")
	@ResponseBody
	public String sellerIdcheck(Model model, HttpSession session) {
		// SellerVO vo = new SellerVO();
		// vo = sellerDAO.SellerSelect(sellerid);
		// model.addAttribute("sellerinfo",sellerDAO.SellerSelect(sellerid));
		// System.out.println(vo);
		BuyerVO bvo = new BuyerVO();
		bvo.setB_email((String) session.getAttribute("id"));
		bvo = BuyerDao.selectBuyer(bvo);
		// model.addAttribute("buyerinfo",BuyerDao.selectBuyer(bvo));

		JSONObject object = new JSONObject();
		object.put("coupon", bvo.getBuyer_coupon());
		String result = object.toJSONString();
		System.out.println("바이어쿠폰||||||||||||||||||" + result);

		return result;
	}

	// 판매자 등급 가져오기
	@ResponseBody
	@RequestMapping("/selrankcheck.do")
	public SellerVO selrankcheck(@RequestParam("sellerid") String sellerid) {
		SellerVO vo = new SellerVO();
		vo.setS_email(sellerid);
		vo = sellerDAO.ChatSellerselect(vo);
		System.out.println("판매자등급 찍어보기 ||||||||||||||||||" + vo);

		return vo;
	}

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
//   @RequestMapping(value = "/home.do", method = RequestMethod.GET)
//   public String home(Locale locale, Model model) {
//      logger.info("Welcome home! The client locale is {}.", locale);
//      
//      Date date = new Date();
//      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//      
//      String formattedDate = dateFormat.format(date);
//      
//      model.addAttribute("serverTime", formattedDate );
//      
//      return "home";
//   }

}