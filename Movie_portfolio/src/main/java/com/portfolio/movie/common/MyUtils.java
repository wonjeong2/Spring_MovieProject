package com.portfolio.movie.common;

import org.mindrot.jbcrypt.BCrypt;

public class MyUtils{
	public static String gensalt() {
		return BCrypt.gensalt();
	}
	public static String hashPassword(String pw,String salt) {
		return BCrypt.hashpw(pw, salt);
	}
	/*
	 * public static UserVO getLoginUser(HttpServletRequest request) { HttpSession
	 * hs = request.getSession(); return (UserVO)hs.getAttribute("loginUser"); }
	 */
	
//	//len:길이 0~9사이의 숫자
//	public static String makeRandomNumber(int len) {
//		 //난수가 저장될 변수
//		String result = "";
//		//0~9까지 난수 생성
//		for(int i =0; i<len;i++) {
//			result += Integer.toString((int)(Math.random()*10));
//		}
//		System.out.println("result:"+result);
//		return result;
//	}
}