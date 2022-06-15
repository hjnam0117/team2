<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="Stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>베스트 셀러</title>
<style type="text/css">
	*, body {margin:0;padding:0}
	.top {border: 2px solid #999; border-radius:10px;}
	.topmenu {width: 1050px; display: table; border-collapse: collapse; table-layout:fixed; border:none;}
    .topmenu ul {display: table-row; background:#d3d3fa; }
	.topmenu > ul > li { display: table-cell;text-align:center;padding: 5px 0; border:2px solid #9080ed;}
	.topmenu > ul > li:first-child {border-radius:5px 0 0 5px;} 
	.topmenu > ul > li:last-child {border-radius:0 5px 5px 0;}   
    .topmenu > ul > li > a { display: block;}
    #site3 {background-color:#9080ed;}
    #site3 a{color:#fff;}
    .site:hover, .site:active {background-color:#9080ed;}
    .site a:hover, .site a:active {color:#fff;}
    
	.submenu > ul > li {border-left:1px solid #999; font:bold 17px Dotum; padding:0px 50px; float:left;}
	.submenu > ul > li:first-child{border-left:none;}
</style>
</head>
<body>
	<%@ include file="guest_top.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1>베스트 셀러</h1>
		</div>
	</div>
	<table>
		<tr>
			<td width="420"></td>
			<td>
				<div class="top">
					<table>
						<tr height="20"></tr>
						<tr>
							<td width="20"></td>
							<td colspan="2">
								<div class="topmenu">
									<ul class="menu-wrap">
										<li id="site1" class="site"><a href="best?action=list&site=k&category=소설">교보문고</a></li>
										<li id="site2" class="site"><a href="best?action=list&site=a&category=소설">알라딘</a></li>
										<li id="site3" class="site"><a href="best?action=list&site=p&category=소설"><b>영풍문고</b></a></li>
										<li id="site4" class="site"><a href="best?action=list&site=i&category=소설">인터파크</a></li>
										<li id="site5" class="site"><a href="best?action=list&site=y&category=소설">YES24</a></li>
									</ul>									
								</div>
							</td>
							<td width="20"></td>
						</tr>
						<tr height="20"></tr>
						<tr>
							<td width="20"></td>
							<td class="submenu" colspan="2">
								<ul>
									<li><a href="best?action=list&site=p&category=소설">소설</a></li>
									<li><a href="best?action=list&site=p&category=자기계발">자기계발</a></li>
									<li><a href="best?action=list&site=p&category=에세이">에세이</a></li>
									<li><a href="best?action=list&site=p&category=과학">과학</a></li>
									<li><a href="best?action=list&site=p&category=인문">인문</a></li>
									<li><a href="best?action=list&site=p&category=컴퓨터">컴퓨터</a></li>
									<li><a href="best?action=list&site=p&category=청소년">청소년</a></li>
								</ul>
							</td>
							<td width="20"></td>
						</tr>
						<tr height="20"></tr>
						<tr>
							<td width="20"></td>
							<td class="submenu">
								<ul>
									<li><a href="best?action=list_2&site=p&age=1">10대</a></li>
									<li><a href="best?action=list_2&site=p&age=2">20대</a></li>
									<li><a href="best?action=list_2&site=p&age=3">30대</a></li>
									<li><a href="best?action=list_2&site=p&age=4">40대</a></li>
									<li><a href="best?action=list_2&site=p&age=5">50대</a></li>
									<li><a href="best?action=list_2&site=p&age=6">60대 이상</a></li>
								</ul>
							</td>
							<td>
								<span>
									<%
										String gender = request.getParameter("gender");
										System.out.println(gender);
										if(gender == null) gender = "1";
									%>
									<select class="gender" onchange="if(this.value) location.href=(this.value);">
										<option value="best?action=list_3&site=p&gender=1" <%=gender.equals("1")||gender==null?"selected":""%>>전체</option>
										<option value="best?action=list_3&site=p&gender=2" <%=gender.equals("2")?"selected":""%>>남자</option>
										<option value="best?action=list_3&site=p&gender=3" <%=gender.equals("3")?"selected":""%>>여자</option>
									</select>
								</span>
							</td>
							<td width="20"></td>
						</tr>
						<tr height="30"></tr>
					</table>
				</div>
			</td>
		</tr>
		<tr height="40"></tr>
	</table>
	<table>
		<tr>
			<td width="420"></td>
			<td><%@ include file="novel.jsp"%></td>
		</tr>
	</table>
</body>
</html>