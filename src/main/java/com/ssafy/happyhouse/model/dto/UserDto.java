package com.ssafy.happyhouse.model.dto;

public class UserDto {
	private String id;
	private String password;
	private String name;
	private String address;
	private String number;
	
	public UserDto() {
	};

	public UserDto(String id, String password, String name, String address, String number) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.address = address;
		this.number = number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "UserDto [id=" + id + ", password=" + password + ", name=" + name + ", address=" + address + ", number="
				+ number + "]";
	}

	
}
