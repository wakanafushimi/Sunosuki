package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ForSessionDAO;
import model.ForSessionModel;

/**
 * Servlet implementation class ForSessionServlet
 */
@WebServlet("/ForSessionServlet")
public class ForSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForSessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("date").length()!=0 && request.getParameter("date")!=null) {
			
			String date=request.getParameter("date");
			ForSessionModel forSessionModel=new ForSessionModel();
			forSessionModel.setDate(date);
			
			ForSessionDAO forSessionDAO=new ForSessionDAO();
			forSessionModel=forSessionDAO.getSessionList(forSessionModel);
			List<String> sessionList=forSessionModel.getSessionList();
			String[] sessionArray=new String[sessionList.size()];
			sessionArray=forSessionModel.getSessionArray();
			
//			for(String items:sessionArray) {
//				System.out.println(items);
//			}
			
			request.setAttribute("sessionArray",sessionArray);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("specificsession.jsp");
			dispatcher.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
