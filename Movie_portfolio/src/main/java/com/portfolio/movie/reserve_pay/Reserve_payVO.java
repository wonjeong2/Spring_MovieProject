package com.portfolio.movie.reserve_pay;

public class Reserve_payVO {
	private int i_reserve;
	private int i_user;
	private String movieTitle;
	private String movieAge;
	private String MovieDate;
	private int ticketNumber;
	private String selectSeat;
	private String selectTheater;
	private String payDate;
	private int payMoney;
	
	
	public int getI_reserve() {
		return i_reserve;
	}
	public void setI_reserve(int i_reserve) {
		this.i_reserve = i_reserve;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getMovieAge() {
		return movieAge;
	}
	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}
	public String getMovieDate() {
		return MovieDate;
	}
	public void setMovieDate(String movieDate) {
		MovieDate = movieDate;
	}
	public int getTicketNumber() {
		return ticketNumber;
	}
	public void setTicketNumber(int ticketNumber) {
		this.ticketNumber = ticketNumber;
	}
	public String getSelectSeat() {
		return selectSeat;
	}
	public void setSelectSeat(String selectSeat) {
		this.selectSeat = selectSeat;
	}
	public String getSelectTheater() {
		return selectTheater;
	}
	public void setSelectTheater(String selectTheater) {
		this.selectTheater = selectTheater;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public int getPayMoney() {
		return payMoney;
	}
	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}
	
	
	
}
