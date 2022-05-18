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
	public List<NoticeDto> retrieveNotice() {
		return noticeMapper.selectNotice();
	}

	@Override
	public NoticeDto detailNotice(int no) {
		return noticeMapper.selectNoticeByNo(no);
	}

	@Override
	public boolean writeNotice(NoticeDto noticeDto) {
		return noticeMapper.insertNotice(noticeDto) == 1;
	}

	@Override
	public boolean updateNotice(NoticeDto noticeDto) {
		return noticeMapper.updateNotice(noticeDto) == 1;
	}

	@Override
	public boolean deleteNotice(int no) {
		return noticeMapper.deleteNotice(no) == 1;
	}
	

}
