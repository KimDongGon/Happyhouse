package com.ssafy.happyhouse.model.dto;

public class NoticeDto {
	private int no;
	private String subject;
	private String content;
	private String regtime;
	
	public NoticeDto() {}
	
	public NoticeDto(int no, String subject, String content, String regtime) {
		this.no = no;
		this.subject = subject;
		this.content = content;
		this.regtime = regtime;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	
	
}
