package bookstore;

import java.util.ArrayList;

import bookstore.book;

public class Bookdao {

	private ArrayList<book> listOfBooks = new ArrayList<book>();
	private static Bookdao instance = new Bookdao();

	public static Bookdao getInstance() {
		return instance;
	}

	public Bookdao() {
		book html = new book("1", "HTML5 웹 프로그래밍 입문", "한빛아카데미");
		html.setWriter("윤인성");
		html.setCategory("컴퓨터");
		html.setDescrip("웹 프로그래밍을 처음 배우는 독자를 위한 입문서로 HTML5, CSS3, 자바스크립트, jQuery까지 한 권으로 기본기를 다질 수 있습니다. 최신 웹 표준에 맞게 배울 수 있도록 웹에 대한 기본 이해부터 프로젝트 완성까지 단계적으로 다룹니다. 예제는 단편적인 기능 익히기에 그치지 않고 실제 개발에 응용할 수 있도록 기본 예제 → 응용 예제 → 종합 예제(블로그 제작)의 점차 발전되는 형태로 구성되어 있습니다.");
		html.setReleaseDate("2019-07-19");
		html.setPrice(26000);
		html.setStock(100);
		html.setSoldout("재고 있음");
		html.setImg("1.jpg");
		
		book jsp = new book("2", "JSP 웹 프로그래밍과 스프링 프레임워크", "한빛아카데미");
		jsp.setWriter("황희정");
		jsp.setCategory("컴퓨터");
		jsp.setDescrip("컴퓨터 관련학과 학생과 IT 전문학원에서 자바 웹 프로그래밍을 배우려는 학생을 대상으로 합니다. 이 책에서는 시대적 흐름을 반영하면서도 핵심 개념에 충실하도록 구성하였으며, 프런트엔드의 기초 내용(HTML, CSS, 자바스크립트, 부트스트랩)도 추가하였습니다. 또한 대표적인 자바 웹 개발 프레임워크인 스프링 프레임워크의 핵심 활용을 포함하고 있습니다.");
		jsp.setReleaseDate("2021-08-08");
		jsp.setPrice(27000);
		jsp.setStock(200);
		jsp.setSoldout("재고 있음");
		jsp.setImg("2.jpg");
		
		book goodbye = new book("3", "작별인사", "복복서가");
		goodbye.setWriter("김영하");
		goodbye.setCategory("소설");
		goodbye.setDescrip("그리 멀지 않은 미래를 배경으로, 별안간 삶이 송두리째 뒤흔들린 한 소년의 여정을 좇는다. 유명한 IT 기업의 연구원인 아버지와 쾌적하고 평화롭게 살아가던 철이는 어느날 갑자기 수용소로 끌려가 난생처음 날것의 감정으로 가득한 혼돈의 세계에 맞닥뜨리게 되면서 정신적, 신체적 위기에 직면한다. 동시에 자신처럼 사회에서 배제된 자들을 만나 처음으로 생생한 소속감을 느끼고 따뜻한 우정도 싹틔운다. 철이는 그들과 함께 수용소를 탈출하여 집으로 돌아가기 위해 길을 떠나지만 그 여정에는 피할 수 없는 질문이 기다리고 있다.");
		goodbye.setReleaseDate("2022-05-01");
		goodbye.setPrice(12600);
		goodbye.setStock(50);
		goodbye.setSoldout("재고 있음");
		goodbye.setImg("3.jpg");
		
		listOfBooks.add(html);
		listOfBooks.add(jsp);
		listOfBooks.add(goodbye);
	}

	public ArrayList<book> getAllBooks() {
		return listOfBooks;
	}
	
	public int getNumber() {
		return listOfBooks.size();
	}
	
	public book getBookById(String bookId) {
		book bookById = null;

		for (int i = 0; i < listOfBooks.size(); i++) {
			book book = listOfBooks.get(i);
			if (book != null && book.getBookid() != null && book.getBookid().equals(bookId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	
	public void addBook(book book) {
		listOfBooks.add(book);
	}
}