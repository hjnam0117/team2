package bookstore;

public class book{
	private int bookid;
	private String category;
	private String name;
	private String writer;
	private String descript;
	private int price;
	private int stock;
	private String soldout;
	private String publisher;
	private String releaseDate;
	private String img;
	private String rank;
	private int krank;
	private int arank;
	private int prank;
	private int irank;
	private int yrank;
	
	public book() {
		super();
	}
	public book(int bookid, String name, String publisher) {
		this.bookid = bookid;
		this.name = name;
		this.publisher = publisher;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getSoldout() {
		return soldout;
	}
	public void setSoldout(String soldout) {
		this.soldout = soldout;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	public int getKrank() {
		return krank;
	}
	public void setKrank(int krank) {
		this.krank = krank;
	}
	public int getArank() {
		return arank;
	}
	public void setArank(int arank) {
		this.arank = arank;
	}
	public int getPrank() {
		return prank;
	}
	public void setPrank(int prank) {
		this.prank = prank;
	}
	public int getIrank() {
		return irank;
	}
	public void setIrank(int irank) {
		this.irank = irank;
	}
	public int getYrank() {
		return yrank;
	}
	public void setYrank(int yrank) {
		this.yrank = yrank;
	}
}