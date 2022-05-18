package com.ssafy.happyhouse.model.dto;

public class DongCodeDto {
	private String dongCode;
	private String dongName;
	private String gugunCode;
	private String sidoCode;
	
	public DongCodeDto() { }
	
	public DongCodeDto(String dongCode, String dongName, String gugunCode, String sidoCode) {
		super();
		this.dongCode = dongCode;
		this.dongName = dongName;
		this.gugunCode = gugunCode;
		this.sidoCode = sidoCode;
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

	public String getGugunCode() {
		return gugunCode;
	}

	public void setGugunCode(String gugunCode) {
		this.gugunCode = gugunCode;
	}

	public String getSidoCode() {
		return sidoCode;
	}

	public void setSidoCode(String sidoCode) {
		this.sidoCode = sidoCode;
	}

	@Override
	public String toString() {
		return "DongCodeDto [dongCode=" + dongCode + ", dongName=" + dongName + ", gugunCode=" + gugunCode
				+ ", sidoCode=" + sidoCode + "]";
	}

}
