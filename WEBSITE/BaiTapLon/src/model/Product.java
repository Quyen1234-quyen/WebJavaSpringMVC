package model;

public class Product {
	private String id;
	private String name;
	private String des;
	private String img;
	private float price;
	private String idpc;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String id, String name, String des, String img, float price, String idpc) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
		this.img = img;
		this.price = price;
		this.idpc = idpc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getIdpc() {
		return idpc;
	}
	public void setIdpc(String idpc) {
		this.idpc = idpc;
	}
	
}
