package com.portfolio.movie.info;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;





@Controller
public class InfoController {
	@Autowired
	private InfoService service;
	
	@RequestMapping(value="/crawl", method = RequestMethod.GET)
	public String getCrawling(Model model) {
		model.addAttribute("list", service.crawl());
		return "crawl";
	}
	@RequestMapping(value="/movieList", method= RequestMethod.GET)
	public String movieList(Model model) {
		model.addAttribute("list", service.crawl());
		
		return "movie/movieList";
	}
}
