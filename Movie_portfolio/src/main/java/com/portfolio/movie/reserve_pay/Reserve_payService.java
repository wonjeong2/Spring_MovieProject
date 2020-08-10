package com.portfolio.movie.reserve_pay;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.portfolio.movie.info.InfoVO;

@Service
public class Reserve_payService {


	public List<DateVO> date() {

		List<DateVO> list = new ArrayList<DateVO>();
		String[] weekOfDay = { "일", "월", "화", "수", "목", "금", "토" };
		int[] day = new int[7];

		Calendar cal = new GregorianCalendar();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);

		for (int i = 0; i < 7; i++) {
			day[i] = date;
			System.out.println(day[i]);
			date++;

		}

		for (int i = 0; i < 7; i++) {
			cal.set(year, month, day[i]);
			list.add(new DateVO(year, month + 1, day[i], weekOfDay[cal.get(Calendar.DAY_OF_WEEK) - 1]));
		}

		for (int i = 0; i < 7; i++) {
			System.out.println(list.get(i).toString());
		}
		return list;
	}

	public String[][] seat() {
		String[][] seat2 = new String[7][7];
		String[] seatArr = { "A", "B", "C", "D", "E", "F", "G" };
		String[] seatArr2 = { "1", "2", "3", "4", "5", "6", "7" };
		for (int i = 0; i < 7; i++) {

			for (int z = 0; z < 7; z++) {
				seat2[i][z] = seatArr[i] + seatArr2[z];
				System.out.print(seat2[i][z] + " ");
			}
			System.out.println();
		}

		return seat2;
	}

}
