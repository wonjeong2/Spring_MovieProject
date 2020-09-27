package com.portfolio.movie.info;

public class InfoVO {
	
	private String rank;
	private String img;
	private String movieAge;
	private String movieTitle;
	private String movieRate;
	private String openDate;	
	private double star;
	
	public double getStar() {
		return star;
	}
	
	public void setStar(double star) {
		this.star = star;
	}
	
	public String getRank() {
		return rank;
	}
	
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getMovieAge() {
		return movieAge;
	}
	
	public void setMovieAge(String movieAge) {
		this.movieAge = movieAge;
	}
	
	public String getMovieRate() {
		return movieRate;
	}
	
	public void setMovieRate(String movieRate) {
		this.movieRate = movieRate;
	}
	
	public String getOpenDate() {
		return openDate;
	}
	
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	
	public String getMovieTitle() {
		return movieTitle;
	}
	
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	
	public InfoVO() {}
	
	public InfoVO(String rank, String img, String movieAge, String movieTitle, String movieRate, String openDate) {
		this.rank = rank;
		this.img = img;
		this.movieAge = movieAge;
		this.movieTitle = movieTitle;
		this.movieRate = movieRate;
		this.openDate = openDate;
	}
	
	@Override
	public String toString() {
		return "MovieInfoDto [rank=" + rank + ", img=" + img + ", movieAge=" + movieAge + ", movieTitle=" + movieTitle
				+ ", movieRate=" + movieRate + ", movieOpenDate=" + openDate 
				+ "]";
	}

	
}
