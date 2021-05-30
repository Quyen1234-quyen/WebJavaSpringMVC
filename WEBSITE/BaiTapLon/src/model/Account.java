package model;

public class Account {
	private String name;
	private String pass;
	private int level;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public Account(String name, String pass, int level) {
		super();
		this.name = name;
		this.pass = pass;
		this.level = level;
	}
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
