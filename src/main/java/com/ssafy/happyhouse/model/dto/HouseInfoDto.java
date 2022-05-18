package com.ssafy.happyhouse.model.dto;

public class HouseInfoDto {
	private int aptCode;
	private String buildYear;
	private String dongName;
	private String jibun;
	private String aptName;
	private String sidoCode;
	private String gugunCode;
	private String dongCode;
	public HouseInfoDto() {
		super();
	}
	public HouseInfoDto(int aptCode, String buildYear, String dongName, String jibun, String aptName, String sidoCode,
			String gugunCode, String dongCode) {
		super();
		this.aptCode = aptCode;
		this.buildYear = buildYear;
		this.dongName = dongName;
		this.jibun = jibun;
		this.aptName = aptName;
		this.sidoCode = sidoCode;
		this.gugunCode = gugunCode;
		this.dongCode = dongCode;
	}
	public int getAptCode() {
		return aptCode;
	}
	public void setAptCode(int aptCode) {
		this.aptCode = aptCode;
	}
	public String getBuildYear() {
		return buildYear;
	}
	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}
	public String getDongName() {
		return dongName;
	}
	public void setDongName(String dongName) {
		this.dongName = dongName;
	}
	public String getJibun() {
		return jibun;
	}
	public void setJibun(String jibun) {
		this.jibun = jibun;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}
	public String getSidoCode() {
		return sidoCode;
	}
	public void setSidoCode(String sidoCode) {
		this.sidoCode = sidoCode;
	}
	public String getGugunCode() {
		return gugunCode;
	}
	public void setGugunCode(String gugunCode) {
		this.gugunCode = gugunCode;
	}
	public String getDongCode() {
		return dongCode;
	}
	public void setDongCode(String dongCode) {
		this.dongCode = dongCode;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("HouseInfo [aptCode=");
		builder.append(aptCode);
		builder.append(", buildYear=");
		builder.append(buildYear);
		builder.append(", dongName=");
		builder.append(dongName);
		builder.append(", jibun=");
		builder.append(jibun);
		builder.append(", aptName=");
		builder.append(aptName);
		builder.append(", sidoCode=");
		builder.append(sidoCode);
		builder.append(", gugunCode=");
		builder.append(gugunCode);
		builder.append(", dongCode=");
		builder.append(dongCode);
		builder.append("]");
		return builder.toString();
	}
	
	
}
