<%@ page import="java.util.ArrayList"%>
<%@ page import="model.courseInfoModel"%>
<%@include file="header.jsp"%>

<%
	ArrayList<courseInfoModel> info = (ArrayList<courseInfoModel>) request.getAttribute("info");
%>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">UAlbany</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="facultyHome.jsp">Home</a></li>
			<li><a href="profilepage.jsp">Profile</a></li>
			<li class="active"><a href="courses.jsp">Courses</a></li>
			<li><a href="resources.jsp">Manage Resources</a></li>
			<li><a href="phd.jsp">PhD Student Status</a></li>
			<li><a href="discussion.jsp">Discussion Board</a></li>
				<li><a href="announcement.jsp">Announcements</a></li>
				<li><a href="alumni.jsp">Alumni</a></li>
				<li><a href="exam.jsp">Exams</a></li>
				<li><a href="LogoutServlet">Logout</a></li>
		</ul>
	</div>
</nav>

<div id="wrapper">

	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#"> Explore </a></li>
			<li><a href="ViewCourseServlet">View Courses</a></li>
			<li><a href="createnewcourse.jsp">Create New Course</a></li>
			<li><a href="CourseInfoServlet">Post Course Info</a></li>
			<li><a href="ViewCourseInfoServlet">View Course Info</a></li>

		</ul>
	</div>
	<!-- /#sidebar-wrapper -->
	<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle
		Menu</a>
	<!-- Page Content -->
	<br><br><br><br>
	<div id="page-content-wrapper">
		<div class="col-md-3"></div>
		<div class="col-md-5">
			<table style="font-size: 20px; text-align: center"
				class="table table-hover">

				<tr>
					<th style="text-align: center; font-size: 23px">Course Name</th>
					<th style="text-align: center; font-size: 23px">Faculty office 
					hours</th>
					<th style="text-align: center; font-size: 23px">TA Office Hours</th>
					<th style="text-align: center; font-size: 23px">Course Syllabus</th>
				</tr>


				<%
					for (int i = 0; i < info.size(); i++) {
				%>
				<tr>
					<td>
						<%
							out.println(info.get(i).getCourse_name());
						%>
					</td>
					<td>
						<%
							out.println(info.get(i).getOffice_hours());
						%>
					</td>
					<td>
						<%
							out.println(info.get(i).getTa_hours());
						%>
					</td>
					<td>
						<%
							out.println(info.get(i).getSyllabus());
						%>
					</td>

					
				</tr>
				<%
					}
				%>

			</table>
			<br><br>
			<p style = "font-size: 20px;text-align: center">${warning }</p>
			




		</div>


		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<%@include file="footer.jsp"%>