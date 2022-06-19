<%-- shippingInfo.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="Stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<title>배송 정보</title>
</head>
<body>
	<jsp:include page="guest_top.jsp" />
	<div class="jumbotron">
		<div class="container" align="center">
			<h1>배송 정보</h1>
		</div>
	</div>
	<div class="container">
		<form action="./processShoppingInfo.jsp" class="form-horizontal"
			method="post">
			<input type="hidden" name="userid"
				value="<%=request.getParameter("id")%>" />
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="call" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipcode" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">카드번호</label>
				<div class="col-sm-3">
					<input name="cardnumber" type="text" class="form-control" placeholder="YYYY-MMMM-DDDD-AAAA"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">카드 비밀번호</label>
				<div class="col-sm-3">
					<input name="cardpw" type="text" class="form-control" placeholder="앞 2자리"/>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="./cart.jsp"
						class="btn btn-secondary" role="button">이전</a>
					<input type="submit" class="btn btn-primary" value="등록" />
					<a href="./cart.jsp" class="btn btn-secondary"
						role="button">취소</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>