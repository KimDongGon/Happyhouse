package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.NoticeDto;

@Mapper
public interface NoticeMapper {

	List<NoticeDto> selectNotice();
	NoticeDto selectNoticeByNo(int no);
	int insertNotice(NoticeDto noticeDto);
	int updateNotice(NoticeDto noticeDto);
	int deleteNotice(int no);
}
