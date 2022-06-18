package bookstore;

public class cart {
	private int cartid;
	private int bookid;//번호
	private String bookname;//책 이름
	private String bookwriter;//작가
	private int bookcount;//주문 수량
	private int totalprice;//가격
	private String id;
	
	public cart() {}
	public cart(int cartid, int bookid, String bookname, String bookwriter, int bookcount, int totalprice, String id) {
		super();
		this.cartid=cartid;
		this.bookid=bookid;
		this.bookname=bookname;
		this.bookwriter=bookwriter;
		this.totalprice=totalprice;
		this.bookcount=bookcount;
	}

	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookwriter() {
		return bookwriter;
	}
	public void setBookwriter(String bookwriter) {
		this.bookwriter = bookwriter;
	}
	public int getBookcount() {
		return bookcount;
	}
	public void setBookcount(int bookcount) {
		this.bookcount = bookcount;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	
}