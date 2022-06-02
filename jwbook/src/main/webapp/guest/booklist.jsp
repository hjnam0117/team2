<%-- booklist.jsp --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bookstore.book"%>
<%@ page import="bookstore.Bookdao"%>
<html>
<head>
<link rel="Stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>도서 목록</title>
<style type="text/css">
	a {color:black; text-decoration-line: none !important; }
	.col-md-3, .col-md-8 {float:left;}
</style>
</head>
<body>
	<%@ include file="guest_top.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1>전체 도서</h1>
		</div>
	</div>
	<%
		Bookdao dao = Bookdao.getInstance();
		ArrayList<book> listOfBooks = dao.getAllBooks();
	%>
	
	<div class="container">
		<%
			for (int i = 0; i < listOfBooks.size(); i++) {
				book book = listOfBooks.get(i);
		%>
		<div class="row"><a href="./book.jsp?id=<%=book.getBookid()%>">
			<div class="col-md-3" align="center">
				<img src="../images/<%=book.getImg()%>" style="width: 80%">
			</div>
			<div class="col-md-8">
				<h5><b>[<%=book.getCategory()%>] <%=book.getName()%></b></h5>
				<p style="padding-top: 40px"><%=book.getDescrip()%>...</p>
				<p style="color:#999"><b><%=book.getWriter()%> | <%=book.getPublisher()%> | <%=book.getReleaseDate()%></b></p>
				<p style="font-size:24px; color:#f30"><b><%=book.getPrice()%> 원</b></p>
			</div>
		</a></div>
		<hr><br>
		<%
			}
		%>
	</div>
	<%@ include file="guest_bottom.jsp" %>   
</body>
</html>