package Database;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

public class AuthDAOTest {

	
	
	
			static String username;
		static String pass;
		static AuthDAO sc;
		static int id;
		@BeforeClass
		public static void setUp() throws Exception {
			// TODO Auto-generated method stub
			//All set up activity goes here. e.g. setup db connections etc.
			sc = new AuthDAO();
			username = "akash";
			pass="ahuja";
			id = 123;
		}
		
		
		@Test
		public void testInsertevent() throws SQLException {
			
			String ok = AuthDAO.insertevent(username, username, pass);
			Assert.assertEquals("ahuja", ok);
		}
		

	@Test
	public void testInsertStudent() throws SQLException {
		String ok = AuthDAO.insertStudent(pass, pass, username, pass, pass, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testInsertFaculty() throws SQLException {
		String ok = AuthDAO.insertFaculty(pass, pass, username, pass);
		Assert.assertEquals("ahuja", ok);
	}



	@Test
	public void testInsertNewResource() throws SQLException {
		String ok = AuthDAO.insertNewResource(username, username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testInsertReservedResource() throws SQLException {
		String ok = AuthDAO.insertReservedResource(username, pass, username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testCancelReservation() throws SQLException {
		String ok = AuthDAO.cancelReservation(username, username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testInsertCourseInfo() throws SQLException {
		String ok = AuthDAO.insertCourseInfo(username, username, pass, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testUpdateCourseInfo() throws SQLException {
		String ok = AuthDAO.updateCourseInfo(username, username, username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testUpdateProfile() throws SQLException {
		String ok = AuthDAO.updateProfile(username, username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testUpdatePhdStatus() throws SQLException {
		String ok = AuthDAO.updatePhdStatus(username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testInsertTopic() throws SQLException {
		String ok = AuthDAO.insertTopic(username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testInsertcontent1() throws SQLException {
		String ok = AuthDAO.insertcontent1(username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testInsertcontent2() throws SQLException {
		String ok = AuthDAO.updatePhdStatus(username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testUpdateEvent() throws SQLException {
		String ok = AuthDAO.updateEvent(username, username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testDeleteEvent() throws SQLException {
		String ok = AuthDAO.deleteEvent(username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testInsertjob() throws SQLException {
		String ok = AuthDAO.insertjob(username, username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testUpdateJob() throws SQLException {
		String ok = AuthDAO.updateJob(username, username, username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testDeleteJob() throws SQLException {
		String ok = AuthDAO.deleteJob(username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testUpdateNews() throws SQLException {
		String ok = AuthDAO.updateNews(username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testDeleteNews() throws SQLException {
		String ok = AuthDAO.deleteNews(username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testInsertnews() throws SQLException {
		String ok = AuthDAO.insertnews(username, username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testInsertAlumni() throws SQLException {
		String ok = AuthDAO.insertAlumni(username, username, username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testUpdateAlumni() throws SQLException {
		String ok = AuthDAO.updateAlumni(username, username, username, pass, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testInsertExam() throws SQLException {
		String ok = AuthDAO.insertExam(username, username, pass, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testInsertExamResult() throws SQLException {
		String ok = AuthDAO.insertExamResult(username, pass, username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	

	@Test
	public void testUpdateResult() throws SQLException {
		String ok = AuthDAO.updateResult(username, pass);
		Assert.assertEquals("ahuja", ok);
	}

	@Test
	public void testDeleteResult() throws SQLException {
		String ok = AuthDAO.deleteResult(pass);
		Assert.assertEquals("ahuja", ok);
	}

}
