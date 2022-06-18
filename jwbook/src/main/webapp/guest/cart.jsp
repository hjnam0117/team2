<%@page import="bookstore.cart"%>
<%@page import="bookstore.cartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 세션의 고유 아이디를 가져온다.
	String cartId = session.getId();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<title>장바구니</title>
<script type="text/javascript">
function fnClear(){
	if(confirm("장바구니를 비우시겠습니까?")) {
		location.href = "deleteCart.jsp";	
	}
}
</script>
</head>
<body>
	<jsp:include page="../guest/guest_top.jsp" />
<div align="center" class="rows">
	<h3>[장바구니 보기]</h3>
	<table border="1">
		<tr>
			<th>카트 번호</th>
			<th>책 제목</th>
			<th>작가</th>
			<th>주문 수량</th>
			<th>총 가격</th>
		</tr>
		<c:forEach var="cart" items="${cartlist}" varStatus="status">
			<tr align= 'center'>
				<td>${cart.cartid}</td>
				<td>${cart.bookname}</td>
				<td>${cart.bookwriter}</td>
				<td>${cart.bookcount}</td>
				<td>${cart.totalprice}</td>
			</tr>
		</c:forEach>
		<tr align = 'center'>
			<td colspan= '3'>
				<input type='button' value='결제하기' />
				<input type='button' value='장바구니 비우기' onclick='fcClear()' />
				<input type='button' value='쇼핑 계속하기' action='../guest/booklist.jsp'/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>