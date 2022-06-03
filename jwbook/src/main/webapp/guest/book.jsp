<%-- book.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bookstore.book"%>
<%@ page import="bookstore.Bookdao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 정보</title>
<link rel="Stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="guest_top.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1>도서 정보</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="${book.img}" style="width: 80%">
			</div>
			<div class="col-md-8">
				<h4><b>[${book.category}] ${book.name}</b></h4><br>
				<p>${book.descript}</p>
				<p><b>도서 번호</b> : ${book.bookid}</p>
				<p><b>도서 저자</b> : ${book.writer}</p>
				<p><b>출판사</b> : ${book.publisher}</p>
				<p><b>출판일</b> : ${book.releaseDate}</p>
				<p><b>도서 재고</b> : ${book.stock}</p><br>
				<h4>${book.price} 원</h4><br>
				<p><a href="#" class="btn btn-info">구매하기 &raquo;</a> 
				<a href="book.nhn?acton=listBook" class="btn btn-secondary">전체도서 &raquo;</a></p><br>
			</div>
		<br><hr></div>
	</div>
	<%@ include file="guest_bottom.jsp" %>   
</body>
</html>