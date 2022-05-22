package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<QnaDto> retrieveQna(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		String key = map.get("key");
		if("id".equals(key)) {
			key = "id";
		}
		param.put("key", key == null ? "" : key);
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		return qnaMapper.selectQna(param);
	}

	@Override
	public List<QnaDto> detailQnaById(String id) {
		return qnaMapper.selectQnaById(id);
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
	public int deleteReply(Map<String, String> map) {
		return qnaMapper.deleteReply(map);
	}

	@Override
	public void replyCount(int no) {
		qnaMapper.replyCount(no);
	}

}
