package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SessionListDAO;
import model.SessionListModel;

/**
 * Servlet implementation class SessionListServlet
 */
@WebServlet("/SessionListServlet")
public class SessionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SessionListModel sessionListModel=new SessionListModel();
		SessionListDAO sessionListDAO=new SessionListDAO();
		sessionListModel=sessionListDAO.setSession(sessionListModel);
		List<String[]> sessionList=sessionListModel.getSessionList();
		List<List<String>> memberList=sessionListModel.getMemberList();
		
		HttpSession session = request.getSession();
		session.setAttribute("sessionList",sessionList);
		session.setAttribute("memberList",memberList);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("lookforsession.jsp");
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
