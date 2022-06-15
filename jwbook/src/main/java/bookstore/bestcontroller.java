package bookstore;

import java.io.IOException;
import java.lang.reflect.Method;
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

@WebServlet("/best")
@MultipartConfig(maxFileSize=1024*1024*2, location="c:/Temp/img")
public class bestcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Bookdao dao;
    private ServletContext ctx;
    private final String START_PAGE = "guest/kbestseller.jsp";
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
    		action = "list";
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
	public String list(HttpServletRequest request) {
		String _site = request.getParameter("site");
		if (_site==null) _site = "k";
		String site = _site + "rank";
		String category = request.getParameter("category");
		if (category==null) category="소설";
		ArrayList<book> list;
		try {			
			list = dao.getBestseller(site, category);
			request.setAttribute("booklist", list);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("도서 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "도서 목록이 정상적으로 처리되지 않았습니다!!");
		}
		return "guest/"+_site+"bestseller.jsp";
	}
	public String list_2(HttpServletRequest request) {
		String site = request.getParameter("site");
		String age_ = request.getParameter("age");
		String age = "age" + age_;
		ArrayList<book> list;
		System.out.println(site + age);
		try {			
			list = dao.getBestseller_2(site, age);
			request.setAttribute("booklist", list);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("도서 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "도서 목록이 정상적으로 처리되지 않았습니다!!");
		}
		return "guest/"+site+"bestseller.jsp";
	}
	public String list_3(HttpServletRequest request) {
		String site = request.getParameter("site");
		String gen_ = request.getParameter("gender");
		String gen = "gen" + gen_;
		ArrayList<book> list;
		try {			
			list = dao.getBestseller_3(gen);
			request.setAttribute("booklist", list);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("도서 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "도서 목록이 정상적으로 처리되지 않았습니다!!");
		}
		request.setAttribute("gender", gen_);
		return "guest/"+site+"bestseller.jsp";
	}
}
