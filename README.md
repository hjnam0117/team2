# team2

1. 참고자료

첫페이지 구조 https://note.espriter.net/1177

간단구현 순서 https://ddingz.tistory.com/171

로그인 아이디 비번 확인 https://velog.io/@yseonjin/JSP-%EC%87%BC%ED%95%91%EB%AA%B0-%EA%B4%80%EB%A6%AC%ED%8E%98%EC%9D%B4%EC%A7%80-%EB%A7%8C%EB%93%A4%EA%B8%B0-%EC%97%B0%EC%8A%B5-8

관리자 상품등록 전체구조 https://blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=tinatan&logNo=70165598811&parentCategoryNo=&categoryNo=23&viewDate=&isShowPopularPosts=false&from=postView

전체 회원 목록 https://florescene.tistory.com/58?category=963009

장바구니, 카테고리별 검색 https://velog.io/@jeong11/teamproject-jsp-shoppingmall-cartadmin


2. 데이터 베이스

create table userdb( usernumber int not null primary key auto_increment, usertype varchar(10) not null, name varchar(20) not null, id varchar(10) not null, pw varchar(10) not null, call varchar(20), address varchar(50), email varchar(20) );

create table book( bookid int not null primary key auto_increment, category varchar(10) not null, name varchar(30) not null, writer varchar(30) not null, descript varchar(300), price int not null, stock int not null, soldout varchar(10) not null );

create table cart( bookid int not null primary key auto_increment, bookname varchar(30) not null, bookwriter varchar(30) not null, bookcount int not null, totalprice int not null );

create table payment( paymentid int not null auto_increment, bookid int not null, bookname varchar(30) not null, bookcount int not null, cardnumber varchar(30) not null, cardpw varchar(10) not null, address varchar(50) not null, call varchar(20) not null, totalprice int not null );

++

alter table book add(publisher varchar(20) not null);
alter table book add(releasedate varchar(20) not null);
alter table book add(img varchar not null);

++

alter table book add(rank varchar(20), krank int, arank int, prank int, irank int, yrank int);


3. 주제발표 대본

저는 주제 선정, 개발언어, 주요 기능, 전체 프로그램 구조도, 메인 페이지 설계, 데이터 베이스 설계 순서로 발표하겠습니다. 

먼저 도서 웹 쇼핑몰을 주제로 선정하게 된 이유는 책을 읽기 위해 여러 도서 사이트의 베스트셀러를 일일이 비교하기가 번거롭고 불편하다고 느꼈기 때문입니다. 그래서 각 도서 사이트의 베스트 셀러를 모아서 볼 수 있는 도서 웹 쇼핑몰 페이지를 만들고자 합니다.

이러한 목적으로 만들어진 기존의 사이트를 참고해 몇 가지 사항을 개선한 페이지를 만들 것입니다. 이 사이트들은 가격 비교를 중심으로 만들어져서 장르별 베스트셀러만 보여주기 때문에 성별, 나이별 베스트셀러도 추가해서 보여주도록 만들 것입니다.

또 메인 페이지에서 책 소개 내용이 길어서 한눈에 알아보기가 어려우므로 책 내용을 함축적으로 포함하면서 궁금증을 유발하는 짧은 문구로 대체하려고 합니다.

개발에 사용할 언어는 HTML, CSS, 자바스크립트, JSP 등입니다.

이 도서 웹 쇼핑몰의 주요 기능은 다음과 같습니다.

1. 첫번째는 로그인 및 회원가입 기능입니다. 

메인 페이지에서 아이디, 비밀번호를 입력해 관리자 또는 고객으로 로그인을 합니다.
기존에 가입되지 않은 사용자라면 회원가입을 통해 사용자의 이름, 사용할 아이디, 비밀번호, 전화번호, 주소, 이메일 등을 입력받습니다. 데이터베이스에 이미 저장된 정보이면 alert창을 띄우고, 저장된 정보가 아니라면 데이터베이스에 추가하도록 합니다.

2. 두번째는 회원 정보 수정 기능입니다.

로그인된 회원의 정보를 수정해 데이터베이스에 반영하도록 합니다.

3. 세번째는 장바구니 기능입니다.

장바구니에 담은 도서의 이름, 저자, 개수, 총 가격을 화면에 출력합니다.

4. 네번째는 결제하기 기능입니다.

결제할 도서의 이름, 개수, 총 가격, 데이터베이스에 저장된 고객의 주소, 전화번호 등의 정보를 출력하고, 결제 버튼을 클릭하면 결제 내역서를 화면에 출력합니다.

5. 다섯번째는 도서등록 기능입니다.

관리자 모드에서만 가능하며, 새로운 도서를 등록해서 데이터베이스에 추가합니다.

6. 여섯번째는 전체 도서 목록 보기입니다.

데이터베이스 내의 전체 도서 목록을 보여주며, 고객은 원하는 도서를 장바구니에 담고 결제할 수 있습니다. 관리자는 도서 목록에서 가격, 개수 등의 정보를 수정할 수 있습니다.

7. 일곱번째는 베스트 셀러 보기입니다.

종합, 소설, 에세이, 자기계발, 컴퓨터 등 장르별 베스트 셀러와 10대부터 60대 이상의 나이별 베스트셀러, 성별 베스트 셀러를 화면에 출력합니다.


이러한 기능을 구현한 도서 쇼핑몰 전체 프로그램 구조도입니다.
메인 페이지에서 관리자 모드로 로그인하여 도서등록을 하고 저장한 뒤 전체 도서 목록에서 각 도서의 상세정보를 볼 수 있습니다. 고객 모드로 로그인한 경우 도서 구매를 위해 원하는 도서를 장바구니에 담고 수정할 수 있으며, 결제 후 결제 내역서를 볼 수 있습니다.


메인페이지의 간단한 설계입니다.
왼쪽 상단에 BookCompare 로고를 넣고 그 아래로 베스트셀러, 도서 목록, 도서 등록, 장바구니, 주문 내역 기능을 구현합니다.
그 아래에 각 도서 사이트로 이동할 수 있는 목록을 배치하고, 가운데에는 배너로 추천 도서의 주요 내용을 표시합니다. 오른쪽에 로그인 및 회원가입 기능을 구현합니다.


마지막으로 사용자, 도서, 결제 관련 정보관리를 위한 데이터베이스 설계를 한 것입니다.
아직 데이터 베이스를 배우지 않아서 전체적인 구조만 간단하게 설계했습니다.
왼쪽은 회원가입 시 사용자가 입력한 정보를 관리하기 위한 사용자 데이터베이스이고, 오른쪽은 도서 웹 쇼핑몰에 등록된 도서 정보를 관리하기 위한 도서 데이터베이스를 설계한 것입니다.
그리고 고객이 장바구니에 담은 도서 관련 정보를 관리하기 위한 장바구니 데이터베이스와 결제 내역을 관리하기 위한 결제 데이터베이스를 설계했습니다.


이상으로 발표를 마치겠습니다. 감사합니다.


4. 변경 및 구현 

6/1

banner.jsp 변경 

6/2

도서등록 register.jsp, 전체도서 booklist.jsp, 각 도서 상세정보 book.jsp, 도서 생성 Bookdao.java 변경
DB 연결 덜됨
도서 추가 addbook.jsp 등록 내용 검사 validation.js 구현

6/3

book db 칼럼추가, db 연결, 이미지 c:/temp 등록, 서블릿에서 jsp 호출 안넘어감

6/4

1 .nhn 제거

2 guest_top.jsp 도서 목록, 도서 등록 절대경로로 변환 -> 도서 목록, 등록 제대로 동작함


6/8

1 메인페이지 배너에 로그인 포함, 컨트롤러 action main 추가, userdb에 name, usertype, usernumber 변수 관련 함수 삭제

6/9

1 베스트셀러 db 연동 완료 (bestcontroller 구현, Bookdao getBestseller() 추가)

2 book db 각 도서사이트 순위 정수형 krank, arank, prank, irank, yrank 추가 (5개 도서사이트 문자열 rank 필요에 따라 사용 또는 삭제)

3 booklist.jsp descript 150자까지만 출력 수정

4 베스트셀러 상단메뉴 bestseller.jsp 구현, 사이트와 장르에 따라 책 리스트 보여주는 novel.jsp 구현 (장르별 구현 완료, 사이트별 구현 수정 중) 

6/11

1 각 사이트별 베스트 셀러 jsp 구현 (선택된 사이트 나타내기 위해 5개 구별해서 구현)

2 guest_top.jsp 베스트셀러 접근 경로 변경

3 사이트별 베스트셀러 가져오는 함수 추가 (Bookdao, bestcontroller 수정)
