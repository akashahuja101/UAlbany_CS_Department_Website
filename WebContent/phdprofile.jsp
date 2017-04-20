<%@ page import="java.sql.*"%>
<%@ page import="Database.AuthDAO"%>
<%
	ResultSet rs = null;
	
%>
<%@include file="header.jsp"%>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">UAlbany</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="facultyHome.jsp">Home</a></li>
				<li><a href="profilepage.jsp">Profile</a></li>
				<li><a href="courses.jsp">Courses</a></li>
				<li><a href="resources.jsp">Manage Resources</a></li>
				<li class = "active"><a href="phd.jsp">PhD Student Status</a></li>
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
				<li><a href="viewphd.jsp">View PhD Students</a></li>
				
				
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle
		Menu</a>
		<br> <br> <br> <br> <br>
	<br>
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
		<%String netid = request.getParameter("id"); %>
		<%
			AuthDAO ad = new AuthDAO();
			rs = ad.getPhdAgain(netid);
		%>
		<%
					while (rs.next()) {
				%>

		<div class="form-bottom">
			<form role="form" action="PhdStatusServlet?id=<%=rs.getString(3)%>" method="post"
				class="registration-form center_div">
				
				

				<div style = "text-align: justify;font-size: 20px" class="form-group">
				<h1 style="color: black;text-align: justify">Profile</h1><br>
					
					<label style="color: black" class="" for="name">Name:</label><%out.println(rs.getString(1)); %><%out.println(rs.getString(2)); %>
					<br><br><label style="color: black" class="" for="netid">NetID:</label><%out.println(rs.getString(3)); %>
					<br><br><label style="color: black" class="" for="year">Year Of joining:</label><%out.println(rs.getString(5)); %>
					<br><br><label style="color: black" class="" for="major">Major:</label><%out.println(rs.getString(7)); %>
					<br><br><label style="color: black" class="" for="status">Status:</label><%out.println(rs.getString(8)); %>
					
				</div><br>
				<div style = "text-align: justify;font-size: 20px" class="form-group">
					<label style="color: black" class="" for="status">Edit Status</label>
					<input type="text" name="status" placeholder="Status..."
						class="form-first-name form-control" id="status" required>
				</div>
				<input type="submit" class="btn btn-lg btn-default page-scroll"
					value="Update">
				
				
				

			</form>
			<p style = "font-size: 20px;text-align: center; color: red">${warning }</p>
			<%
					}
				%>
		</div>
	</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
<%@include file="footer.jsp"%>