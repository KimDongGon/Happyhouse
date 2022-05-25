package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.HouseDto;
import com.ssafy.happyhouse.model.mapper.HouseMapper;

@Service
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	private HouseMapper houseMapper;

	@Override
	public int getTotalCount(int dongCode) {
		return houseMapper.getTotalCount(dongCode);
	}

	@Override
	public List<HouseDto> search(int offset, int limit, int dongCode, String apartmentName) {
		return houseMapper.search(offset, limit, dongCode, apartmentName);
	}
}
