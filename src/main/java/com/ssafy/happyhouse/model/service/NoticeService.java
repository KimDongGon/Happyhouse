package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.dto.QnaDto;

public interface NoticeService {

	List<NoticeDto> retrieveNotice();
	NoticeDto detailNotice(int no);
	boolean writeNotice(NoticeDto noticeDto);
	boolean updateNotice(NoticeDto noticeDto);
	boolean deleteNotice(int no);
}
