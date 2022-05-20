package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dto.QnaDto;
import com.ssafy.happyhouse.model.dto.ReplyDto;
import com.ssafy.happyhouse.model.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaMapper qnaMapper;
	
	@Override
	public List<QnaDto> retrieveQna() {
		return qnaMapper.selectQna();
	}

	@Override
	public QnaDto detailQna(int no) {
		return qnaMapper.selectQnaByNo(no);
	}

	@Override
	public boolean writeQna(QnaDto qnaDto) {
		return qnaMapper.insertQna(qnaDto) == 1;
	}

	@Override
	@Transactional
	public boolean updateQna(QnaDto qnaDto) {
		return qnaMapper.updateQna(qnaDto) == 1;
	}

	@Override
	@Transactional
	public boolean deleteQna(int no) {
		return qnaMapper.deleteQna(no) == 1;
	}

	@Override
	public void increaseHitCount(QnaDto qnaDto) {
		qnaMapper.increaseHitCount(qnaDto);
	}

	@Override
	public List<ReplyDto> retrieveReply(int no) {
		return qnaMapper.selectReply(no);
	}

	@Override
	public int writeReply(ReplyDto replyDto) {
		return qnaMapper.insertReply(replyDto);
	}

	@Override
	public int updateReply(ReplyDto replyDto) {
		return qnaMapper.updateReply(replyDto);
	}

	@Override
	public int deleteReply(ReplyDto replyDto) {
		return qnaMapper.deleteReply(replyDto);
	}

	@Override
	public int replyCount(int no) {
		return qnaMapper.replyCount(no);
	}

}
