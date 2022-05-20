package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnaDto;
import com.ssafy.happyhouse.model.dto.ReplyDto;

public interface QnaService {
	public List<QnaDto> retrieveQna();
	public QnaDto detailQna(int no);
	public boolean writeQna(QnaDto qnaDto);
	public boolean updateQna(QnaDto qnaDto);
	public boolean deleteQna(int no);
	public void increaseHitCount(QnaDto qnaDto);
	public List<ReplyDto> retrieveReply(int no);
	public int writeReply(ReplyDto replyDto);
	public int updateReply(ReplyDto replyDto);
	public int deleteReply(ReplyDto replyDto);
	public int replyCount(int no);
}
