package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.Bill;

@Repository 
public class BillDao {
	
	@Autowired 
	JdbcTemplate template3;
	public void setTemplate(JdbcTemplate template) {
		this.template3=template;
	}
	//get all
	public List<Bill> getAllBill(){
		return template3.query("select * from HOADON",new RowMapper<Bill>(){
			public Bill mapRow(ResultSet rs,int row) throws SQLException{
				Bill b= new Bill();
				b.setIdbill(rs.getString(1));
				b.setName(rs.getString(2));
				b.setAddress(rs.getString(3));
				b.setDate(rs.getString(4));
				b.setEmail(rs.getString(5));
				b.setPhone(rs.getString(6));
				b.setStatus(rs.getString(7));
				return b;
			}
		});
	}
	
	//add bill
	
	public int add(Bill bill) {
		String sql="insert into HOADON(MAHOADON,TENKHACHHANG,DIACHI,NGAYDATHANG,EMAIL,SODT,TRANGTHAI) values('"+
					bill.getIdbill()+"','"+bill.getName()+"','"+bill.getAddress()+"','"+bill.getDate()+"','"+bill.getEmail()+
					"','"+bill.getPhone()+"','"+bill.getStatus()+"')";
		return template3.update(sql);
	}
	//delete bill
	public  int delete(String id) {
		String sql="delete from HOADON where MAHOADON='"+id+"'";
		return  template3.update(sql);
	}
	//update bill
	public int update(String id) {
		String sql="update HOADON set TRANGTHAI='"+1+"' WHERE MAHOADON= '"+id+"'";
		return template3.update(sql);
	}
	
}
