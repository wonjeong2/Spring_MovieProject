package com.portfolio.movie.info;

import java.util.ArrayList;
import java.util.List;

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
	public String movieList(Model model, String movieTitle) {

		List<InfoVO> list = service.crawl();	
		List<DateVO> list2 = service.date();  
		
		List<String> movieTitleList = new ArrayList<String>();
		
		for(int i = 0; i < list.size(); i++) { //영화 제목만 담기
			movieTitleList.add(list.get(i).getMovieTitle());
		}
		
		model.addAttribute("movieTitleList", movieTitleList);
		model.addAttribute("date", list2);  
		
		return "movie/movieList";
	}
}
