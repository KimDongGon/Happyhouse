package com.ssafy.happyhouse.model.dto;

public class GugunCodeDto {
	private String sidoCode;
	private String gugunCode;
	private String gugunName;
	
	public GugunCodeDto() { }

	public GugunCodeDto(String sidoCode, String gugunCode, String gugunName) {
		super();
		this.sidoCode = sidoCode;
		this.gugunCode = gugunCode;
		this.gugunName = gugunName;
	}

	public String getGugunCode() {
		return gugunCode;
	}

	public void setGugunCode(String gugunCode) {
		this.gugunCode = gugunCode;
	}

	public String getGugunName() {
		return gugunName;
	}

	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}

	public String getSidoCode() {
		return sidoCode;
	}

	public void setSidoCode(String sidoCode) {
		this.sidoCode = sidoCode;
	}

	@Override
	public String toString() {
		return "GugunCodeDto [sidoCode=" + sidoCode + ", gugunCode=" + gugunCode + ", gugunName=" + gugunName + "]";
	}
	
}
