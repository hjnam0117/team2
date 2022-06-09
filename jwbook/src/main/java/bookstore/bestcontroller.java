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
    private final String START_PAGE = "guest/bestseller.jsp";
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
	public String listBooks(HttpServletRequest request) {
		String site = request.getParameter("site");
		String category = request.getParameter("category");
		String rank = null;
		System.out.println("전:"+rank);
		if (site==null || site=="교보문고") rank="krank";
		else if (site=="알라딘") rank="arank";
		else if (site=="영풍문고") rank="prank";
		else if (site=="인터파크") rank="irank";
		else if (site=="YES24") rank="yrank";
		if (category==null) category="소설";
		System.out.println("후:"+rank);
		ArrayList<book> list;
		try {
			list = dao.getBestseller(rank, category);
			request.setAttribute("booklist", list);
		} catch (Exception e) {
			e.printStackTrace();
			ctx.log("도서 목록 생성 과정에서 문제 발생!!");
			request.setAttribute("error", "도서 목록이 정상적으로 처리되지 않았습니다!!");
		}
		return "guest/bestseller.jsp";
	}
}
