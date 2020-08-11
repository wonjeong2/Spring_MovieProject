package com.portfolio.movie.reserve_pay;

import java.util.ArrayList;	
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.portfolio.movie.info.InfoService;
import com.portfolio.movie.info.InfoVO;

@Controller
public class Reserve_payController {

	@Autowired
	private Reserve_payService service;
	@Autowired
	private InfoService service2;

	@RequestMapping(value = "/myReservePage", method = RequestMethod.GET)
	public String myReservePage() {

		return "reserve/myReserve";
	}

	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public String movieList(Model model, String movieTitle) {

		List<InfoVO> list = service2.crawl();
		List<DateVO> list2 = service.date();

		List<String> movieTitleList = new ArrayList<String>();

		for (int i = 0; i < list.size(); i++) { // 영화 제목만 담기
			movieTitleList.add(list.get(i).getMovieTitle());
		}

		model.addAttribute("movieTitleList", movieTitleList);
		model.addAttribute("date", list2);

		return "movie/reserve";
	}

	@RequestMapping(value = "/seat", method = RequestMethod.POST)
	public String info(ReserveVO param, Model model) {
		System.out.println(param.getMovieTitle());
		System.out.println(param.getDate());
		System.out.println(param.getLocation());

		ReserveVO vo = new ReserveVO(); // 영화제목, 상영관, 날짜 담기

		vo.setDate(param.getDate());
		vo.setLocation(param.getLocation());
		vo.setMovieTitle(param.getMovieTitle());

//			String[][] str = service.seat();
//			for(int i=0; i<str.length; i++) {
//				for(int j=0; j<str[i].length; j++) {
//					System.out.println("Controller:"+str[i][j]);
//				}
//			}

		
		model.addAttribute("seat", service.seat());
		return "movie/seat";
	}

	@RequestMapping(value ="/kakaoPay", method = RequestMethod.POST)
	public String pay(ReserveVO param, Model model) {
		
		ReserveVO p = new ReserveVO();
		System.out.println("totalAmount:"+param.getTotalSeatAmount());
		p.setMovieTitle("반도");
		p.setTotalSeatAmount(param.getTotalSeatAmount());
		
		model.addAttribute("data",p);
		return "pay/kakaoPay";
	}
}
