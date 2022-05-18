package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.dto.NoticeDto;

public interface NoticeMapper {

	List<NoticeDto> listNotice();

	NoticeDto getNotice(int no);

	void addNotice(NoticeDto noticeDto);

}
