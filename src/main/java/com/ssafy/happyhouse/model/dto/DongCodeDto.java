package com.ssafy.happyhouse.model.dto;

public class DongCodeDto {
	private String dongCode;
	private String dongName;
	private String gugunName;
	private String sidoName;
	
	public DongCodeDto() { }

	public DongCodeDto(String dongCode, String dongName, String gugunName, String sidoName) {
		super();
		this.dongCode = dongCode;
		this.dongName = dongName;
		this.gugunName = gugunName;
		this.sidoName = sidoName;
	}

	public String getDongCode() {
		return dongCode;
	}

	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}

	public String getDongName() {
		return dongName;
	}

	public void setDongName(String dongName) {
		this.dongName = dongName;
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
		return "DongCodeDto [dongCode=" + dongCode + ", dongName=" + dongName + ", gugunName=" + gugunName
				+ ", sidoName=" + sidoName + "]";
	}
}
