<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<link rel="Stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style type="text/css">
	a {color:black; text-decoration-line: none !important; }
	table {border-spacing:0;}
	.mytable > td {padding:10px 20px;}
	.left {width="200"; text-align:center;}
	.right {width="700";}
</style>
<script type="text/javascript" src="../resources/js/validation.js"></script>
</head>
<body>
	<%@ include file="guest_top.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1>도서 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newBook" action="/jwbook/book?action=addBook" class="form-horizontal" method="post" enctype="multipart/form-data">
		<table class="mytable" width="1000" border="1" align="center"> 
			<tr>
				<td class="left">도서 번호</td>
				<td class="right"><input type="text" id="bookid" size="50" maxlength="50" name="bookid" class="form-control"></td>
			</tr>
			<tr> 
				<td class="left">도서 이름</td> 		
		    	<td class="right"><input type="text" id="name" size="50" maxlength="50" name="name" class="form-control"></td>
			</tr>
			<tr>	
		    	<td class="left">도서 저자</td> 
				<td class="right"><input type="text" id="price" size="50" maxlength="50" name="writer" class="form-control"></td>
			</tr>
			<tr> 
				<td class="left">도서 분야</td>
				<td class="right"><input type="text" size="50" maxlength="50" name="category" class="form-control"></td>
			</tr>
			<tr>	
			    <td class="left">출판사</td> 
				<td class="right"><input type="text" size="50" maxlength="50" name="publisher" class="form-control"></td>
			</tr>
			<tr>	
			    <td class="left">출판일</td> 
				<td class="right"><input type="text" size="50" maxlength="50" name="releaseDate" class="form-control"></td>
			</tr>
			<tr>	
			    <td class="left">도서 설명</td> 
				<td class="right"><textarea name="descript" rows="23" cols="60" placeholder="100자 이상 적어주세요" class="form-control"></textarea></td> 
			</tr>
			<tr>	
			    <td class="left">도서 가격</td> 
				<td class="right"><input type="text" size="50" maxlength="50" name="price"> 원</td>
			</tr>
			<tr> 
				<td class="left">도서 재고</td>
				<td class="right"><input type="text" id="stock" size="50" maxlength="50" name="stock"> 권</td> 
			</tr>
			<tr> 
				<td class="left">품절 여부</td>
				<td class="right"><input type="text" size="50" maxlength="50" name="soldout" class="form-control"></td> 
			</tr>
			<tr> 	
		    	<td class="left">이미지</td> 
				<td class="right"><input type="file" name="file"></td> 
			</tr>
			<tr>       			
				<td colspan=2 align="center"><input type="submit" class="btn btn-primary" value="도서 등록" onclick="return CheckAddBook()">
				<input type="reset" value="다시작성">
				</td>
			</tr>
		</table></form>
		</div>
</body>
</html>