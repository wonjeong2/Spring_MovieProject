package com.portfolio.movie.reserve_pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Reserve_payController {
	@Autowired
	private Reserve_payService service;
	
	
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
	/*
	 *
	 * 
	 * @RequestMapping(value="/kakaoPayReady", method = RequestMethod.POST ) public
	 * String kakaoPayReady() { return "redirect:"+service.kakaoPay(); }
	 * 
	 * @RequestMapping(value="/kakaoPaySuccess", method=RequestMethod.GET) public
	 * void kakaoPaySuccess(@RequestParam("pg_token")String pg_token, Model model) {
	 * System.out.println("pg_token:"+pg_token); }
	 */
	
	
	
}
