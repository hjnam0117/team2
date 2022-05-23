<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<link rel="stylesheet" href="./css/owl.carousel.min.css"/>
<link rel="stylesheet" href="./css/owl.theme.default.css"/>
<script src="../js/script.js"></script>
<script type="text/javascript">
</script>
<!-- CSS only -->
<style>
	#side_right {float: right; width:300px; line-height:30px;}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<table style="width: 90%">
     <tr>
          <td style ="font-size: 24px">전문 쇼핑몰</td>
          </tr>
</table>
<%@ include file="guest_top.jsp" %>
<table style="width: 90%">
	<tr style="text-align:center;">
    	<td style="background-color:blue">     
		<!-- <td style="background-image: url(../images/pic.jpg); background-size: 100%;
                        background-size:100% font-size:20px;">  // 셀 배경으로 이미지 사용 가능-->        
        	<img src="../images/pic.jpg" width="100%"/>
        </td>
    </tr>
</table>
<div id="side_right">
	<form>
		<fieldset>
			<table>
				<tr>
	          		<td><label>아이디</label></td>
	          		<td><input type="text"></td>
	          	</tr>
	          	<tr>
	          		<td><label>비밀번호</label></td>
	          		<td><input type="text"></td>
	          	</tr>
	          	<tr>
	          		<td><button type="submit">로그인</button></td>
	          		<td><button type="submit">회원가입</button></td>
	          	</tr>
	          </table>
        </fieldset>
	</form>
</div>
<%@ include file="guest_bottom.jsp" %>     
</body>
</html>