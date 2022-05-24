<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서등록</title>
</head>
<body>
	<%@ include file="guest_top.jsp" %>
	<br>
	<center><b>도서 등록</b></center>
	<br>
	<table width="500" border="1" cellspacing="0" cellpadding="0" align="center"> 
		<tr>
			<td width="300" align="center">도서 번호</td>
			<td width="500"><input type="text" size="20" maxlength="20" name="bookid"></td>
		</tr>
		<tr> 
			<td width="300" align="center">도서 분야</td>
			<td width="500"><select name="category">
				<option value="100">소설</option>
				<option value="200">에세이</option>
				<option value="300">컴퓨터</option>
				<option value="400">인문</option>
				<option value="500">만화</option>
				</select>
			</td>
		</tr>
		<tr> 
			<td  width="300" align="center">도서 이름</td> 		
		    <td  width="500"><input type="text" size="50" maxlength="50" name="name"></td>
		</tr>
		<tr>	
		    <td  width="300" align="center">도서 저자</td> 
			<td  width="500"><input type="text" size="30" maxlength="30" name="writer"></td>
		</tr>
		<tr>	
		    <td  width="300" align="center">도서 설명</td> 
			<td  width="500"><textarea name="descript" rows="13" cols="40"></textarea></td> 
		</tr>
		<tr>	
		    <td  width="300" align="center">도서 가격</td> 
			<td  width="500"><input type="text" size="10" maxlength="10" name="price">원</td>
		</tr>
		<tr> 
			<td  width="300" align="center">도서 재고</td>
			<td  width="500"><input type="text" size="10" maxlength="5" name="stock">권</td> 
		</tr>
		<tr> 	
	    	<td  width="300" align="center" >이미지</td> 
			<td  width="500"><input type="file" name="image"></td> 
		</tr> 
	</table>
</body>
</html>