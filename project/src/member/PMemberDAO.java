package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.eclipse.jdt.internal.compiler.flow.SwitchFlowContext;

import com.mysql.jdbc.ResultSetMetaData;

public class PMemberDAO {
	
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	

	public Connection getConnection() throws Exception{	
// 	-- Connection : java.sql		
		Context init = new InitialContext();
//		-- Context : javax.naming
//		-- InitialContext() : javax.naming
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
//		-- init.lookup : object 타입 리턴 (- > DataSource 형 변환)
//		-- DataSource : java.sql;
		Connection con = ds. getConnection();
//		-- getConnection : DataSource -> Connection 형 변환 메서드
		return con;		
	}	
	
	
	public void cleaning(Connection con, PreparedStatement ps, ResultSet rs) {
//	-- PreparedStatement : java.sql
//	-- ResultSet : java.sql
		if(rs!=null) {
			try {rs.close();} 
			catch (SQLException ex) {}		
		}
		if(ps!=null) {				
			try {ps.close();} 
			catch (SQLException ex) {}				
		}
		if(con!=null) {				
			try {con.close();} 
			catch (SQLException ex) {}				
		}			
	}
	
	
	public int insertMember(PMemberBean mb) {
		
		int result=0;		
		try {
			con = getConnection();
			String sql ="insert into member"
					+ " (id, pass, name, reg_date, email, address, mobile, postCode, roadAddr, detailAddr)"
					+ " values(?,?,?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);			
				ps.setString(1,mb.getId());
				ps.setString(2,mb.getPass());
				ps.setString(3,mb.getName());
				ps.setTimestamp(4, mb.getReg_date());
				ps.setString(5, mb.getEmail());
				ps.setString(6, mb.getAddress());
				ps.setString(7, mb.getMobile());		
				ps.setString(8, mb.getPostCode());
				ps.setString(9, mb.getRoadAddr());
				ps.setString(10, mb.getDetailAddr());
				System.out.println(ps);
			result = ps.executeUpdate();	 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cleaning(con, ps, rs);
		}		
		return result;
	}
	

	public int updateMember(PMemberBean mb) {
		
		int result=0;		
		try {
			con = getConnection();
			String sql ="update member set email=?, mobile=?, postCode=?, roadAddr=?, detailAddr=?, address=? where id=?";
			ps = con.prepareStatement(sql);			
				ps.setString(1,mb.getEmail());
				ps.setString(2,mb.getMobile());		
				ps.setString(3,mb.getPostCode());
				ps.setString(4,mb.getRoadAddr());
				ps.setString(5,mb.getDetailAddr());
				ps.setString(6,mb.getAddress());
				ps.setString(7,mb.getId());
			result = ps.executeUpdate();	 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cleaning(con, ps, rs);
		}		
		return result;
	}
	
	

	public int userCheck(String id, String pass) {
		try {
			con = getConnection();
			String sql = "select * from member where id=?";
			
			ps = con.prepareStatement(sql);	
				ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(!rs.next()) {
				return -1;

			}
			else {	
					if(rs.getString("pass").equals(pass)) {
						return 1;	// 아이디 패스워드 동일
					}
					else {
						return 0;	// 패스워드 xx 
					}
	//			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cleaning(con, ps, rs);
		}	
		return -1;
	}
	
	
	
	public PMemberBean select(String id) {
		
		try {
				con = getConnection();
				String sql ="select * from member where id=?";
				ps = con.prepareStatement(sql);			
				ps.setString(1,id);
				rs = ps.executeQuery();
		
				if(rs.next()) {
					
				  PMemberBean mb = new PMemberBean(rs.getString("id"), rs.getString("pass"), rs.getString("name"), 
				 			rs.getTimestamp("reg_date"), rs.getString("email"), rs.getString("address"), 
				 			rs.getString("mobile"), rs.getString("postCode"), rs.getString("roadAddr"), rs.getString("detailAddr"));
				return mb;
				}	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				cleaning(con, ps, rs);
			}	
			return null;
		}
		
		
	
	
	public int deleteMember(String id, String pass) {
		
		int result = -1;
		try {			
		Connection con = getConnection();

		String sql = "delete from member where id=? and pass=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,id);
		ps.setString(2,pass);
//		System.out.println(ps);
		result = ps.executeUpdate();
		} 
		
		catch (Exception e) {		// 예외가 발생하면
			e.printStackTrace();
		} 
		
		finally {	// 예외 발생 상관없이 처리되는 문장
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}	

	
	
	
	
	