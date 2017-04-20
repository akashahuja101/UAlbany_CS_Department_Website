<%@ page import="java.util.ArrayList"%>
<%@ page import="model.selectedcourseModel"%>
<%@include file="header.jsp"%>
<%
	ArrayList<selectedcourseModel> selected = (ArrayList<selectedcourseModel>) request.getAttribute("selectedcourse");
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="form-top center_div">
			<div class="form-top-left">
				<h3 style="color: black">Post Course Info</h3>
				<p style="color: black"></p>
			</div>
			<div class="form-top-right">
				<i class="fa fa-pencil"></i>
			</div>
		</div>

		<div class="form-bottom">
			<form name="f1" role="form" 
				action="PostCourseInfoServlet" method="post"
				class="registration-form center_div">

				<div class="form-group">
					<label style="color: black" class="" for="course_name">Select
						Course</label><br> <select class="form-control" name="course_name"
						id="course_name" onChange="showfield();">
						<%
							for (int i = 0; i < selected.size(); i++) {
						%>
						<option>
							<%
								out.println(selected.get(i).getCourse_id());
							%>:
							<%
								out.println(selected.get(i).getCourse_name());
							%>
						</option>
						<%
							}
						%>
					</select>

				</div>

				<div class="form-group">
					<label style="color: black" class="" for="ohours">Enter Office hours</label>
					<input type="text" name="ohours" placeholder="Office hours..."
						class="form-password form-control" id="ohours" required></input>
				</div>
				
				<div class="form-group">
					<label style="color: black" class="" for="tahours">Enter TA Office hours</label>
					<input type="text" name="tahours" placeholder="TA office hours..."
						class="form-password form-control" id="tahours" required></input>
				</div>
				
				<div class="form-group">
					<label style="color: black" class="" for="syllabus">Enter Course Syllabus</label>
					<input type="text" name="syllabus" placeholder="Syllabus..."
						class="form-password form-control" id="syllabus" required></input>
				</div>


				


				<input type="submit" class="btn btn-lg btn-default page-scroll"
					value="Post"><br>
				<br>



			</form>
			<p style="font-size: 20px; text-align: center">${warning }</p>
			<p style="font-size: 20px; text-align: center">${success }</p>
		</div>
	</div>
	<!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->
<%@include file="footer.jsp"%>