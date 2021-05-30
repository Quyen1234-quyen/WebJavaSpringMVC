package model;

public class ProductCategory {
	private String idpc;
	private String name;
	public String getIdpc() {
		return idpc;
	}
	public void setIdpc(String idpc) {
		this.idpc = idpc;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ProductCategory(String idpc, String name) {
		super();
		this.idpc = idpc;
		this.name = name;
	}
	public ProductCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
