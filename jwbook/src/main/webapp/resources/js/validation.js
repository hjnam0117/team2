// validation.js

function CheckAddBook() {
	var bookid = document.getElementById("bookid"); // 도서 번호
	var name = document.newBook.name.value; // 도서 이름
	var price = document.newBook.price.value; // 도서 가격
	var stock = document.newBook.stock.value; // 재고

	if (!check(/^[0-9]+$/, bookid, "[도서코드]\n숫자만 입력하세요."))
		return false;

	if (name.length < 1) { // 도서명의 문자 길이가 1자 이상인지 확인
		alert("도서명은 최소 1자 이상이어야 합니다.");

		document.newBook.name.select();
		document.newBook.name.focus();
		return false;
	}

	if (price.length == 0) { // 가격의 문자 길이가 0인지 숫자인지 유효성 검사
		alert("가격은 숫자를 입력해야 합니다.");

		document.newBook.price.select();
		document.newBook.price.focus();
		return false;
	}

	if (price < 0) { // 가격이 음수인지 유효성 검사
		alert("가격에 음수는 입력 불가능합니다.");

		document.newBook.price.select();
		document.newBook.price.focus();
		return false;
	}

	if (isNaN(stock)) { // 재고 수가 숫자인지 유효성 검사
		alert("재고 수에 숫자만 입력 가능합니다.");

		document.newBook.stock.select();
		document.newBook.stock.focus();
		return false;
	}

	function check(regExp, e, msg) {
		if (regExp.test(e.value)) { // 정규 표현식 검사
			return true;
		}

		// 오류 시
		alert(msg); // 에러 메시지 msg 출력
		e.select(); // 입력 항목 선택
		e.focus(); // 입력 항목 커서 맞춤
		return false;
	}

	document.newBook.submit();
}