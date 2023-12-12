package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NotjoinDAO;
import model.LoginModel;

/**
 * Servlet implementation class NotjoinServlet
 */
@WebServlet("/NotjoinServlet")
public class NotjoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotjoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sessionId=request.getParameter("action");
		NotjoinDAO notjoinDAO=new NotjoinDAO();
		HttpSession session = request.getSession();
		LoginModel loginModel=(LoginModel)session.getAttribute("loginModel");
		notjoinDAO.deleteMember(sessionId,loginModel);
		
		String forward=null;
		System.out.println(request.getParameter("action"));
		System.out.println(request.getParameter("forward"));
		
		if(request.getParameter("forward")!=null && request.getParameter("forward").length()!=0) {
			forward="ScheduleServlet";
		}else {
			forward="SessionListServlet";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(forward);
		dispatcher.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
