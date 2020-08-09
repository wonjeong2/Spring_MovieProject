package com.portfolio.movie.reserve_pay;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.portfolio.movie.info.DateVO;
import com.portfolio.movie.info.InfoService;
import com.portfolio.movie.info.InfoVO;
import com.portfolio.movie.info.ReserveVO;

@Controller
public class Reserve_payController {
	@Autowired
	private Reserve_payService service;
	private InfoService service2;
	
	
	 @RequestMapping(value="/kakaoPay", method = RequestMethod.GET ) 
	 public String kakaoPay() { 
		 return "pay/kakaoPay"; 
	 }
	 @RequestMapping(value="/myReservePage", method = RequestMethod.GET) 
	 public String myReservePage() { 
		 
		 return "reserve/myReserve"; 
	 }
	 @RequestMapping(value="/movieList2", method = RequestMethod.GET) 
	 public String movieList() { 
		 
		 return "movie/movieList"; 
	 }
	 @RequestMapping(value="/reserve", method= RequestMethod.GET)
		public String movieList(Model model, String movieTitle) {

			List<InfoVO> list = service2.crawl();	
			List<DateVO> list2 = service2.date();  
			
			List<String> movieTitleList = new ArrayList<String>();
			
			for(int i = 0; i < list.size(); i++) { //영화 제목만 담기
				movieTitleList.add(list.get(i).getMovieTitle());
			}
			
			model.addAttribute("movieTitleList", movieTitleList);
			model.addAttribute("date", list2);  
			
			return "movie/reserve";
		}
		
		
		@RequestMapping(value="/seat", method= RequestMethod.POST)
		public String info(ReserveVO param, Model model) {
			System.out.println(param.getMovieTitle());
			System.out.println(param.getDate());
			System.out.println(param.getLocation());
			
			ReserveVO vo = new ReserveVO();
			
			vo.setDate(param.getDate());
			vo.setLocation(param.getLocation());
			vo.setMovieTitle(param.getMovieTitle());
			
			
			return "movie/seat";
		}
	
	
}
