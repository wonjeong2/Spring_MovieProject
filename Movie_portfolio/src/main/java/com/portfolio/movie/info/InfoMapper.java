package com.portfolio.movie.info;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InfoMapper {
	public List<InfoVO> listCrawl();
	public void setCrawl(InfoVO param);
	public void delCrawl();
	public InfoVO selectMovie(String movieTitle);
	public int insertCmt(MovieCmtVO mcvo);
	public List<MovieCmtVO> cmtList(String movieTitle);
}
