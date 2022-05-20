package com.ssafy.happyhouse.model.dto;

// qna DataBase
public class QnaDto {
	private int no;
	private String id;
	private String title;
	private String content;
	private int hit;
	private int replycount;
	private String regtime;
	
	public QnaDto(int no, String id, String title, String content, int hit, int replycount, String regtime) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.regtime = regtime;
		this.replycount = replycount;
	}

	public QnaDto() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	
	
}
