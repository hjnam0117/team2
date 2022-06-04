package bookstore;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet(urlPatterns = "/book.nhn")
@MultipartConfig(maxFileSize=1024*1024*2, location="c:/Temp/img")
public class bookcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Bookdao dao;
    private ServletContext ctx;
    private final String START_PAGE = "guest/booklist.jsp";
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	dao = new Bookdao();
    	ctx = getServletContext();
    }
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String action = request.getParameter("action");
    	dao = new Bookdao();
    	Method m;
    	String view = null;
    	if (action == null) {
    		action = "listBooks";
    	}
    	try {
    		m = this.getClass().getMethod(action, HttpServletRequest.class);
    		view = (String)m.invoke(this, request);
    	} catch (NoSuchMethodException e) {
    		e.printStackTrace();
    		ctx.log("요청 action 없음!!");
    		request.setAttribute("error", "action 파라미터가 잘못되었습니다!!");
    		view = START_PAGE;
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	if(view.startsWith("redirect:/")) {
    		String rview = view.substring("redirect:/".length());
    		response.sendRedirect(rview);
    	} else {
    		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
    		dispatcher.forward(request, response);
    	}
    }
    public String addBook(HttpServletRequest request) {
		book b = new book();
		try {
			Part part = request.getPart("file");
			String fileName = getFilename(part);
			if(fileName != null && !fileName.isEmpty()) {
				part.write(request.getServletContext().getRealPath("") + "img" + File.separator + fileName);
			}
			BeanUtils.populate(b, request.getParameterMap());
			b.setImg("/img/" + fileName);
			dao.addBook(b);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("도서 추가 과정에서 문제 발생!!");
			request.setAttribute("error", "도서가 정상적으로 등록되지 않았습니다!!");
			return listBooks(request);
		}
		return "redirect:/book.nhn?action=listBooks";
	}
    public String deleteBook(HttpServletRequest request) {
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		try {
			dao.delBook(bookid);
		} catch (SQLException e) {
			e.printStackTrace();
			ctx.log("도서 삭제 과정에서 문제 발생!!");
			request.setAttribute("error", "도서가 정상적으로 삭제되지 않았습니다!!");
			return listBooks(request);
		}
		return "redirect:/book.nhn?action=listBooks";
	}
	public String listBooks(HttpServletRequest request) {
		ArrayList<book> list;
		try {
			list = dao.getAll();
			request.setAttribute("booklist", list);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("도서 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "도서 목록이 정상적으로 처리되지 않았습니다!!");
		}
		return "guest/booklist.jsp";
	}
	public String getBook(HttpServletRequest request) {
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		try {
			book b = dao.getBook(bookid);
			request.setAttribute("book", b);
		} catch (SQLException e) {
			e.printStackTrace();
			ctx.log("도서를 가져오는 과정에서 문제 발생!!");
			request.setAttribute("error", "도서를 정상적으로 가져오지 못했습니다!!");
		}
		return "guest/book.jsp";
	}
	private String getFilename(Part part) {
		String fileName = null;
		String header = part.getHeader("content-disposition");
		System.out.println("Header => "+header);
		int start = header.indexOf("filename=");
		fileName = header.substring(start+10, header.length()-1);
		ctx.log("파일명:"+fileName);
		return fileName;
	}
}
