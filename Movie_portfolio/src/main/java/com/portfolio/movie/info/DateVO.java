package com.portfolio.movie.info;

public class DateVO {
	private int year;
	private int mon;
	private int day;
	private String weekOfDay;
	
	public DateVO(int year, int mon, int day, String weekOfDay) {
		this.year = year;
		this.mon = mon;
		this.day = day;
		this.weekOfDay = weekOfDay;
	}
	
	public int getYear() {
		return year;
	}
	
	public void setYear(int year) {
		this.year = year;
	}
	
	public int getMon() {
		return mon;
	}
	
	public void setMon(int mon) {
		this.mon = mon;
	}
	
	public int getDay() {
		return day;
	}
	
	public void setDay(int day) {
		this.day = day;
	}

	public String getWeekOfDay() {
		return weekOfDay;
	}

	public void setWeekOfDay(String weekOfDay) {
		this.weekOfDay = weekOfDay;
	}
	
	@Override
	public String toString() {
		return year + "년 " + mon + "월 " + day + "일 " + weekOfDay + "요일"; 
	}
	
	
}
