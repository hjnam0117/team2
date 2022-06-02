<%-- addbook.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookstore.book"%>
<%@ page import="bookstore.Bookdao"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%
	String filename = "";
	String realFolder = "C:\\upload"; // 웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; // 인코딩 타입
	int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기5MB
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, 
			new DefaultFileRenamePolicy());

	String bookid = multi.getParameter("bookid");
	String name = multi.getParameter("name");
	String writer = multi.getParameter("writer");
	String category = multi.getParameter("category");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String description = multi.getParameter("description");	
	String unitprice = multi.getParameter("price");
	String unitstock = multi.getParameter("stock");
	String soldout = multi.getParameter("soldout");
	
	Enumeration<?> files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String img = multi.getFilesystemName(fname);
	
	Bookdao dao = Bookdao.getInstance();
	
	int bookId;
	Integer price, stock;
	if (bookid.isEmpty()) bookId = dao.getNumber()+1;
	else bookId = Integer.parseInt(bookid);
	if (unitprice.isEmpty()) price = 0;
	else price = Integer.valueOf(unitprice);
	if (unitstock.isEmpty()) stock = 0;
	else stock = Integer.valueOf(unitstock);

	book book = new book();
	book.setBookid(bookId);
	book.setName(name);
	book.setWriter(writer);
	book.setCategory(category);
	book.setPublisher(publisher);
	book.setReleaseDate(releaseDate);
	book.setDescrip(description);
	book.setPrice(price);
	book.setStock(stock);
	book.setSoldout(soldout);
	book.setImg(img);
	dao.addBook(book);
	
	response.sendRedirect("booklist.jsp");
%>