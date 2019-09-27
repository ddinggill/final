package com.mycompany.gofarm.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mycompany.gofarm.user.dto.UserDTO;
import com.mycompany.gofarm.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private KakaoAPI kakao;
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	
	private String apiResult = null;
	
	public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public UserController() {
		
	}
	
	@RequestMapping("/signup.do")
	public String signForm() {
		System.out.println("회원가입요청");
		return "user/signup";
	}
	
	@RequestMapping("/signuppro.do")
	public String signProc(UserDTO dto) {
		System.out.println(dto.getBirth());
		userService.signupProcess(dto);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/login.do")
	public String loginForm() {
		return "user/login";
	}
	
	@RequestMapping("/loginpro.do")
	public String loginProc(UserDTO dto, HttpServletRequest req, Model model) {
		if(userService.loginCheckProcess(dto) != null) {
			dto = userService.loginCheckProcess(dto);
			//System.out.println(dto.getBirth());
			if(dto.getUserlvl() <0) {
				model.addAttribute("loginCheck", "fail");
			}else {
				HttpSession session = req.getSession();
				session.setMaxInactiveInterval(30*60);//로그인유지시간 30분
				session.setAttribute("loginOk", dto);
				return "redirect:/main.do";
			}
		}else {
			//req.setAttribute("loginCheck","fail");
			model.addAttribute("loginCheck", "fail");
			//mav.setViewName("redirect:/login.do");
		}
		return "user/login";
	}//end loginProc()
	
	@RequestMapping("/logout.do")
	public String logoutProc(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/main.do";
	}
	
	@RequestMapping("/kakaologin.do")
	public String kakaoLogin() {
		
		return "user/kakaologin";
	}
	
	@RequestMapping(value = "/kakao.do")
	public String kakaologinProc(@RequestParam("code") String code,UserDTO dto, HttpServletRequest req) {
		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);

		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		dto.setNickname((String) userInfo.get("nickname"));
		/*dto.setBirth(Date.valueOf("0001-"+((String)userInfo.get("birthday")).substring(0, 2)
				+"-"+((String)userInfo.get("birthday")).substring(2)));*/
		dto.setEmail((String) userInfo.get("email"));
		dto.setBirth("1111-11-11");
		
		/*System.out.println(((String)userInfo.get("birthday")).substring(0, 2));
		System.out.println(((String)userInfo.get("birthday")).substring(2));
		System.out.println(dto.getBirth());*/
		dto = userService.kakaologinProcess(dto);
		if(dto.getUserlvl() < 0) {
			return "redirect:/main.do";
		}
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(30*60);//로그인유지시간 30분
		session.setAttribute("loginOk", dto);
		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		/*if (userInfo.get("email") != null) {

			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("userId", userInfo.get("nickname"));
			session.setAttribute("access_Token", access_Token);
		}*/
		
		return "redirect:/main.do";
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverlogin(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		//네이버 
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "user/naverlogin";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverlogincallback(@RequestParam String code, @RequestParam String state, HttpSession session,
			UserDTO dto, HttpServletRequest req)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		System.out.println(apiResult);
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(apiResult);
		JsonObject naver_account = element.getAsJsonObject().get("response").getAsJsonObject();
		//JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		
		String nickname = naver_account.getAsJsonObject().get("name").getAsString();
		String email = naver_account.getAsJsonObject().get("email").getAsString();
		//String birthday = naver_account.getAsJsonObject().get("birthday").getAsString();
		System.out.println(nickname);
		System.out.println(email);
		//System.out.println(birthday);
		
		dto.setNickname(nickname);
		dto.setEmail(email);
		dto.setBirth("1111-11-11");
		
		dto = userService.kakaologinProcess(dto);
		
		if(dto.getUserlvl() < 0) {
			return "redirect:/main.do";
		}
		HttpSession serversession = req.getSession();
		serversession.setMaxInactiveInterval(30*60);//로그인유지시간 30분
		serversession.setAttribute("loginOk", dto);
		
		return "redirect:/main.do";
	}
	
	//상제회원가입
	@RequestMapping("/detailsignup.do")
	public String detailsignForm() {
		System.out.println("상세회원가입요청");
		return "user/detailsignup";
	}
	
	@RequestMapping("/detailsignuppro.do")
	public String detailsignProc(UserDTO dto,HttpServletRequest req) {
		HttpSession session = req.getSession();
		System.out.println(((UserDTO)session.getAttribute("loginOk")).getUsercode());
		dto.setUsercode(((UserDTO)session.getAttribute("loginOk")).getUsercode());
		userService.detailsignupProcess(dto);
		
		return "redirect:/logout.do";
	}
	
	@RequestMapping("/infochange.do")
	public String infochangeForm() {
		
		return "user/infochange";
	}
	
	@RequestMapping("/infochangepro.do")
	public String infochangeProc(UserDTO dto, HttpServletRequest req) {
		System.out.println("회원정보 수정");
		HttpSession session = req.getSession();
		dto.setUsercode(((UserDTO)session.getAttribute("loginOk")).getUsercode());
		userService.updateProcess(dto);
		return "redirect:/logout.do";
	}
	
	@RequestMapping(value = "/idchk.do" ,method=RequestMethod.POST)
	public @ResponseBody boolean idchk(String userid){
		System.out.println("회원가입아이디체크:" + userid);
		if(userService.idchkProcess(userid) >0) {
			return false;
		}else {
			return true;
		}
	}
}//end class
