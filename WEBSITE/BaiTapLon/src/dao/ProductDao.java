package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.temporal.TemporalAmount;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.Product;

@Repository 
public class ProductDao {
	@Autowired 
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	public List<Product> getAllProd(){
		return template.query("select * from SANPHAM",new RowMapper<Product>(){
			public Product mapRow(ResultSet rs,int row) throws SQLException{
				Product p= new Product();
				p.setId(rs.getString(1));
				p.setName(rs.getString(2));
				p.setDes(rs.getString(3));
				p.setImg(rs.getString(4));
				p.setPrice(rs.getFloat(5));
				p.setIdpc(rs.getString(6));
				return p  ;
			}
		});
	}
	public ArrayList<Product> getPrdById( String id) {
		String  sql="select * from  SANPHAM  where  MASANPHAM ='"+id+"'";
		ArrayList<Product> list=new ArrayList<>();
	      List<Map<String, Object>> rows = template.queryForList(sql);
	       for(Map<String, Object> row : rows){
	    	   Product p= new Product();
	    	   p.setId(row.get("MASANPHAM").toString());
	    	   p.setName(row.get("TENSANPHAM").toString());
	    	   p.setDes(row.get("MIEUTA").toString());
	    	   p.setImg(row.get("IMG").toString());
	    	   float a=Float.parseFloat(row.get("GIA").toString()); 
	    	   p.setPrice(a);
	    	   p.setIdpc(row.get("MADANHMUC").toString());
	    	   list.add(p);
	        }
		return list;
		
	}
	public ArrayList<Product> getAllProdC(String id){
		String  sql="select * from  SANPHAM  where  MADANHMUC like '"+id+"'";
		ArrayList<Product> list=new ArrayList<>();
	      List<Map<String, Object>> rows = template.queryForList(sql);
	       for(Map<String, Object> row : rows){
	    	   Product p= new Product();
	    	   p.setId(row.get("MASANPHAM").toString());
	    	   p.setName(row.get("TENSANPHAM").toString());
	    	   p.setDes(row.get("MIEUTA").toString());
	    	   p.setImg(row.get("IMG").toString());
	    	   float a=Float.parseFloat(row.get("GIA").toString()); 
	    	   p.setPrice(a);
	    	   p.setIdpc(row.get("MADANHMUC").toString());
	    	   list.add(p);
	        }
		return list;
	}
	public  int delete(String id) {
		String sql="delete from SANPHAM where MASANPHAM='"+id+"'";
		return  template.update(sql);
	}
	public int save(Product p) {
		String sql="insert into SANPHAM values('"+p.getId()+"','"+p.getName()+"','"+
				p.getDes()+"','"+p.getImg()+"',"+p.getPrice()+",'"+p.getIdpc()+"')";
		return template.update(sql);
	}
	public int update(Product p) {
		String sql="update SANPHAM set TENSANPHAM='"+p.getName()+"',MIEUTA='"+p.getDes()+"',IMG='"+p.getImg()+
				"',GIA='"+p.getPrice()+"',MADANHMUC='"+p.getIdpc()+"' WHERE MASANPHAM='"+p.getId()+"'";
		return template.update(sql);
	}
}
