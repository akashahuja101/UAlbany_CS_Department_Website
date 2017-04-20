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
				<li><a href="phd.jsp">PhD Student Status</a></li>
				<li><a href="discussion.jsp">Discussion Board</a></li>
				<li class="active"><a href="announcement.jsp">Announcements</a></li>
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
				<li><a href="event.jsp">Events</a></li>
				<li><a href="job.jsp">Jobs</a></li>
				<li><a href="viewjob.jsp">View Jobs</a></li>
				<li><a href="news.jsp">News</a></li>
				
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
		<%
			String netid = session.getAttribute("netid").toString();
		%>
		<%
			AuthDAO ad = new AuthDAO();
			rs = ad.getNews();
		%>

		<h1 style="color: black; text-align: justify">News</h1>
		<br>
		<div class="form-bottom">
			<form role="form" action="NewsServlet" method="post"
				class="registration-form center_div">



				<div style="text-align: justify; font-size: 20px" class="form-group">


					<label style="color: black" class="" for="name">Enter
						News:</label><input type="text" name="news" placeholder="News..."
						class="form-first-name form-control" id="news" required>

				</div>
				<input type="submit" class="btn btn-lg btn-default page-scroll"
					value="Post"><br> <br> <br>
				<%
					while (rs.next()) {
				%>

				<div style="text-align: justify; font-size: 20px" class="form-group">


					<label style="color: black" class="" for="name">Posted by <%
						out.println(rs.getString(4));
					%> on <%
						out.println(rs.getString(3));
					%></label><br>
					<%
						out.println(rs.getString(2));
					%>
					<br>
					<%
						if (netid.equals(rs.getString(4))) {
					%>
					<a href="EditNews.jsp?content=<%=rs.getString(2)%>">Edit</a>&nbsp&nbsp<a href="DeleteNewsServlet?content=<%=rs.getString(2)%>">Delete</a>
					<%
						}
					%>

				</div>




			</form>
			<p style="font-size: 20px; text-align: center; color: red">${warning }</p>
			<%
				}
			%>
		</div>
	</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
<%@include file="footer.jsp"%>