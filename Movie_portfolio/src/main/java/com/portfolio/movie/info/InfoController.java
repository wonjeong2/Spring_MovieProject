package com.portfolio.movie.info;
		
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.portfolio.movie.member.MemberVO;





@Controller
public class InfoController {
	@Autowired
	private InfoService service;
	
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String getCrawling() {		
		return "main";
	}
	
	@RequestMapping(value="/movieList", method=RequestMethod.GET)
	public String movieChart(Model model) {
		model.addAttribute("list",service.setCrawl(service.crawl()));
		return "movie/movieList";
	}
	
	@RequestMapping(value="/movieDetail", method=RequestMethod.GET)
	public String movieDetail(Model model,String movieTitle) {
		System.out.println("detailMovieTitle:"+movieTitle);
		model.addAttribute("movie", service.selectMovie(movieTitle));	
		return "movie/movieDetail";
	}
	//리다이렉트 쿼리스트링이 불가 axios로 비동기형식으로 db저장 리스트 뿌리기해야할듯
	@RequestMapping(value="/movieCmt",method=RequestMethod.POST)
	public String movieCmt(MovieCmtVO mcvo,HttpSession hs) {
		MemberVO loginUser = (MemberVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			return "/member/signIn";
		}
		service.insertCmt(mcvo,hs);
		return "redirect:/movieDetail?movieTitle="+mcvo.getMovieTitle();
	}
}
