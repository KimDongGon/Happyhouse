package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.QnaDto;

@Mapper
public interface QnaMapper {
	public List<QnaDto> selectQna();
	public QnaDto selectQnaByNo(int no);
	public int insertQna(QnaDto qnaDto);
	public int updateQna(QnaDto qnaDto);
	public int deleteQna(int no);
}

