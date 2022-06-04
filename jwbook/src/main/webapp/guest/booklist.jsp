<%-- booklist.jsp --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="Stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
	<ul class="container">
		<c:forEach var="book" items="${booklist}" varStatus="status">
			<li class="row"><a href="book?action=getBook&bookid=${status.count}">
				<div class="col-md-3" align="center">
					<img src="${book.img}" style="width: 80%">
				</div>
				<div class="col-md-8">
					<h5><b>[${book.category}] ${book.name}</b></h5>
					<p style="padding-top: 40px">${book.descript}...</p>
					<p style="color:#999"><b>${book.writer} | ${book.publisher} | ${book.releaseDate}</b></p>
					<p style="font-size:24px; color:#f30"><b>${book.price} 원</b></p>
				</div>
			</a></li>
			<hr><br>
		</c:forEach>
	</ul>
	<c:if test="${error != null}">
		<div class="alert alert-danger alert-dismissible fade show mt-3">
			에러 발생: ${error}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	</c:if>
	
	<%@ include file="guest_bottom.jsp" %>   
</body>
</html>