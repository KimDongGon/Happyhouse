package com.ssafy.happyhouse.model.dto;

public class HouseDealDto {
	private int aptCode;
	private String AptName;
	private String dealAmount;
	private String dealYear;
	private String dealMonth;
	private String dealDay;
	private String area;
	private String floor;
	private String type;
	public HouseDealDto() {
		super();
	}
	public HouseDealDto(int aptCode, String aptName, String dealAmount, String dealYear, String dealMonth, String dealDay,
			String area, String floor, String type) {
		super();
		this.aptCode = aptCode;
		AptName = aptName;
		this.dealAmount = dealAmount;
		this.dealYear = dealYear;
		this.dealMonth = dealMonth;
		this.dealDay = dealDay;
		this.area = area;
		this.floor = floor;
		this.type = type;
	}
	public int getAptCode() {
		return aptCode;
	}
	public void setAptCode(int aptCode) {
		this.aptCode = aptCode;
	}
	public String getAptName() {
		return AptName;
	}
	public void setAptName(String aptName) {
		AptName = aptName;
	}
	public String getDealAmount() {
		return dealAmount;
	}
	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}
	public String getDealYear() {
		return dealYear;
	}
	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}
	public String getDealMonth() {
		return dealMonth;
	}
	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}
	public String getDealDay() {
		return dealDay;
	}
	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("HouseDeal [aptCode=");
		builder.append(aptCode);
		builder.append(", AptName=");
		builder.append(AptName);
		builder.append(", dealAmount=");
		builder.append(dealAmount);
		builder.append(", dealYear=");
		builder.append(dealYear);
		builder.append(", dealMonth=");
		builder.append(dealMonth);
		builder.append(", dealDay=");
		builder.append(dealDay);
		builder.append(", area=");
		builder.append(area);
		builder.append(", floor=");
		builder.append(floor);
		builder.append(", type=");
		builder.append(type);
		builder.append("]");
		return builder.toString();
	}
	
}
