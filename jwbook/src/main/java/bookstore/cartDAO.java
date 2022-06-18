package bookstore;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookstore.cart;

public class cartDAO {
	private static cartDAO _dao;
	private static int count = 0;
	static {
		_dao = new cartDAO();
	}

	public static cartDAO getDAO() {
		return _dao;
	}
	
	Connection conn=null;
	private PreparedStatement pstmt;
	private ResultSet rs;
	final String JDBC_DRIVER="org.h2.Driver";
	final String JDBC_URL="jdbc:h2:tcp://localhost/~/jwbookdb";
	
	public Connection open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn=DriverManager.getConnection(JDBC_URL, "jwbook", "1234");
		}catch(Exception e) {e.printStackTrace();}
		return conn;
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close();

		}catch(SQLException e) {e.printStackTrace();}
	}
	
	public int insertCart(book b) {
		int rows = 0;
		try {
			Connection conn=open();
			count++;
			String sql =
			"INSERT INTO cart(cartid, bookid, bookname, bookwriter, bookcount, totalprice) values(?,?,?,?,1,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, b.getBookid());
			pstmt.setString(3,  b.getName());
			pstmt.setString(4,  b.getWriter());
			pstmt.setInt(5, b.getPrice());
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Cart 테이블 insert 오류 => " + e.getMessage());
		} finally {close();}
		return rows;
	}

	public int updateCart(cart cart) {
		int rows = 0;
		try {
			Connection conn=open();

			String sql =
					"update cart set totalprice=? bookcount=? where cartid = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getTotalprice());
			pstmt.setInt(2,  cart.getBookcount());
			pstmt.setInt(3, cart.getCartid());
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Cart 테이블 update 오류 => " + e.getMessage());
		} finally {
			close();
		}
		return rows;
	}

	public int deleteCart(int cartid) {
		int rows = 0;
		try {
			Connection conn=open();

			String sql = "delete from cart where Cartid= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartid);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cart 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close();
		}
		return rows;
	}
	
	public int clearCart(String id) {
		int rows = 0;
		try {
			Connection conn=open();

			String sql = "delete from cart where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cart 테이블 clear 오류 => " + e.getMessage());
		} finally {
			close();
		}
		return rows;
	}
	

	public ArrayList<cart> selectAllCartList() {

		ArrayList<cart> list = new ArrayList<cart>();
		try {
			Connection conn=open();

			String sql = "select * from cart";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				cart cart = new cart();
				cart.setCartid(rs.getInt("cartid"));
				cart.setBookid(rs.getInt("bookid"));
				cart.setBookname(rs.getString("bookname"));
				cart.setBookcount(rs.getInt("bookcount"));
				cart.setTotalprice(rs.getInt("totalprice"));
				System.out.println(cart.getBookid());
				list.add(cart);
			}
		} catch (SQLException e) {
			System.out.println("cart 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close();
		}
		return list;
	}
}