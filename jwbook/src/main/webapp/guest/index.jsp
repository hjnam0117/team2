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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
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
<%@ include file="book.jsp" %>
<%@ include file="guest_bottom.jsp" %>     
</body>
</html>