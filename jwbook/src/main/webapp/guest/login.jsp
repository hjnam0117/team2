<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){

     var btn1 = document.getElementById("btnLogin");
     if(btn1){
          btn1.addEventListener("click", funcLogin, false);   
     }
     
     var btn2 = document.getElementById("btnNewMember");
     if(btn2){
          btn2.addEventListener("click", funcNew, false); 
     }

}

function funcNew(){
     location.href="../member/form.jsp";//회원가입
}
function funcLogin(){
	
        loginForm.action ="http://localhost:8080/jwbook/guest/loginproc.jsp";
        loginForm.method="post";
        loginForm.submit();
}
</script>
</head>
<body>
<%
if(id !=null){
	if(id.equals("admin")){
%>
	<b>관리자</b>
	<%}else{ %>
     <b><%=id %></b>
	<%}%>
	 님 환영합니다<p/>
     준비된 기능을 사용할 수 있습니다.
     <a href="logout.jsp">로그아웃</a>
<%}else{%>
     <form name="loginForm">
     <table>
          <tr>
          <td colspan="2"> * 회원 로그인 * </td>
          </tr>
          <tr>
          <td> 아이디 : </td>
          <td><input type="text" name="id"></td>
          </tr>
          <tr>
          <td> 비밀번호 : </td>
          <td><input type="password" name="pw"></td>
          </tr>
          <tr>
              <td colspan="2">
                   <input type="button" value="로 그 인" id="btnLogin">
                   <input type="button" value="회원가입" id="btnNewMember">
                   </td>
     </table>
     </form>
<%   
}
session.setAttribute("id", id);
%>
</body>
</html>