package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Locale;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.NewsDto;

import java.util.*;
import java.text.*;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/news")
public class NewsController {
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@GetMapping
	public ResponseEntity<List<NewsDto>> todayNewsCrawl() throws IOException { 		

		List<NewsDto> list = new ArrayList();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
		Date currentTime = new Date();
		
		String dTime = formatter.format(currentTime);
		String e_date = dTime;
		
		currentTime.setDate(currentTime.getDate() - 1);
		String s_date = formatter.format(currentTime);
		
		String query = "경제";
		String s_from = s_date.replace(".", "");
		String e_to = e_date.replace(".", "");
		
		int page = 1;
		
		while(page < 6) {
			String address = "https://search.naver.com/search.naver?where=news&query=" + query + "&sort=1&ds=" + s_date
					+ "&de=" + e_date + "&nso=so%3Ar%2Cp%3Afrom" + s_from + "to" + e_to + "%2Ca%3A&start="
					+ Integer.toString(page);
			
			Document rawData = Jsoup.connect(address).timeout(5000).get();
			//System.out.println("주소 >>> " + address);
			Elements blogOption = rawData.select(".news_tit");
			
			String realURL = "";
			String realTITLE = "";
			
			for(Element option : blogOption) {
				realURL = option.attr("href");
				//System.out.println("realURL >>> " + realURL);
				realTITLE = option.attr("title");
				//System.out.println("realTitle >>> " + realTITLE);
				NewsDto news = new NewsDto();
				
				news.setUrl(realURL);
				news.setTitle(realTITLE);
				
				list.add(news);
			}
			page++;
		}
		
		return new ResponseEntity<List<NewsDto>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/apt")
	public ResponseEntity<List<NewsDto>> aptNewsCrawl() throws IOException { 		

		List<NewsDto> list = new ArrayList();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
		Date currentTime = new Date();
		
		String dTime = formatter.format(currentTime);
		String e_date = dTime;
		
		currentTime.setDate(currentTime.getDate() - 1);
		String s_date = formatter.format(currentTime);
		
		String query = "아파트매매";
		String s_from = s_date.replace(".", "");
		String e_to = e_date.replace(".", "");
		
		int page = 1;
		
		while(page < 6) {
			String address = "https://search.naver.com/search.naver?where=news&query=" + query + "&sort=1&ds=" + s_date
					+ "&de=" + e_date + "&nso=so%3Ar%2Cp%3Afrom" + s_from + "to" + e_to + "%2Ca%3A&start="
					+ Integer.toString(page);
			
			Document rawData = Jsoup.connect(address).timeout(5000).get();
			System.out.println("주소 >>> " + address);
			Elements blogOption = rawData.select(".news_tit");
			//String text = blogOption.text();
			//Elements url = rawData.select(")
			
			String realURL = "";
			String realTITLE = "";
			
			for(Element option : blogOption) {
				realURL = option.attr("href");
				//System.out.println("realURL >>> " + realURL);
				realTITLE = option.attr("title");
				//System.out.println("realTitle >>> " + realTITLE);
				NewsDto news = new NewsDto();
				
				news.setUrl(realURL);
				news.setTitle(realTITLE);
				
				list.add(news);
			}
			page++;
		}
		
		return new ResponseEntity<List<NewsDto>>(list, HttpStatus.OK);
	}
}
