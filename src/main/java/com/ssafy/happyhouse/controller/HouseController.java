package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseDto;
import com.ssafy.happyhouse.model.mapper.HouseMapper;

@RestController
@RequestMapping("/house")
@CrossOrigin("*")
public class HouseController {
	
	@Autowired
	private HouseMapper houseMapper;
	
	@GetMapping("/search") 
	public ResponseEntity<?> search(@RequestParam Map<String, String> map, Model model) {
		try {
			List<HouseDto> list = houseMapper.search(map);
			if (list != null && !list.isEmpty()) {
				return new ResponseEntity<List<HouseDto>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			return exceptionHandling(e);
		}
	}
	
	private ResponseEntity<String> exceptionHandling(Exception e) {
		e.printStackTrace();
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
