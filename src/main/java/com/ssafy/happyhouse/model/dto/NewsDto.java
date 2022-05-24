package com.ssafy.happyhouse.model.dto;

import java.util.ArrayList;

public class NewsDto {
	private String url;
	private String title;
	
	public NewsDto() {}

	public NewsDto(String url, String title) {
		super();
		this.url = url;
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}	
	
}
