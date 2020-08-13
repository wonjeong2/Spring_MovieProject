package com.portfolio.movie.info;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class InfoService {
	@Autowired
	private InfoMapper mapper;
	
	
	public List<InfoVO> crawl() {
		Document doc;
		
		List<InfoVO> list = new ArrayList<InfoVO>();
		
		try {
			doc=Jsoup.connect("http://cgv.co.kr/movies/").get();
			
			Elements ranks = doc.select("strong.rank");
			Elements imgs = doc.select("span.thumb-image img");
			Elements moveAges = doc.select("span.ico-grade");
			Elements movieTitles = doc.select("strong.title");
			Elements movieRates = doc.select("strong.percent span");
			Elements openDates = doc.select("span.txt-info");
			
			
			for (int i = 0; i < ranks.size(); i++) {

				String rank = ranks.get(i).text();
				String img = imgs.get(i).attr("src");
				String movieAge = moveAges.get(i).text();
				String movieTitle = movieTitles.get(i).text();
				String movieRate = movieRates.get(i).text();
				String openDate = openDates.get(i).text();
				
				
			
				InfoVO cgvInfo = new InfoVO(rank, img, movieAge, movieTitle, movieRate, openDate);

				list.add(cgvInfo);
			}
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		return list;
	}
	public void setCrawl(List<InfoVO> vo) {
		mapper.setCrawl(vo);
	}

}
