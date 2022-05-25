package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.HouseDto;

public interface HouseService {
	public List<HouseDto> search(int offset, int limit, int dongCode, String apartmentName);
	public int getTotalCount(int dongCode);

}
