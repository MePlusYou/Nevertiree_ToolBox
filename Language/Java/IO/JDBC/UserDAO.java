import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends BaseDAO {//implements
	public static void main(String[] args) {
		UserDAO dao = new UserDAO();

		List<UserVO> arr = dao.queryByPage("1", 1);
		System.out.println("should contain 10 records, actually return:");
		System.out.println( arr.size() );
		arr = dao.queryByPage("1", 2);
		System.out.println("should contain 5 records, actually return:");
		System.out.println( arr.size() );

		arr = dao.queryByPage("1dsfsf", 1);
		System.out.println("should contain 0 records, actually return:");
		System.out.println( arr.size() );
	}
	public int totalCount(String keyword) {
		int r = 0;
		Connection conn = this.connectMysql();
		try {
			String sql = "select count(*) from my_user where name like ?";
			String v = "%"+keyword+"%";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, v);
			ResultSet rs = ps.executeQuery();
			if(rs.next() ) {
				r = rs.getInt(1);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close(conn);
		}
		return r;
	}
	public List<UserVO> queryByPage(String keyword, int page) {
		List<UserVO> arr = new ArrayList<UserVO>();

		Connection conn = this.open();
		try {
			String sql = "select * from my_user where name like ? order by name limit ?, 10";
			String v = "%"+keyword+"%";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, v);
			ps.setInt(2, (page-1)*10);
			ResultSet rs = ps.executeQuery();
			while(rs.next() ) {
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				UserVO vo = new UserVO(name, pwd);
				arr.add(vo);
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			this.close(conn);
		}

		return arr;
	}
}
