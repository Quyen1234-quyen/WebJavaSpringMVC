package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import model.Product;
import model.ProductCategory;

public class ProductCategoryDao {
	@Autowired 
	JdbcTemplate a;
	public void setTemplate(JdbcTemplate a) {
		this.a=a;
	}
	public List<ProductCategory> getAllProdC(){
		return a.query("select * from DANHMUC",new RowMapper<ProductCategory>(){
			public ProductCategory mapRow(ResultSet rs,int row) throws SQLException{
				ProductCategory pc= new ProductCategory();
				pc.setIdpc(rs.getString(1));
				pc.setName(rs.getString(2));
				return pc  ;
			}
		});
	}
}
