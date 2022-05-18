package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper noticeMapper;
	
	
	@Override
	public List<NoticeDto> listNotice() {
		return noticeMapper.listNotice();
	}


	@Override
	public NoticeDto getNotice(int no) {
		return noticeMapper.getNotice(no);
	}


	@Override
	public void addNotice(NoticeDto noticeDto) {
		noticeMapper.addNotice(noticeDto);
	}

}
