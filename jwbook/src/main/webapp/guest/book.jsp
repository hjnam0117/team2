<%-- book.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookstore.book"%>
<%@ page import="bookstore.Bookdao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 정보</title>
<link rel="Stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="guest_top.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1>도서 정보</h1>
		</div>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		Bookdao dao = Bookdao.getInstance();
		book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="../images/<%=book.getImg()%>" style="width: 100%" />
			</div>
			<div class="col-md-8">
				<h4><b>[<%=book.getCategory()%>] <%=book.getName()%></b></h4><br>
				<p><%=book.getDescrip()%></p>
				<p><b>도서 번호</b> : <%=book.getBookid()%></p>
				<p><b>도서 저자</b> : <%=book.getWriter()%></p>
				<p><b>출판사</b> : <%=book.getPublisher()%></p>
				<p><b>출판일</b> : <%=book.getReleaseDate()%></p>
				<p><b>도서 재고</b> : <%=book.getStock()%></p><br>
				<h4><%=book.getPrice()%>원</h4><br>
				<p><a href="#" class="btn btn-info">구매하기 &raquo;</a> 
				<a href="./books.jsp" class="btn btn-secondary">전체도서 &raquo;</a></p><br>
			</div>
		<br><hr>
	</div>
	<%@ include file="guest_bottom.jsp" %>   
</body>
</html>