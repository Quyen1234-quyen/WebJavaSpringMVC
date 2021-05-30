package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.Account;

@Repository 
public class AcountDao {
	@Autowired 
	JdbcTemplate account;
	
	public void setTemplate(JdbcTemplate template) {
		this.account=template;
	}
	
	public List<Account> getAllAccount(){
		return account.query("select * from ACCOUNT",new RowMapper<Account>(){
			public Account mapRow(ResultSet rs,int row) throws SQLException{
				Account a= new Account();
				a.setName(rs.getString(1));
				a.setPass(rs.getString(2));
				a.setLevel(rs.getInt(3));
				return a;
			}
		});
	}
}
