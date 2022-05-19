package com.ssafy.happyhouse.model.dto;

// 답변 DB
public class ReplyDto {
	int replyno; // 답변글번호
	int no; // Qna번호
	String content; // 답변내용
	String regtime; // 작성시간
	
	public ReplyDto() {}

	public ReplyDto(int replyno, int no, String content, String regtime) {
		super();
		this.replyno = replyno;
		this.no = no;
		this.content = content;
		this.regtime = regtime;
	}

	public int getReplyno() {
		return replyno;
	}

	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
	};
	
	
}
