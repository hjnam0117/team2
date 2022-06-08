package bookstore;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/usercontrol")
public class usercontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String START_PAGE="guest/guest_index.jsp";
	private ServletContext ctx;
	private userDAO dao;
	
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		dao=new userDAO();
		ctx=getServletContext();
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		dao=new userDAO();
		Method m;
		String view = null;
		if(action==null) {
			action="main";
		}
		try {
			m=this.getClass().getMethod(action, HttpServletRequest.class);
			view=(String)m.invoke(this, request);
		}catch(NoSuchMethodException e) {
			e.printStackTrace();
			ctx.log("요청 action 없음");
			request.setAttribute("error", "action 파라미터 오류");
			view=START_PAGE;
		}catch(Exception e) {
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
	
	public String insert(HttpServletRequest request) {
		userdb u= new userdb();
		try {
			BeanUtils.populate(u, request.getParameterMap());
			dao.insert(u);
		}catch(Exception e) {e.printStackTrace();}
		return "redirect:/usercontrol?action=main";
	}
	public String main(HttpServletRequest request) {
		return "guest/guest_index.jsp";
	}
}