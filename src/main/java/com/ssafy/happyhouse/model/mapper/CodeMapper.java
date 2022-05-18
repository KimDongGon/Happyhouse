package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.DongCodeDto;
import com.ssafy.happyhouse.model.dto.GugunCodeDto;
import com.ssafy.happyhouse.model.dto.SidoCodeDto;

public interface CodeMapper {

	List<SidoCodeDto> getSido();

	List<GugunCodeDto> getGugun(String sidoCode);

	List<DongCodeDto> getDong(Map<String, String> map);

}
