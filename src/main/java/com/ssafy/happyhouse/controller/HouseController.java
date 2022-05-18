package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.HouseDto;
import com.ssafy.happyhouse.model.mapper.HouseMapper;

@Controller
@RequestMapping("/house")
public class HouseController {
	
	@Autowired
	private HouseMapper houseMapper;
	
	@PostMapping("/search") 
	public String search(@RequestParam Map<String, String> map, Model model) {
		List<HouseDto> list = houseMapper.search(map);
		model.addAttribute("aptList", list);
		return "/house/searchHouseDeal";
	}
}
