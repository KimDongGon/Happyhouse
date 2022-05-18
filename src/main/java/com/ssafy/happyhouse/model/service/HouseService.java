package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.DongCodeDto;
import com.ssafy.happyhouse.model.dto.GugunCodeDto;
import com.ssafy.happyhouse.model.dto.SidoCodeDto;

public interface HouseService {

	public List<SidoCodeDto> getSido();
	
//	public List<GugunCodeDto> getGugun(); 
//
//	public List<DongCodeDto> getDong();
}
