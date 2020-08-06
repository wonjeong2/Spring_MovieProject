package com.portfolio.movie.member;

	

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.movie.common.Const;
import com.portfolio.movie.common.MyUtils;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET) //연결 브릿지 담당
	public String login() {
		return "user/login";
	}
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST) //연결 브릿지 담당
	public String loginPost(MemberVO mvo, Model model, HttpSession hs) {
		System.out.println("id:"+mvo.getCid());
		System.out.println("pw:"+mvo.getCpw());
		int result = service.login(mvo, hs);
		if(result ==1) {
			return "redirect:/crawl";
		}else if(result == 3) {
			System.out.println("id가 존재하지 않습니다.");
		}else if(result == 2) {
			System.out.println("비밀번호가 틀립니다.");
		}else {
			System.out.println("오류 발생!");
		}
		model.addAttribute("data",service.login(mvo,hs));
		return "user/login";
		
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET) //연결 브릿지 담당
	public String join(Model model, @RequestParam(value="err",required=false)String err) {
		if(err != null) {
			model.addAttribute("msg", err);
		}
		return "user/join";
	}
	@RequestMapping(value="/joinPost", method=RequestMethod.POST)
	public String join(MemberVO mvo, HttpSession hs, RedirectAttributes ra) {
		String rNumbers = (String)hs.getAttribute("rNumbers");
		if(!rNumbers.equals(mvo.getPhAuthNumber())) {
			ra.addAttribute("err", "인증번호가 맞지 않습니다.");
			return "redirect:/user/join";
		}
		
		int result = service.join(mvo);
		return "redirect:/user/login";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/phAuth", method=RequestMethod.GET)
	public Map<String, Object> phAuth(@RequestParam String ph, HttpSession hs) {
		System.out.println("ph : " + ph);	
		int len =  6; //인증번호길이
		String rNumbers = MyUtils.makeRandomNumber(len);
		System.out.println("rNumbers: " + rNumbers);
		//ph번호로 인증번호를 문자로 보낸다.
		
		hs.setAttribute("rNumbers", rNumbers);
		
		Map<String, Object> map = new HashMap();
		map.put("result", 1); //json형태로 출력
		
		return map;
	}
	//인증코드받기(start)-요청
	@RequestMapping(value="/loginKAKAO", method=RequestMethod.GET)
	public String loginKAKAO() {
		String uri = String.format("redirect:https://kauth.kakao.com/oauth/authorize?"
				+ "client_id=%s&redirect_uri=%s&response_type=code"
				, Const.KAKAO_CLIENT_ID, Const.KAKAO_AUTH_REDIRECT_URI);
		return uri;
	}
	
	@RequestMapping(value="/joinKAKAO", method=RequestMethod.GET)
	//인증코드받기-응답
	public String joinKAKAO(@RequestParam(required=false) String code,
			@RequestParam(required=false) String error, HttpSession hs) {
		//인증코드가 담겨 온다.
		System.out.println("code : " + code);
		System.out.println("error : " + error);
		
		if(code == null) {			
			return "redirect:/user/login";
		}
		int result = service.kakaoLogin(code,hs);
		
		return "redirect:/board/list";
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession hs) {
		hs.invalidate();
		return "redirect:/user/login";
	}
}
