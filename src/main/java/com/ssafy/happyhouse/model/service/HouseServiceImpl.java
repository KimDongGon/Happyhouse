package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.DongCodeDto;
import com.ssafy.happyhouse.model.dto.GugunCodeDto;
import com.ssafy.happyhouse.model.dto.SidoCodeDto;
import com.ssafy.happyhouse.model.mapper.CodeMapper;

@Service
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	private CodeMapper codeMapper;

	@Override
	public List<SidoCodeDto> getSido() {
		return codeMapper.getSido();
	}

//	@Override
//	public List<GugunCodeDto> getGugun() {
//		return codeMapper.getGugun();
//	}
//
//	@Override
//	public List<DongCodeDto> getDong() {
//		return codeMapper.getDong();
//	}

}
