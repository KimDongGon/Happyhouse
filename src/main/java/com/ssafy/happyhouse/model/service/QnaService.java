package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnaDto;

public interface QnaService {
	public List<QnaDto> retrieveQna();
	public QnaDto detailQna(int no);
	public boolean writeQna(QnaDto qnaDto);
	public boolean updateQna(QnaDto qnaDto);
	public boolean deleteQna(int no);
}
