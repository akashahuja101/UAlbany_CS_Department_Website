package Database;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileServlet() {
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
		ResultSet rs = null;
		HttpSession session = request.getSession();
		String netid = (String) session.getAttribute("netid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String cpwd = request.getParameter("cpwd");
		String pwd = request.getParameter("pwd");
		if(pwd.equals(cpwd)){
		
		try {
			ad.updateProfile(fname, lname, pwd, netid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
		}
		else{
			request.setAttribute("warning", "Passwords Don't Match!");
			getServletContext().getRequestDispatcher("/editProfile.jsp").forward(request, response);
		}
		
		
	}

}
