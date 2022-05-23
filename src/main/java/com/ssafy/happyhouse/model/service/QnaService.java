package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.QnaDto;
import com.ssafy.happyhouse.model.dto.ReplyDto;

public interface QnaService {
	public List<QnaDto> retrieveQna(Map<String, Object> map);
	public List<QnaDto> detailQnaById(String id);
	public QnaDto detailQna(int no);
	public boolean writeQna(QnaDto qnaDto);
	public boolean updateQna(QnaDto qnaDto);
	public boolean deleteQna(Map<String,Object> map);
	public void increaseHitCount(QnaDto qnaDto);
	public List<ReplyDto> retrieveReply(int no);
	public int writeReply(ReplyDto replyDto);
	public int updateReply(ReplyDto replyDto);
	public int deleteReply(Map<String, Object> param);
	public void replyCount(int no);
	public Integer selectQnaTotalCount();
	// pagination(page-link)
	public List<QnaDto> selectQnaLimitOffset(int limit, int offset);
}
