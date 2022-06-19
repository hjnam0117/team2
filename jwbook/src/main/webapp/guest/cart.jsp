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
<style>
	th, td{padding:15px;}
</style>
<script type="text/javascript">

function count(type, i)  {
	  const carts = document.getElementById('carts');
	  row = carts.rows[i];
      const resultElement = row.cells[3]
	  const priceElement = row.cells[6]
	  let number = resultElement.innerText;
	  let price = priceElement.innerText;
	  let one = price/number;
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  }
	  price = one*number;
	  resultElement.innerText = number;
	  priceElement.innerText = price;
	  
	  calcSum();
}
function calcSum() {
	  // table element 찾기
	  const table = document.getElementById('carts');
	  
	  // 합계 계산
	  let sum = 0;
	  for(let i = 1; i < table.rows.length - 1; i++)  {
	    sum += parseInt(table.rows[i].cells[6].innerHTML);
	  }
	  
	  // 합계 출력
	  document.getElementById('totalprice').innerText = sum+" 원";
	  
}
function fnClear(){
	if(confirm("장바구니를 비우시겠습니까?")) {
		location.href = "http://localhost:8080/jwbook/guest/deleteCart.jsp";	
	}
}
</script>
</head>
<body>
	<jsp:include page="../guest/guest_top.jsp" />
	<%
	String id = (String)session.getAttribute("id");
	if(id==null||id.equals("admin")){
		response.sendRedirect("http://localhost:8080/jwbook/guest/carterror.jsp");
	}
	session.setAttribute("id", id);
	%>
<div align="center" class="rows">
	<h3>[장바구니 보기]</h3>
	<table border="1" width="40%" id='carts'>
		<tr>
			<th>카트 번호</th>
			<th>책 제목</th>
			<th>작가</th>
			<th colspan='3'>주문 수량</th>
			<th>총 가격</th>
		</tr>
		<c:forEach var="cart" items="${cartlist}" varStatus="status">
			<tr class="select" align= 'center'>
				<td>${cart.cartid}</td>
				<td>${cart.bookname}</td>
				<td>${cart.bookwriter}</td>
				<td>
					<span id='count'>${cart.bookcount}</span>
				</td>	
				<td><input type="button" value="+" onclick='count("plus","${status.count}")'/></td>
				<td><input type="button" value="-" onclick='count("minus", "${status.count}")'/></td>
				<td id='price'>${cart.totalprice}</td>
			</tr>
		</c:forEach>
		<tr align = 'center'>
			<td colspan= '3'>
				<input type='button' value='결제하기' />
				<input type='button' value='장바구니 비우기' onclick='fnClear()' />
				<input type='button' value='쇼핑 계속하기' onclick = "location.href = '../book?action=listBooks'">
			</td>
			<td colspan='4' id='totalprice'> 원</td>
		</tr>
	</table>
</div>
</body>
</html>