package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import model.courseInfoModel;
import model.courseModel;
import model.resourceModel;
import model.selectedcourseModel;

public class AuthDAO {

	static Connection conn = null;
	static Statement s = null;
	Statement stmt = null;
	static PreparedStatement ps = null;

	public AuthDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/termproject", "root", "root");
			s = conn.createStatement();
			stmt = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static String insertStudent(String fname, String lname, String netid, String pwd, String year, String program,
			String major) throws SQLException {
		String query = "insert into student(Fname,Lname,NetID,Password,Year,Program,Major) values(?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, netid);
		ps.setString(4, pwd);
		ps.setString(5, year);
		ps.setString(6, program);
		ps.setString(7, major);
		ps.execute();
		return major;
	}

	public static String insertFaculty(String fname, String lname, String netid, String pwd) throws SQLException {
		String query = "insert into faculty(Fname,Lname,NetID,Password) values(?,?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, netid);
		ps.setString(4, pwd);

		ps.execute();
		return pwd;

	}
	public static String insertStaff(String fname, String lname, String netid, String pwd) throws SQLException {
		String query = "insert into staff(Fname,Lname,NetID,Password) values(?,?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, netid);
		ps.setString(4, pwd);

		ps.execute();
		return pwd;

	}

	public ResultSet logincheckStudent(String netid, String pwd) throws SQLException {
		String query = "select * from student where NetID = '" + netid + "' and Password = '" + pwd + "'";
		return s.executeQuery(query);
	}

	public ResultSet logincheckFaculty(String netid, String pwd) throws SQLException {
		String query = "select * from faculty where NetID = '" + netid + "' and Password = '" + pwd + "'";
		return s.executeQuery(query);
	}
	public ResultSet logincheckStaff(String netid, String pwd) throws SQLException {
		String query = "select * from staff where NetID = '" + netid + "' and Password = '" + pwd + "'";
		return s.executeQuery(query);
	}

	public ResultSet selectcourse() throws SQLException {
		String query = "select * from course";
		return s.executeQuery(query);
	}

	public ArrayList<courseModel> ViewCourse() throws SQLException {
		ArrayList<courseModel> viewcourse = new ArrayList<courseModel>();
		ResultSet rs = selectcourse();
		while (rs.next()) {
			courseModel cm = new courseModel();
			cm.setCourse_id(rs.getInt("courseID"));
			cm.setCourse_name(rs.getString("courseName"));

			viewcourse.add(cm);
		}
		return viewcourse;

	}

	public static String selectCourse(String id, String name, String netid) throws SQLException {
		String query = "insert into selectedcourse(courseID,courseName,netid) values(?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, netid);
		ps.execute();
		return netid;

	}

	public ResultSet coursecheck(String net_id, String coursename) throws SQLException {
		String query = "select * from selectedcourse where netid = '" + net_id + "' and courseName = '" + coursename
				+ "'";
		return s.executeQuery(query);
	}

	public static String insertNewCourse(String courseno, String course_name) throws SQLException {
		String query = "insert into course(courseID,courseName) values(?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, courseno);
		ps.setString(2, course_name);
		ps.execute();
		return course_name;

	}

	public static String insertNewResource(String resource_name, String resource_type, String resource_details)
			throws SQLException {
		String query = "insert into resource(resourceName,resourceType,resourceDetails) values(?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, resource_name);
		ps.setString(2, resource_type);
		ps.setString(3, resource_details);
		ps.execute();
		return resource_details;

	}

	public ResultSet getResource() throws SQLException {
		String query = "select distinct resourceName,resourceType,resourceDetails from resource";
		return s.executeQuery(query);
	}

	public static String insertReservedResource(String resource_name, String date, String slot, String netid)
			throws SQLException {
		String query = "insert into reserveresource(resourceName,date,slot,netid) values(?,?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, resource_name);
		ps.setString(2, date);
		ps.setString(3, slot);
		ps.setString(4, netid);
		ps.execute();
		return netid;

	}

	public ResultSet getReservedResource(String resource_name, String date, String slot) throws SQLException {
		String query = "select * from reserveresource where resourceName = '" + resource_name + "' and date = '" + date
				+ "' and slot = '" + slot + "'";
		return s.executeQuery(query);
	}

	public ResultSet selectresource(String net_id) throws SQLException {
		String query = "select * from reserveresource where netid = '" + net_id + "'";
		return s.executeQuery(query);
	}

	public ArrayList<resourceModel> ViewResource(String netid) throws SQLException {
		ArrayList<resourceModel> viewresource = new ArrayList<resourceModel>();
		// HttpSession session = request.getSession();
		// String netid = (String) session.getAttribute("netid");
		ResultSet rs = selectresource(netid);
		System.out.println("netid:" + netid);
		while (rs.next()) {
			resourceModel rm = new resourceModel();
			rm.setResource_name(rs.getString("resourceName"));
			rm.setDate(rs.getString("date"));
			rm.setSlot(rs.getString("slot"));

			viewresource.add(rm);
		}
		System.out.println("rm:" + viewresource);
		return viewresource;

	}

	public static String  cancelReservation(String netid, String name, String date, String slot) throws SQLException {
		String query = "delete from reserveresource where netid = '" + netid + "' and resourceName = '" + name
				+ "' and date = '" + date + "' and slot = '" + slot + "'";
		s.executeUpdate(query);
		return slot;

	}

	public ResultSet getSelectedcourse(String net_id) throws SQLException {
		String query = "select * from selectedcourse where netid = '" + net_id + "'";
		return s.executeQuery(query);
	}

	public ArrayList<selectedcourseModel> selected(String netid) throws SQLException {
		ArrayList<selectedcourseModel> selectedcourse = new ArrayList<selectedcourseModel>();
		ResultSet rs = getSelectedcourse(netid);

		while (rs.next()) {
			selectedcourseModel scm = new selectedcourseModel();
			scm.setCourse_id(rs.getInt("courseID"));
			scm.setCourse_name(rs.getString("courseName"));

			selectedcourse.add(scm);

		}
		// System.out.println("Selectedcourse:"+selectedcourse);
		return selectedcourse;

	}

	public static String insertCourseInfo(String course_name, String ohours, String tahours, String syllabus, String netid)
			throws SQLException {
		String query = "insert into courseinfo(courseName,officehours,tahours,syllabus,netid) values(?,?,?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, course_name);
		ps.setString(2, ohours);
		ps.setString(3, tahours);
		ps.setString(4, syllabus);
		ps.setString(5, netid);
		ps.execute();
		return netid;

	}

	public static String updateCourseInfo(String course_name, String ohours, String tahours, String syllabus, String netid)
			throws SQLException {
		String query = "update courseinfo set officehours = ?,tahours = ?,syllabus = ? where netid = ? and courseName = ?";
		ps = conn.prepareStatement(query);
		ps.setString(1, ohours);
		ps.setString(2, tahours);
		ps.setString(3, syllabus);
		ps.setString(4, netid);
		ps.setString(5, course_name);

		ps.executeUpdate();
		return netid;

	}

	public ResultSet getCourseInfo(String course_name, String netid) throws SQLException {
		String query = "select * from courseinfo where netid = '" + netid + "' and courseName = '" + course_name + "'";
		return s.executeQuery(query);
	}

	public ResultSet getCourseInfoAgain(String netid) throws SQLException {
		String query = "select * from courseinfo where netid = '" + netid + "'";
		return s.executeQuery(query);
	}

	public ArrayList<courseInfoModel> ViewCourseInfo(String netid) throws SQLException {
		ArrayList<courseInfoModel> viewcourseinfo = new ArrayList<courseInfoModel>();
		ResultSet rs = getCourseInfoAgain(netid);
		while (rs.next()) {
			courseInfoModel cim = new courseInfoModel();

			cim.setCourse_name(rs.getString("courseName"));
			cim.setOffice_hours(rs.getString("officehours"));
			cim.setTa_hours(rs.getString("tahours"));
			cim.setSyllabus(rs.getString("syllabus"));

			viewcourseinfo.add(cim);
		}
		return viewcourseinfo;

	}

	public ResultSet getProfile(String netid) throws SQLException {
		String query = "select * from faculty where netid = '" + netid + "'";
		return s.executeQuery(query);
	}

	public static String updateProfile(String fname, String lname, String pwd, String netid) throws SQLException {
		String query = "update faculty set Fname = ?,Lname = ?,Password = ? where netid = ?";
		ps = conn.prepareStatement(query);
		ps.setString(1, fname);
		ps.setString(2, lname);
		ps.setString(3, pwd);
		ps.setString(4, netid);

		ps.executeUpdate();
		return netid;

	}

	public ResultSet getPhd() throws SQLException {
		String query = "select * from student where Program = 'PhD'";
		return s.executeQuery(query);
	}

	public ResultSet getPhdAgain(String netid) throws SQLException {
		String query = "select * from student where NetID = '" + netid + "'";
		return s.executeQuery(query);
	}

	public static String updatePhdStatus(String status, String netid) throws SQLException {
		String query = "update student set Status = ? where netid = ?";
		ps = conn.prepareStatement(query);
		ps.setString(1, status);
		ps.setString(2, netid);

		ps.executeUpdate();
		return netid;

	}

	public static String insertTopic(String topic_name, String netid, String author) throws SQLException {
		String query = "insert into topic(topicName,netid,author) values(?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, topic_name);
		ps.setString(2, netid);
		ps.setString(3, author);

		ps.execute();
		return author;

	}

	public ResultSet getTopic() throws SQLException {
		String query = "select * from topic";
		return s.executeQuery(query);
	}

	public ResultSet getTopicAuthor1(String netid) throws SQLException {
		String query = "select * from student where NetID = '" + netid + "'";
		return s.executeQuery(query);
	}

	public ResultSet getTopicAuthor2(String netid) throws SQLException {
		String query = "select * from faculty where NetID = '" + netid + "'";
		return s.executeQuery(query);
	}

	public static String insertcontent1(String topic, String content) throws SQLException {
		String query = "insert into discussion(topic,content,parentID) values(?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, topic);
		ps.setString(2, content);
		ps.setString(3, "0");

		ps.execute();
		return content;

	}

	public ResultSet getContent() throws SQLException {
		String query = "select * from discussion";
		return s.executeQuery(query);
	}

	public ResultSet getQuestion() throws SQLException {
		String query = "select * from discussion where parentID = '0'";
		return s.executeQuery(query);
	}

	public ResultSet getContent1(String content) throws SQLException {
		String query = "select * from discussion where content = '" + content + "' and parentID = '0'";
		System.out.println("Query Executed");
		return s.executeQuery(query);
	}

	public static String insertcontent2(String topic, String content, String parent) throws SQLException {
		String query = "insert into discussion(topic,content,parentID) values(?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, topic);
		ps.setString(2, content);
		ps.setString(3, parent);

		ps.execute();
		return parent;

	}

	public ResultSet getReply(String parent, String topic) throws SQLException {
		String query = "select * from discussion where parentID = '" + parent + "' and topic = '" + topic + "'";
		return stmt.executeQuery(query);
	}

	public static String insertevent(String content, String date, String netid) throws SQLException {
		String query = "insert into event(content,date,netid) values(?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, content);
		ps.setString(2, date);
		ps.setString(3, netid);

		ps.execute();
		return netid;
	}

	public ResultSet getEvent() throws SQLException {
		String query = "select * from event order by date desc";
		return stmt.executeQuery(query);
	}

	public static String updateEvent(String newEvent, String oldevent, String netid) throws SQLException {
		String query = "update event set content = ? where content = ? and netid = ?";
		ps = conn.prepareStatement(query);
		ps.setString(1, newEvent);
		ps.setString(2, oldevent);
		ps.setString(3, netid);
		ps.executeUpdate();
		return netid;

	}

	public static String deleteEvent(String netid, String content) throws SQLException {
		String query = "delete from event where netid = '" + netid + "' and content = '" + content + "'";
		s.executeUpdate(query);
		return content;

	}
	public static String insertjob(String job, String type, String link, String netid) throws SQLException {
		String query = "insert into job(job,type,link,netid) values(?,?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, job);
		ps.setString(2, type);
		ps.setString(3, link);
		ps.setString(4, netid);

		ps.execute();
		return netid;

	}
	public ResultSet getJob() throws SQLException {
		String query = "select * from job";
		return stmt.executeQuery(query);
	}
	public static String updateJob(String newjob, String type,String link,String oldjob, String netid) throws SQLException {
		String query = "update job set job = ?,type = ?,link = ? where job = ? and netid = ?";
		ps = conn.prepareStatement(query);
		ps.setString(1, newjob);
		ps.setString(2, type);
		ps.setString(3, link);
		ps.setString(4, oldjob);
		ps.setString(5, netid);
		ps.executeUpdate();
		return netid;

	}
	public static String deleteJob(String netid, String job) throws SQLException {
		String query = "delete from job where netid = '" + netid + "' and job = '" + job + "'";
		s.executeUpdate(query);
		return job;

	}
	public ResultSet getNews() throws SQLException {
		String query = "select * from news order by date desc";
		return stmt.executeQuery(query);
	}
	public static String updateNews(String newEvent, String oldevent, String netid) throws SQLException {
		String query = "update news set content = ? where content = ? and netid = ?";
		ps = conn.prepareStatement(query);
		ps.setString(1, newEvent);
		ps.setString(2, oldevent);
		ps.setString(3, netid);
		ps.executeUpdate();
		return netid;

	}
	public static String deleteNews(String netid, String content) throws SQLException {
		String query = "delete from news where netid = '" + netid + "' and content = '" + content + "'";
		s.executeUpdate(query);
		return content;

	}
	public static String insertnews(String content, String date, String netid) throws SQLException {
		String query = "insert into news(content,date,netid) values(?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, content);
		ps.setString(2, date);
		ps.setString(3, netid);

		ps.execute();
		return netid;

	}
	public static String insertAlumni(String alumni, String year, String member, String link, String netid) throws SQLException {
		String query = "insert into alumni(alumni,year,member,link,netid) values(?,?,?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, alumni);
		ps.setString(2, year);
		ps.setString(3, member);
		ps.setString(4, link);
		ps.setString(5, netid);

		ps.execute();
		return netid;

	}
	public ResultSet getAlumni() throws SQLException {
		String query = "select * from alumni";
		return stmt.executeQuery(query);
	}
	public ResultSet getAlumniByID(String serial) throws SQLException {
		String query = "select * from alumni where serial = '" + serial + "'";
		return stmt.executeQuery(query);
	}
	public static String updateAlumni(String name, String year, String member, String link, String netid, String id) throws SQLException {
		String query = "update alumni set alumni = ?, year=?,member=?,link=?,netid=? where serial = ?";
		ps = conn.prepareStatement(query);
		ps.setString(1, name);
		ps.setString(2, year);
		ps.setString(3, member);
		ps.setString(4, link);
		ps.setString(5, netid);
		ps.setString(6, id);
		ps.executeUpdate();
		return id;

	}
	public static String insertExam(String name, String date, String link,String netid) throws SQLException {
		String query = "insert into exam(exam_name,date,link,netid) values(?,?,?,?)";
		ps = conn.prepareStatement(query);
		ps.setString(1, name);
		ps.setString(2, date);
		ps.setString(3, link);
		ps.setString(4, netid);
		

		ps.execute();
		return netid;

	}
	public ResultSet getExam() throws SQLException {
		String query = "select * from exam";
		return stmt.executeQuery(query);
	}
	public ResultSet getRegisteredStudent(String exam) throws SQLException {
		String query = "select name,netid from examregister where exam = '" + exam + "'";
		return stmt.executeQuery(query);
	}
	public static String insertExamResult(String student, String exam,String result,String creator) throws SQLException {
		String query = "insert into result(student,exam,result,creator) values(?,?,?,?)";
		ps = conn.prepareStatement(query);
		
		ps.setString(1, student);
		ps.setString(2, exam);
		ps.setString(3, result);
		ps.setString(4, creator);
		

		ps.execute();
		return creator;

	}
	public ResultSet getExamResult() throws SQLException {
		String query = "select * from result";
		return stmt.executeQuery(query);
	}
	public static String updateResult(String result, String id) throws SQLException {
		String query = "update result set result = ? where serial = ?";
		ps = conn.prepareStatement(query);
		ps.setString(1, result);
		ps.setString(2, id);
		
		ps.executeUpdate();
		return id;

	}
	public static String deleteResult(String serial) throws SQLException {
		String query = "delete from result where serial = '" + serial + "'";
		s.executeUpdate(query);
		return serial;

	}




}
