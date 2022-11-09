package user.model;
import java.sql.*;

import common.util.DBUtilMulti;
public class UserDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	/** DAO 기본 생성자 */
	public UserDAO() {
		System.out.println("UserDAO생성자()...");
	}

	/** CLOSE 하는 메서드. */
	public void close() {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
		}catch(SQLException e) {
			System.out.println("close() error: "+e);
		}
	}
	
	/** DB접근해서 인서트하는 메서드 */
	public int insertUser(UserVO user) throws SQLException{
		try {
			con=DBUtilMulti.getCon();
			StringBuilder buf=new StringBuilder("insert into member")
					.append(" values(member_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate,1000,0)");
			String sql=buf.toString();
			
			ps=con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getUserid());
            ps.setString(3, user.getPwd());
            ps.setString(4, user.getHp1());
            ps.setString(5, user.getHp2());
            ps.setString(6, user.getHp3());
            ps.setString(7, user.getPost());
            ps.setString(8, user.getAddr1());
            ps.setString(9, user.getAddr2());
            int n=ps.executeUpdate();           
			return n;
		}finally {
			close();
		}
	}
}
