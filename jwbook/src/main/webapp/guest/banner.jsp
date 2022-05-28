<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
	<meta charset='utf-8'>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<title></title>
	<style>
	.sitelist > li {list-style-type: none; padding: 20px 80px 20px 20px; margin-bottom: 5px; border-bottom: 1px solid #efefef; font-size: 18px;}
	* {margin:0;padding:0;}
	.section input[id*="slide"] {display:none;}
	.section .slidewrap {max-width:1200px;margin:50px auto;}
	.section .slidelist {white-space:nowrap;font-size:0;overflow:hidden;position:relative;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:95%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}
	.section .slidelist > li > a img {width:30%;}
	.section .slidelist label {position:absolute;z-index:10;top:50%;transform:translateY(-60%);padding:50px;cursor:pointer;}
	.section .slidelist .textbox {position:absolute;z-index:1;top:50%;left:60%;transform:translate(-55%,-55%);line-height:1.6;text-align:center;}
	.section .slidelist .textbox h3 {font-size:36px;font-weight: bold;color:#000;transform:translateY(30px);transition:all .5s;}
	.section .slidelist .textbox p {font-size:16px;color:#000;opacity:0;transform:translateY(30px);transition:all .5s;}
	.section .slidelist .textbox .category {font-weight: bold;color:#00f;}
	.section .slidelist .textbox .writer {font-weight: bold;color:#a0a0a0;}
	
	/* input에 체크되면 슬라이드 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(10%);}
	.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-90%);}
	.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-190%);}
	.section input[id="slide04"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-290%);}
	.section input[id="slide05"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-390%);}

	/* input에 체크되면 텍스트 효과 */
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox h3 {opacity:1;transform:translateY(0);}
	.section input[id="slide01"]:checked ~ .slidewrap li:nth-child(1) .textbox p {opacity:1;transform:translateY(0);}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox h3 {opacity:1;transform:translateY(0);}
	.section input[id="slide02"]:checked ~ .slidewrap li:nth-child(2) .textbox p {opacity:1;transform:translateY(0);}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox h3 {opacity:1;transform:translateY(0);}
	.section input[id="slide03"]:checked ~ .slidewrap li:nth-child(3) .textbox p {opacity:1;transform:translateY(0);}
	.section input[id="slide04"]:checked ~ .slidewrap li:nth-child(4) .textbox h3 {opacity:1;transform:translateY(0);}
	.section input[id="slide04"]:checked ~ .slidewrap li:nth-child(4) .textbox p {opacity:1;transform:translateY(0);}
	.section input[id="slide05"]:checked ~ .slidewrap li:nth-child(5) .textbox h3 {opacity:1;transform:translateY(0);}
	.section input[id="slide05"]:checked ~ .slidewrap li:nth-child(5) .textbox p {opacity:1;transform:translateY(0);}

	/* 좌,우 슬라이드 버튼 */
	.slide-control > div {display:none;}
	.section .left {left:30px;}
	.section .right {right:30px;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-control > div:nth-child(1) {display:block;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-control > div:nth-child(2) {display:block;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-control > div:nth-child(3) {display:block;}
	.section input[id="slide04"]:checked ~ .slidewrap .slide-control > div:nth-child(4) {display:block;}
	.section input[id="slide05"]:checked ~ .slidewrap .slide-control > div:nth-child(5) {display:block;}

	/* 페이징 */
	.slide-pagelist {text-align:center;padding:20px;}
	.slide-pagelist > li {display:inline-block;vertical-align:middle;}
	.slide-pagelist > li > label {display:block;padding:8px 30px;border-radius:30px;background:#ccc;margin:20px 10px;cursor:pointer;}
	.section input[id="slide01"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(1) > label {background:#999;}
	.section input[id="slide02"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(2) > label {background:#999;}
	.section input[id="slide03"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(3) > label {background:#999;}
	.section input[id="slide04"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(4) > label {background:#999;}
	.section input[id="slide05"]:checked ~ .slidewrap .slide-pagelist > li:nth-child(5) > label {background:#999;}
	</style>
</head>
<body>
<table>
<tr>
	<td width="80"></td>
	<td><div>
		<p style="font-size:24px; padding:0px 20px 20px 20px">도서 사이트</p>
		<ul class="sitelist">
			<li><a href=http://www.kyobobook.co.kr/index.laf?>> 교보문고</a></li>
			<li><a href=https://www.aladin.co.kr/home/welcome.aspx>> 알라딘</a></li>
			<li><a href=https://www.ypbooks.co.kr/kor_index.yp>> 영풍문고</a></li>
			<li><a href=https://book.interpark.com/bookPark/html/book.html>>인터파크 도서</a></li>
			<li><a href=http://www.yes24.com/main/default.aspx>> YES24</a></li>
		</ul>
	</div></td>
	<td><div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<input type="radio" name="slide" id="slide04">
	<input type="radio" name="slide" id="slide05">
	<div class="slidewrap">
		<ul class="slidelist">
			<!-- 슬라이드 영역 -->
			<li class="slideitem">
				<a>
					<div class="textbox">
						<p class="category"><br>소설 > 일본소설</p>
						<h3>어느 날, 내 죽음에 네가 들어왔다</h3>
						<p class="writer"><br><br>세이카 료겐 지음 | 김윤경 옮김 | 모모 | 2022년 05월 09일 출간</p>
						<p><br><br>상처뿐인 두 사람이 차가운 세상에 맞서 지켜낸 소중한 사랑의 순간!<br>“나는 네가 살았으면 좋겠어”<br>모든 걸 포기하려던 순간, 기적처럼 시작된 사랑에 관한 이야기</p>
					</div>
					<img src="../images/death.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					<div class="textbox">
						<p class="category"><br>소설 > 미스터리/스릴러소설</p>
						<h3>소문</h3>
						<p class="writer"><br><br>오기와라 히로시 지음 | 권일영 옮김 | 모모 | 2021년 09월 26일 출간</p>
						<p><br><br>소녀의 시체, 이마에 새겨진 R 표시, 그리고 사라진 발목⋯⋯.<br>쉴 틈 없이 몰아치는 이야기, 예상을 배신하는 범인의 정체,<br>입소문이 그리고 당신이 만날 수 있는 최고의 반전이 마지막에 기다린다!</p>
					</div>
					<img src="../images/rumor.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					<div class="textbox">
						<p class="category"><br>소설 > 한국소설</p>
						<h3>불편한 편의점</h3>
						<p class="writer"><br><br>김호연 지음 | 나무옆의자 | 2021년 04월 20일 출간</p>
						<p><br><br>불편한데 자꾸 가고 싶은 편의점이 있다!<br>15만 독자를 사로잡은 가슴 뭉클한 위로와 울림<br>힘겨운 오늘을 살아가는 우리들에게 다가온 조금 특별한 편의점 이야기</p>
					</div>
					<img src="../images/store.jpg">
				</a>
			</li>
			<li class="slideitem">
				<a>
					<div class="textbox">
						<p class="category"><br>소설 > 판타지소설</p>
						<h3>달러구트 꿈 백화점</h3>
						<h5> : 주문하신 꿈은 매진입니다</h5>
						<p class="writer"><br><br>이미예 지음 | 팩토리나인 | 2020년 07월 08일 출간</p>
						<p><br><br>‘무의식에서만 존재하는 꿈을 정말 사고 팔 수 있을까?’라는 기발한 질문에 <br>답을 찾아가며, 꿈을 만드는 사람, 파는 사람, 사는 사람의 <br>비밀스런 에피소드를 담고 있는 판타지 소설</p>
					</div>
					<img src="../images/dream.jpeg">
				</a>
			</li class="slideitem">
			<li class="slideitem">
				<a>
					<div class="textbox">
						<p class="category"><br>소설 > 미스터리/스릴러소설</p>
						<h3>돌이킬 수 없는 약속</h3>						
						<p class="writer"><br><br>야쿠마루 가쿠 지음 | 김성미 옮김 | 북플라자 | 2017년 02월 02일 출간</p>
						<p><br><br>15년 전 버려버린 과거에서 도착한 한 통의 편지가 <br>봉인해 둔 기억을 되살아나게 한다!<br>“그들은 지금 교도소에서 나왔습니다!”</p>
					</div>
					<img src="../images/promise.jpg">
				</a>
			</li>
			<!-- 좌,우 슬라이드 버튼 -->
			<div class="slide-control">
				<div>
					<label for="slide05" class="left"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_left_01_on.png></label>
					<label for="slide02" class="right"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_right_01_on.png></label>
				</div>
				<div>
					<label for="slide01" class="left"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_left_01_on.png></label>
					<label for="slide03" class="right"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_right_01_on.png></label>
				</div>
				<div>
					<label for="slide02" class="left"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_left_01_on.png></label>
					<label for="slide04" class="right"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_right_01_on.png></label>
				</div>
				<div>
					<label for="slide03" class="left"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_left_01_on.png></label>
					<label for="slide05" class="right"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_right_01_on.png></label>
				</div>
				<div>
					<label for="slide04" class="left"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_left_01_on.png></label>
					<label for="slide01" class="right"><img src=https://www.sehan.ac.kr/html/main1/img/btn_slide_right_01_on.png></label>
				</div>
			</div>
		</ul>
		<!-- 페이징 -->
		<ul class="slide-pagelist">
			<li><label for="slide01"></label></li>
			<li><label for="slide02"></label></li>
			<li><label for="slide03"></label></li>
			<li><label for="slide04"></label></li>
			<li><label for="slide05"></label></li>
		</ul>
	</div></div></td></tr>
</table>
</body>
</html>
