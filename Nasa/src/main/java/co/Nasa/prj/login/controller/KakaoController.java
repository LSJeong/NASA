package co.Nasa.prj.login.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import co.Nasa.prj.login.service.LoginService;
import co.Nasa.prj.login.service.LoginVO;

@Controller
public class KakaoController {
	@Autowired private LoginService LoginDao;
	

	
	
	@RequestMapping("/kakaologin.do")
	public String userController(HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("카카오로그인");
		System.out.println(request.getParameter("kakaoemail"));
		System.out.println(request.getParameter("kakaoname"));
		System.out.println(request.getParameter("kakaobirth"));
		System.out.println(request.getParameter("accesstoken"));

		// kakaoemail을 kakaoid에 저장
		String kakaoid = request.getParameter("kakaoemail");
		String kakaoname = request.getParameter("kakaoname");
		String token = request.getParameter("accesstoken");
		LoginVO userTo = new LoginVO();

		// kakaoid를 to의 id로 세팅
		userTo.setB_email(kakaoid);
		userTo.setToken(token);
		System.out.println("token셋팅");
		System.out.println(token);
//		userTo.setStatus(kakaoname);
		userTo = LoginDao.selectbuyerId(userTo);

		// 카카오계정으로 로그인한 적이 있는지 없는지 
		String ViewPage = "";
		
		if (userTo == null) { // 회원이 아닌경우 (카카오 계정으로 처음 방문한 경우) 카카오 회원정보 설정 창으로 이동
		    System.out.println("카카오 회원 정보 설정");
		    userTo = LoginDao.selectbuyerId(userTo);
		    model.addAttribute("kakaoid", request.getParameter("kakaoemail"));
		    model.addAttribute("kakaoname", request.getParameter("kakaoname"));
		    model.addAttribute("kakaobirth", request.getParameter("kakaobirth"));
		    model.addAttribute("kakaoemail", request.getParameter("kakaoemail"));
		    model.addAttribute("token", request.getParameter("accesstoken"));

//		    request.setAttribute("kakaoid", request.getParameter("kakaoemail"));
//		    request.setAttribute("kakaoname",request.getParameter("kakaoname"));
//		    request.setAttribute("kakaobirth",request.getParameter("kakaobirth"));
//		    request.setAttribute("kakaoemail",request.getParameter("kakaoemail"));
		    session.setAttribute("email", kakaoid);
		    session.setAttribute("name", kakaoname);
		    session.setAttribute("token", token);
		    
		    System.out.println("회원이 아닌경우");
		   
		    // 회원가입창으로 이동
		    ViewPage = "buyer/buyerJoin";

		} else { // 이미 카카오로 로그인한 적이 있을 때 (최초 1회 로그인때 회원가입된 상태)
		    // id, nick, profile을 가져와서
		    userTo = LoginDao.selectbuyerId(userTo);
		    // id를 세션에 저장
		    session.setAttribute("id", userTo.getB_email());
		    // nick을 세션에 저장
		    //session.setAttribute("name", userTo.getStatus());
		    session.setAttribute(token, userTo.getToken());
		    // 프로필 사진 (profile)을 세션에 저장
//		    session.setAttribute("profile", userTo.getGimg());
//		    session.setAttribute("addr", userTo.getGaddress());
//		    session.setAttribute("tel", userTo.getGtel());
//		    session.setAttribute("img", userTo.getGimg());
		    session.setAttribute("author", userTo.getB_author());
		    
		    System.out.println("회원인 경우");
		    System.out.println("kakaoid : " + userTo.getB_email());
		    System.out.println("nick : " + userTo.getToken());
		    System.out.println("author : " + userTo.getB_author());
//		    System.out.println("profile : " + userTo.getGimg());
		    //메인페이지
		    ViewPage = "user/home";
		}
		return ViewPage;
	}
	
	
	
}
