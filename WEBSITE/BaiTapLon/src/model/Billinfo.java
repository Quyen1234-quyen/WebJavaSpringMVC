package model;

public class Billinfo {
	private String idbill;
	private String idp;
	private int quantity;
	public String getIdbill() {
		return idbill;
	}
	public void setIdbill(String idbill) {
		this.idbill = idbill;
	}
	public String getIdp() {
		return idp;
	}
	public void setIdp(String idp) {
		this.idp = idp;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Billinfo(String idbill, String idp, int quantity) {
		super();
		this.idbill = idbill;
		this.idp = idp;
		this.quantity = quantity;
	}
	public Billinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
