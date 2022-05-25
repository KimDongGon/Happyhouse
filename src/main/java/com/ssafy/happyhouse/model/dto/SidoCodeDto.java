package com.ssafy.happyhouse.model.dto;

public class SidoCodeDto {
	private String sidoName;

	
	public SidoCodeDto() {	}

	public SidoCodeDto(String sidoName) {
		super();
		this.sidoName = sidoName;
	}

	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}

	@Override
	public String toString() {
		return "SidoCodeDto [sidoName=" + sidoName + "]";
	}
	
	
}
