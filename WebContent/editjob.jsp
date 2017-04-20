<%@ page import="java.sql.*"%>
<%@ page import="Database.AuthDAO"%>
<%
	ResultSet rs = null;
%>
<%@include file="header.jsp"%>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">WebSiteName</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="facultyHome.jsp">Home</a></li>
				<li><a href="profilepage.jsp">Profile</a></li>
				<li><a href="courses.jsp">Courses</a></li>
				<li><a href="resources.jsp">Manage Resources</a></li>
				<li><a href="phd.jsp">PhD Student Status</a></li>
				<li><a href="discussion.jsp">Discussion Board</a></li>
				<li class="active"><a href="announcement.jsp">Announcements</a></li>
			</ul>
		</div>
	</nav>
	<%String oldjob = request.getParameter("job");
	String oldlink = request.getParameter("link");	%>
	
	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#"> Explore </a></li>
				<li><a href="event.jsp">Events</a></li>
				<li><a href="job.jsp">Jobs</a></li>
				<li><a href="#">News</a></li>
				
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
	<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle
							Menu</a>
		<!-- Page Content -->
		<br> <br> <br>

	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="form-top center_div">
			<div class="form-top-left">
				<h3 style="color: black"></h3>
				<p style="color: black"></p>
			</div>
			<div class="form-top-right">
				<i class="fa fa-pencil"></i>
			</div>
		</div>
		<h1 style="color: black; text-align: justify">Jobs</h1>
		<br>
		<div class="form-bottom">
			<form role="form" action="EditJobServlet?oldjob=<%=oldjob%>" method="post"
				class="registration-form center_div">



				<div style="text-align: justify; font-size: 20px" class="form-group">


					<label style="color: black" class="" for="name">Enter
						Job Description:</label><input type="text" name="job" value="<%=oldjob %>"
						class="form-first-name form-control" id="job" required>

				</div>
				<div class="form-group">
					<label style="color: black" class="" for="type">Job Type</label><br>


					<select class="form-control" name="type" id="type"
						onChange="showfield();">
						<option value="On Campus">On Campus</option>
						<option value="Off campus">Off campus</option>
						
					</select>

				</div>
				
				<div style="text-align: justify; font-size: 20px" class="form-group">


					<label style="color: black" class="" for="link">Enter
						Job Link:</label><input type="text" name="link" value="<%=oldlink %>"
						class="form-first-name form-control" id="link" required>

				</div>
				<input type="submit" class="btn btn-lg btn-default page-scroll"
					value="Update"><br> <br> <br>
					</form>
			<p style="font-size: 20px; text-align: center; color: red">${warning }</p>
			
		</div>
	</div>
		
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
<%@include file="footer.jsp"%>