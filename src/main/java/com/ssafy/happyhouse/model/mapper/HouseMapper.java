package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.HouseDto;

public interface HouseMapper {
	List<HouseDto> search(int offset, int limit, String dongCode, String apartmentName);

	int getTotalCount(String dongCode);
}
