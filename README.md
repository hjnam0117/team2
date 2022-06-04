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


3. 변경 및 구현 

6/1 banner.jsp 변경 
6/2
도서등록 register.jsp, 전체도서 booklist.jsp, 각 도서 상세정보 book.jsp, 도서 생성 Bookdao.java 변경
DB 연결 덜됨
도서 추가 addbook.jsp 등록 내용 검사 validation.js 구현
6/3
db 연결, 이미지 c:/temp 등록, 서블릿에서 jsp 호출 안넘어감
