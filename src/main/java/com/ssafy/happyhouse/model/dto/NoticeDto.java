package com.ssafy.happyhouse.model.dto;

public class NoticeDto {
	private int no;
	private String subject;
	private String content;
	private String regTime;
	
	public NoticeDto() {}
	
	public NoticeDto(int no, String subject, String content, String regTime) {
		this.no = no;
		this.subject = subject;
		this.content = content;
		this.regTime = regTime;
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

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	
	
}
