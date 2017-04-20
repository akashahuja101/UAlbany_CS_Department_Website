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
				<li class="active"><a href="discussion.jsp">Discussion Board</a></li>
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
				<li><a href="topic.jsp">Create New Topic</a></li>
				<li><a href="viewtopic.jsp">View Topics</a></li>
				
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
	<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle
							Menu</a>
		<!-- Page Content -->
		<br> <br> <br> <br>
	<div id="page-content-wrapper">
		<div class="col-md-3"></div>
		<div class="col-md-5">
			<table style="font-size: 20px; text-align: center"
				class="table table-hover">
				<%
					AuthDAO ad = new AuthDAO();
					rs = ad.getTopic();
				%>

				<tr>
					<th style="text-align: center; font-size: 23px">Topic</th>
					<th style="text-align: center; font-size: 23px">Author</th>
					<th style="text-align: center; font-size: 23px">NetID</th>
					<th style="text-align: center; font-size: 23px">Delete Topic</th>
					
				</tr>


				<%
					while (rs.next()) {
				%>
				<tr>
					<td>
						<a href = "reply.jsp?topic=<%=rs.getString(2)%>&amp;author=<%=rs.getString(4)%>"><%
							out.println(rs.getString(2));
						%></a>
					</td>
					<td>
						<%
							out.println(rs.getString(4));
						%>
					</td>
					<td>
						<%
							out.println(rs.getString(3));
						%>
					</td>
					<td><form name="f1"
							action="DeleteTopicServlet"
							method="post" >
							<button type="submit" id="submit" class="btn btn-link">Delete</button>
						</form></td>
					

				</tr>
				<%
					}
				%>

			</table>
			<br> <br>
			<p style="font-size: 20px; text-align: center">${warning }</p>





		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
<%@include file="footer.jsp"%>