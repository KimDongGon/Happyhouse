package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.NoticeDto;

public interface NoticeService {

	List<NoticeDto> listNotice();

	NoticeDto getNotice(int no);

	void addNotice(NoticeDto noticeDto);

}
