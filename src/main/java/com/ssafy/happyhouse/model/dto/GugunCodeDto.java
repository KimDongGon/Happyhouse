package com.ssafy.happyhouse.model.dto;

public class GugunCodeDto {
	private String sidoName;
	private String gugunName;
	
	public GugunCodeDto() { }

	public GugunCodeDto(String sidoName, String gugunName) {
		super();
		this.sidoName = sidoName;
		this.gugunName = gugunName;
	}

	public String getGugunName() {
		return gugunName;
	}

	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}

	public String getSidoName() {
		return sidoName;
	}

	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}

	@Override
	public String toString() {
		return "GugunCodeDto [sidoName=" + sidoName + ", gugunName=" + gugunName + "]";
	}
	
}
