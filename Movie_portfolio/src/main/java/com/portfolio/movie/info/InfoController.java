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
	
	
	@RequestMapping(value="/crawl", method = RequestMethod.GET)
	public String getCrawling(InfoVO ivo,Model model, HttpSession hs) {
		service.setCrawl(service.crawl());
		model.addAttribute("list", service.crawl());
		return "crawl";
	}
	@RequestMapping(value="/movieChart", method=RequestMethod.GET)
	public String movieChart(Model model) {
		model.addAttribute("list",service.crawl());
		return "movie/movieChart";
	}	
}
