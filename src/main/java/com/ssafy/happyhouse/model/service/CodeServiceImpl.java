package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.DongCodeDto;
import com.ssafy.happyhouse.model.dto.GugunCodeDto;
import com.ssafy.happyhouse.model.dto.SidoCodeDto;
import com.ssafy.happyhouse.model.mapper.CodeMapper;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper codeMapper;

	@Override
	public List<SidoCodeDto> getSido() {
		return codeMapper.getSido();
	}

	@Override
	public List<GugunCodeDto> getGugun(String sidoName) {
		return codeMapper.getGugun(sidoName);
	}

	@Override
	public List<DongCodeDto> getDong(Map<String, String> map) {
		return codeMapper.getDong(map);
	}
	
}
