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
			rs.close();
		}catch(SQLException e) {e.printStackTrace();}
	}
	
	public int insertCart(cart cart) {
		int rows = 0;
		try {
			Connection conn=open();
			String sql =
					"INSERT INTO cart(cartid, bookid, bookname, bookwriter, bookcount, totalprice) values(?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getBookid());
			pstmt.setString(2,  cart.getBookname());
			pstmt.setString(3,  cart.getBookwriter());
			pstmt.setInt(4, cart.getBookcount());
			pstmt.setInt(5, cart.getTotalprice());
			pstmt.setInt(6, cart.getCartid());
			
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
	

	public List<cart> selectAllCartList(int cartid) {

		List<cart> list = new ArrayList<cart>();
		try {
			Connection conn=open();

			String sql = "select * from cart where cartid = ? id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				cart cart = new cart();
				cart.setBookid(rs.getInt("bookid"));
				cart.setId(rs.getString("id"));
				cart.setBookname(rs.getString("bookname"));
				cart.setBookcount(rs.getInt("bookcount"));
				cart.setTotalprice(rs.getInt("totalprice"));
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