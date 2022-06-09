<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소설 베스트 셀러</title>
<style>
	ul,li{list-style:none;padding:0;margin:0}
	#BookLists li {float:left;margin-right:20px;}
	.num {width:45px; valign:top;}
	.line {width:1200px; height:40px;}
</style>
</head>
<body>
	<table>
		<tr>
			<td width="1100">
				<ul id="BookLists"><c:forEach var="book" items="${booklist}" varStatus="status">
					<li style='margin-right:16px;'><a href="http://localhost:8080/jwbook/book?action=getBook&bookid=${book.bookid}" title="${book.name}">
						<table width="200">
							<tr>
								<td>
									<table>
										<tr>
											<td width="70"></td>
											<td class="num">${status.count}</td>
											<td>
												<table>
													<tr><td colspan="3" height="1" bgcolor="#c9c9c9"></td></tr>
													<tr>
														<td width="1" bgcolor="#c9c9c9"></td>
														<td><img src="${book.img}" border="0" width="120" height="180" alt="${book.name}"></td>
														<td width="1" bgcolor="#c9c9c9"></td>
													</tr>
													<tr><td colspan="3" height="1" bgcolor="#c9c9c9"></td></tr>
												</table>
											</td>
											<td width="45"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr><td height="24"></td></tr>
							<tr>
								<td>
									<table border='1'>
										<tr>
											<td width="45"></td>
											<td width="167" align="center">${book.name}</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</a></li>
					<c:if test="${status.count % 5 == 0}">
						<li class="line"></li>
					</c:if>
				</c:forEach></ul>
			</td>
		</tr>
	</table>
</body>
</html>