package co.Nasa.prj.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.Nasa.prj.admin.service.AdminCouponMapper;
import co.Nasa.prj.admin.service.AdminCouponService;
import co.Nasa.prj.chatting.controller.ChatSession;
import co.Nasa.prj.comm.VO.AdminVO;
import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.login.service.BuyerJoinMapper;
import co.Nasa.prj.login.service.LoginService;
import co.Nasa.prj.login.service.LoginVO;
import co.Nasa.prj.login.service.NaverLoginBO;

@SessionAttributes({ "loginUser", "master2", "rankPic", "Loginvo", "avo", "svo" })
@Controller
public class AhController {
	
	static Logger logger = Logger.getLogger("co.Nasa.prj.login.controller.AhController");
	@Autowired
	private ChatSession cSession;
	@Autowired
	BuyerJoinMapper buyerJoinDao;
	@Autowired
	private LoginService LoginDao;
	@Autowired
	AdminCouponService AdminCouponDao;
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping(value = "/join.do")
	public String join(Model model) {
		// dbTest
		model.addAttribute("Hosts", LoginDao.selectListbuyer());

		return "user/Login";
	}

	@RequestMapping("/Login.do")
	public String login(Model model, HttpSession session) {
		System.out.println("login페이지접속");
		logger.info("debug - login");
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		return "user/Login";
	}

	// 로그인 체크
	@RequestMapping("/main.do")
	public String main(LoginVO Loginvo, AdminVO avo, SellerVO svo, HttpServletResponse response, HttpSession session,
			@RequestParam("id") String id, @RequestParam("pw") String password, Model model,
			BCryptPasswordEncoder passwordEncoder
			) throws IOException {
		logger.info("debug - login");
		String path = "";
		
		Loginvo = new LoginVO();
		Loginvo.setB_email(id);
		Loginvo = LoginDao.selectbuyer(Loginvo);
		
		if(Loginvo == null) {
			svo = new SellerVO();
			svo.setS_email(id);
			svo = LoginDao.selectseller(svo);
			if(svo == null ) {
				avo = new AdminVO();
				avo.setAid(id);
				avo = LoginDao.selectadmin(avo);
				if(avo != null) {
					if(password.equals("1234")) {
						session.setAttribute("id", avo.getAid());
						session.setAttribute("password", avo.getApassword());
						session.setAttribute("aname", avo.getAname());
						session.setAttribute("author", "ad");
						session.setAttribute("nickname", "관리자");
						System.out.println("관리자");
						path = "redirect:home.do";
						
					}else {
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.print("<script>alert('비밀번호를 확인해주세요.');</script>");
						out.flush();
						return "user/Login";
					}
				}
				
			}else {
				if(passwordEncoder.matches(password, svo.getS_password())) {
					session.setAttribute("id", svo.getS_email());
					session.setAttribute("password", svo.getS_password());
					session.setAttribute("status", svo.getS_status());
					session.setAttribute("nickname", svo.getS_nickname());
					session.setAttribute("author", "S");
					cSession.addLoginUser(svo.getS_email());
					System.out.println("판매자");
					path = "redirect:home.do";
					
				}else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.print("<script>alert('비밀번호를 확인해주세요.');</script>");
					out.flush();
					return "user/Login";
				}
				
			}
			
			
		}else {
			if(passwordEncoder.matches(password, Loginvo.getB_password())) {
				session.setAttribute("id", Loginvo.getB_email());
				session.setAttribute("password", Loginvo.getB_password());
				session.setAttribute("status", Loginvo.getToken());
				session.setAttribute("nickname", Loginvo.getB_nickname());
				session.setAttribute("author", Loginvo.getB_author());
				cSession.addLoginUser(Loginvo.getB_email());
				System.out.println("구매자");
				path = "redirect:home.do";
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<script>alert('비밀번호를 확인해주세요.');</script>");
				out.flush();
				return "user/Login";
			}
		}
	
		if(path == "") {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 정보를 확인해주세요.');</script>");
			out.flush();

			return "user/Login";
		}else {
			return path;
		}
		
	}

	 @RequestMapping("/logout.do")
	    public String logout(LoginVO loginVO, HttpSession session) {
	        
	        /* 채팅 */
	        //LoginVO loginvo = (LoginVO) session.getAttribute("loginUser") ;
//	        SellerVO svo = (SellerVO) session.getAttribute("loginUser");
//	        AdminVO avo = (AdminVO) session.getAttribute("loginUser");
	        session.invalidate();
	                
	        /* 채팅 */
	        // 로그아웃한 User를 채팅 Session ArrayList에서 삭제.
	      //  System.out.println("찾아보자"+loginvo.getB_email());
	       // cSession.removeLoginUser(loginvo.getB_email());
	       //cSession.removeLoginUser(avo.getAid());
	        //cSession.removeLoginUser(svo.getS_email());
	        
			return "user/Login";
	    }

	@ResponseBody
	@PostMapping("/ajaxEmailCheck.do")
	public String ajaxEmailCheck(@RequestParam("email") String email, HttpServletResponse response) {
		System.out.println("ajaxEmailCheck");
		System.out.println(email);
		String result;

		int chk = buyerJoinDao.checkEmail(email);

		if (chk == 0) {
			result = "true";
		} else {
			result = "false";
		}
		return result;
	}

	@ResponseBody
	@PostMapping("/ajaxNickCheck.do")
	public String ajaxNickCheck(@RequestParam("nickname") String nick, HttpServletResponse response) {
		System.out.println("ajaxNickCheck");
		System.out.println(nick);
		String result;

		int chk = buyerJoinDao.checkNick(nick);

		if (chk == 0) {
			result = "true";
		} else {
			result = "false";
		}

		return result;
	}
}
