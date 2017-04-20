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
 * Servlet implementation class ViewCourseInfoServlet
 */
@WebServlet("/PostCourseInfoServlet")
public class PostCourseInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostCourseInfoServlet() {
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
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		AuthDAO ad = new AuthDAO();
		ResultSet rs = null;
		HttpSession session = request.getSession();
		String netid = (String) session.getAttribute("netid");
		String name = request.getParameter("course_name");
		String ohours = request.getParameter("ohours");
		String tahours = request.getParameter("tahours");
		String syllabus = request.getParameter("syllabus");
		try {
			rs = ad.getCourseInfo(name,netid);

			if (rs.next()) {
				ad.updateCourseInfo(name, ohours, tahours, syllabus, netid);
				response.sendRedirect("ViewCourseInfoServlet");
			} else {
				ad.insertCourseInfo(name, ohours, tahours, syllabus, netid);

				response.sendRedirect("ViewCourseInfoServlet");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
