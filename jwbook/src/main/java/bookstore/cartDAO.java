package bookstore;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class cartDAO {
	private static cartDAO _dao;
	private static int count = 0;
	
	final String JDBC_DRIVER="org.h2.Driver";
	final String JDBC_URL="jdbc:h2:tcp://localhost/~/jwbookdb";
	
	public Connection open() {
		Connection conn=null;
		try {	
			Class.forName(JDBC_DRIVER);
			conn=DriverManager.getConnection(JDBC_URL, "jwbook", "1234");
		}catch(Exception e) {e.printStackTrace();}
		return conn;
	}
	
	public int insertCart(book b, String id) {
		int rows = 0;
		String s=selectCart(b.getBookid(), id);
		if(s=="TRUE") insert(b, id);
		else update(b.getBookid(), id);

		return rows;
	}
	public int insert(book b, String id) {
		int rows = 0;
		try {
			Connection conn=open();
			String sql =
				"INSERT INTO cart(cartid, bookid, bookname, bookwriter, bookcount, totalprice, userid) values(?,?,?,?,1,?,?)";
				PreparedStatement pstmt=conn.prepareStatement(sql);
				try(conn; pstmt) {
				count++;	
				pstmt.setInt(1, count);
				pstmt.setInt(2, b.getBookid());
				pstmt.setString(3,  b.getName());
				pstmt.setString(4,  b.getWriter());
				pstmt.setInt(5, b.getPrice());
				pstmt.setString(6, id);			
				rows = pstmt.executeUpdate();
				}
		} catch (Exception e) {
				System.out.println("Cart 테이블 insert 오류 => " + e.getMessage());
		}
		return rows;
			
	}
	public int update(int bookid, String id) {
		int rows = 0;
		try {
			Connection conn=open();
			String sql =
					"update cart set count = count + 1 where bookid=? and userid=?";
			PreparedStatement pstmt=conn.prepareStatement(sql);

			pstmt.setInt(1, bookid);
			pstmt.setString(2, id);
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Cart 테이블 update 오류 => " + e.getMessage());
		}
		return rows;
	}
	public String selectCart(int bookid, String id) {
		String s = null;
		try {
			Connection conn=open();
			String sql =
			"select exists(select bookid, userid from cart where bookid=? and userid=?) as isChk";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			pstmt.setString(2, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) s = "TRUE";
			else s = "FALSE";
		} catch (Exception e) {
			System.out.println("Cart 테이블 select 오류 => " + e.getMessage());
		}
		return s;
	}
	public int updateCart(cart cart) {
		int rows = 0;
		try {
			Connection conn=open();

			String sql =
					"update cart set totalprice=? bookcount=? where cartid = ?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getTotalprice());
			pstmt.setInt(2,  cart.getBookcount());
			pstmt.setInt(3, cart.getCartid());
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Cart 테이블 update 오류 => " + e.getMessage());
		}
		return rows;
	}

	public int deleteCart(String id) {
		int rows = 0;
		try {
			Connection conn=open();
			String sql = "delete from cart where userid=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cart 테이블 delete 오류 => " + e.getMessage());
		}
		return rows;
	}
	
	public int clearCart(String id) {
		int rows = 0;
		try {
			Connection conn=open();

			String sql = "delete from cart where id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cart 테이블 clear 오류 => " + e.getMessage());
		}
		return rows;
	}
	

	public ArrayList<cart> selectAllCartList(String id) {
		Connection conn=open();
		ArrayList<cart> list = new ArrayList<cart>();
		try {
			String sql = "select * from cart where userid=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				cart cart = new cart();
				cart.setCartid(rs.getInt("cartid"));
				cart.setBookid(rs.getInt("bookid"));
				cart.setBookwriter(rs.getString("bookwriter"));
				cart.setBookname(rs.getString("bookname"));
				cart.setBookcount(rs.getInt("bookcount"));
				cart.setTotalprice(rs.getInt("totalprice"));
				list.add(cart);
			}
		} catch (SQLException e) {
			System.out.println("cart 테이블 selectAll 오류 => " + e.getMessage());
		}
		return list;
	}
}