package com.portfolio.movie.info;
		
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String movieDetail(Model model,@RequestParam("movieTitle") String movieTitle) {
		System.out.println("detailMovieTitle:"+movieTitle);
		model.addAttribute("movie", service.selectMovie(movieTitle));
		model.addAttribute("cmtList",service.cmtList(movieTitle));
		
		
		return "movie/movieDetail";
	}
	
	@RequestMapping(value="/movieCmt",method=RequestMethod.POST)
	public String movieCmt(MovieCmtVO mcvo, HttpSession hs,RedirectAttributes redirectAttributes) {
		
		MemberVO loginUser = (MemberVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			return "/member/signIn";
		}
		
		
		service.insertCmt(mcvo,hs); 
	
		redirectAttributes.addAttribute("movieTitle", mcvo.getMovieTitle());
		return "redirect:/movieDetail";
	}
	
	@RequestMapping(value="/modCmt",method=RequestMethod.POST)
	public String modCmt(MovieCmtVO mcvo, HttpSession hs,RedirectAttributes redirectAttributes) {
		
		MemberVO loginUser = (MemberVO)hs.getAttribute("loginUser");
		if(loginUser == null) {
			return "/member/signIn";
		}

		service.modCmt(mcvo, hs); 
		
		redirectAttributes.addAttribute("movieTitle", mcvo.getMovieTitle());
		return "redirect:/movieDetail";
	}
	
	@RequestMapping(value="/cmtDel" , method=RequestMethod.GET)
	   public String cmtDel(HttpSession hs,String movieTitle,int i_comment,int i_user,RedirectAttributes rd) {
	      rd.addAttribute("movieTitle", movieTitle);
	      MemberVO loginUser = (MemberVO)hs.getAttribute("loginUser");
	      System.out.println("i_comment:"+i_comment);
	      if(loginUser.getI_user() == i_user) {

	         service.cmtDel(i_comment);
	      }
	      return "redirect:/movieDetail";
	   }
	
}
