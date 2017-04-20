package Database;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/InsertReplyServlet")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		AuthDAO ad = new AuthDAO();
		HttpSession session  = request.getSession();
		String netid = (String) session.getAttribute("netid");
		ResultSet rs = null;
		String topic = request.getParameter("topic");
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		String reply = request.getParameter("reply");
		System.out.println(topic);
		System.out.println(reply);
		//System.out.println(parent);
		String parent = null;
		try{
		rs = ad.getContent1(content);
		while(rs.next())
		{
			parent = rs.getString(1);
			System.out.println(topic);
			System.out.println(reply);
			System.out.println(parent);
			ad.insertcontent2(topic, reply, parent);
			
		}
		
		
		
		
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/reply.jsp?topic="+topic+"&author="+author+"&parent="+parent);
		rd.forward(request, response);
	}

}
