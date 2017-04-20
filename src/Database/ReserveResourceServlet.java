package Database;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.ResultSet;

/**
 * Servlet implementation class ReserveResourceServlet
 */
@WebServlet("/ReserveResourceServlet")
public class ReserveResourceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReserveResourceServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		AuthDAO ad = new AuthDAO();
		java.sql.ResultSet rs = null;
		HttpSession session = request.getSession();
		String netid = (String) session.getAttribute("netid");
		String name = request.getParameter("res_name");
		String date = request.getParameter("date");
		String slot = request.getParameter("slot");
		System.out.println(name);
		System.out.println(date);
		System.out.println(slot);
		try {
			rs = ad.getReservedResource(name, date, slot);
		
		
			if (rs.next()) {
				request.setAttribute("warning", "This slot is already taken");
				getServletContext().getRequestDispatcher("/reserveResources.jsp").forward(request, response);
			} else {
				
					ad.insertReservedResource(name, date, slot, netid);
				
				request.setAttribute("success", "Resource Reserved Succesfully");
				getServletContext().getRequestDispatcher("/reserveResources.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
