package model;


import java.util.Date;

public class Bill {
	private String idbill;
	private String name;
	private String address;
	private String date;
	private String email;
	private String phone;
	private String status;
	public String getIdbill() {
		return idbill;
	}
	public void setIdbill(String idbill) {
		this.idbill = idbill;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Bill(String idbill, String name, String address, String date, String email, String phone, String status) {
		super();
		this.idbill = idbill;
		this.name = name;
		this.address = address;
		this.date = date;
		this.email = email;
		this.phone = phone;
		this.status = status;
	}
	public Bill() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
