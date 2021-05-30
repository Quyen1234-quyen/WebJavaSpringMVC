package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.Billinfo;
import model.Product;
@Repository 
public class BillinfoDao {
	@Autowired 
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	//get all
	public List<Billinfo> getAllBillinfo(){
		return template.query("select * from CHITIETHOADON",new RowMapper<Billinfo>(){
			public Billinfo mapRow(ResultSet rs,int row) throws SQLException{
				Billinfo b= new Billinfo();
				b.setIdbill(rs.getString(1));
				b.setIdp(rs.getString(2));
				b.setQuantity(rs.getInt(3));
				return b;
			}
		});
	}
	// add billinfo
	public int add(Billinfo bill) {
		String sql="insert into CHITIETHOADON values('"+bill.getIdbill()+"','"+bill.getIdp()+"','"+bill.getQuantity()+"')";
		return template.update(sql);
	}
}
