package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.DongCodeDto;
import com.ssafy.happyhouse.model.dto.GugunCodeDto;
import com.ssafy.happyhouse.model.dto.SidoCodeDto;

public interface CodeService {
	List<SidoCodeDto> getSido();

	List<GugunCodeDto> getGugun(String sidoName);

	List<DongCodeDto> getDong(Map<String, String> map);
}