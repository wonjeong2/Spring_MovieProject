package com.portfolio.movie.info;

import javax.servlet.http.HttpSession;	
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;





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
		model.addAttribute("list",service.crawl());
		return "movie/movieList";
	}
	@RequestMapping(value="/movieDetail", method=RequestMethod.GET)
	public String movieDetail(Model model,String movieTitle) {
		return "movie/movieDetail";
	}
}
