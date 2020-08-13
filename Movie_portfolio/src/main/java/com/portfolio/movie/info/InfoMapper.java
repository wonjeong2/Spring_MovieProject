package com.portfolio.movie.info;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InfoMapper {
	public void setCrawl(InfoVO param);
	public void delCrawl();
}
