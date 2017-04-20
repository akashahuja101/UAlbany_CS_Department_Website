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
			<li><a href="announcement.jsp">Announcements</a></li>
			<li class="active"><a href="alumni.jsp">Alumni</a></li>
			<li><a href="exam.jsp">Exams</a></li>
			<li><a href="LogoutServlet">Logout</a></li>
		</ul>
	</div>
</nav>
<%
	AuthDAO ad = new AuthDAO();
	rs = ad.getAlumni();
%>
<%
	String netid = session.getAttribute("netid").toString();
%>

<div id="wrapper">

	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand"><a href="#"> Explore </a></li>
			<li><a href="createAlumni.jsp">Create Alumni</a></li>
				<li><a href="viewAlumni.jsp">View Alumni Info</a></li>


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

				<tr>
					<th style="text-align: center; font-size: 23px">Alumni</th>
					<th style="text-align: center; font-size: 23px">Year</th>
					<th style="text-align: center; font-size: 23px">Members</th>
					<th style="text-align: center; font-size: 23px">Links</th>
					<th style="text-align: center; font-size: 23px">Posted By</th>
					<th style="text-align: center; font-size: 23px">Edit</th>
				</tr>


				<%
					while (rs.next()) {
				%>
				<tr>
					<td>
						<%
							out.println(rs.getString(2));
						%>
					</td>
					<td>
						<%
							out.println(rs.getString(3));
						%>
					</td>
					<td>
						<%
							out.println(rs.getString(4));
						%>
					</td>
					<td><a href=""> <%
 	out.println(rs.getString(5));
 %>
					</a></td>
					<td>
						<%
							out.println(rs.getString(6));
						%>
					</td>

					<td><a href="editalumni.jsp?id=<%=rs.getString(1)%>">Edit</a>
					</td>


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