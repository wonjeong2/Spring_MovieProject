package com.portfolio.movie.reserve_pay;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String myReservePage(HttpSession hs, Model model) {
		
		//DB에 예약정보 담기
		
		hs.removeAttribute("reserveInfo");  //세션값 삭제
		
		

		
		return "member/myReserve";
	}

	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
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
	public String info(ReserveVO param, Model model, HttpSession hs) {
		System.out.println(param.getMovieTitle());
		System.out.println(param.getDate());
		System.out.println(param.getLocation());
		
		
//		ReserveVO vo = new ReserveVO(); 영화제목, 상영관, 날짜 담기

//		vo.setDate(param.getDate());
//		vo.setLocation(param.getLocation());
//		vo.setMovieTitle(param.getMovieTitle());
		
		service.reserveInfo(hs, param);

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
	public String pay(ReserveVO param, Model model, HttpSession hs) {
		
		Reserve_payVO reserveInfo =  (Reserve_payVO) hs.getAttribute("reserveInfo");
		
		
		String jsp = "";
		if(reserveInfo == null) {  //영화선택 안했다면 영화선택으로 다시가기, 내일 같이 해보기
			jsp = "redirect:/reserve";
		}
		
		jsp = "pay/kakaoPay";
		
		reserveInfo.setPayMoney(param.getTotalSeatAmount());
		reserveInfo.setSelectSeat(param.getSelectedSeat());
		
		return jsp;
	}
}
