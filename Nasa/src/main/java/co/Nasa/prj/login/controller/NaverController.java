package co.Nasa.prj.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import co.Nasa.prj.login.service.LoginService;
import co.Nasa.prj.login.service.LoginVO;
import co.Nasa.prj.login.service.NaverLoginBO;

@Controller
public class NaverController {
	@Autowired private LoginService LoginDao;
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	// 네이버회원 로그인(callback)
				@RequestMapping("/callback.do")
				public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
						throws IOException, org.json.simple.parser.ParseException  {
					System.out.println("여기는 callBack");
					OAuth2AccessToken oauthToken;
					oauthToken = naverLoginBO.getAccessToken(session, code, state);

					apiResult = naverLoginBO.getUserProfile(oauthToken);

					JSONParser parser = new JSONParser();
					Object obj = parser.parse(apiResult);
					JSONObject jsonObj = (JSONObject) obj;

					JSONObject response_obj = (JSONObject) jsonObj.get("response");
					System.out.println(response_obj);
					String email = (String) response_obj.get("email");
					String name = (String) response_obj.get("name");
					String id = (String) response_obj.get("id");
					System.out.println(name);

					session.setAttribute("name", name);
					session.setAttribute("email", email);
					session.setAttribute("id", id);

					model.addAttribute("result", apiResult);

					LoginVO vo = new LoginVO();
					vo.setB_email(email);
					vo = LoginDao.selectbuyerId(vo);
					

					String viewPage = null;
					if (vo == null) {
						//회원가입으로 바꿔야함
						viewPage = "buyer/buyerJoin";
					} else {
						session.setAttribute("author", vo.getB_author());
						viewPage = "user/home";
					}

					return viewPage;
				}
}
