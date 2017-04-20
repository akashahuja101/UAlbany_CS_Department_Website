<%@ page import="java.util.ArrayList"%>
<%@ page import="model.resourceModel"%>
<%@include file="header.jsp"%>
<%
	ArrayList<resourceModel> viewresource = (ArrayList<resourceModel>) request.getAttribute("resource");
%>
<script type="text/javascript">
	function clicked() {
		if (confirm('Cancel Reservation?')) {
			f1.submit();
		} else {
			return false;
		}
	}
</script>


<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">UAlbany</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="facultyHome.jsp">Home</a></li>
			<li><a href="profilepage.jsp">Profile</a></li>
			<li><a href="courses.jsp">Courses</a></li>
			<li class="active"><a href="resources.jsp">Manage Resources</a></li>
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
			<li><a href="createresource.jsp">Create New Resource</a></li>
			<li><a href="reserveResources.jsp">Reserve Resource</a></li>
			<li><a href="ViewReservedResourceServlet">View Reserved
					Resources</a></li>
		
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
					<th style="text-align: center; font-size: 23px">Resource Name</th>
					<th style="text-align: center; font-size: 23px">Date</th>
					<th style="text-align: center; font-size: 23px">Time Slot</th>
					<th style="text-align: center; font-size: 23px">Cancel
						Reservation</th>
				</tr>


				<%
					for (int i = 0; i < viewresource.size(); i++) {
				%>
				<tr>
					<td>
						<%
							out.println(viewresource.get(i).getResource_name());
						%>
					</td>
					<td>
						<%
							out.println(viewresource.get(i).getDate());
						%>
					</td>
					<td>
						<%
							out.println(viewresource.get(i).getSlot());
						%>
					</td>

					<td><form name="f1"
							action="CancelReservationServlet?name=<%=viewresource.get(i).getResource_name()%>&amp;date=<%=viewresource.get(i).getDate()%>&amp;slot=<%=viewresource.get(i).getSlot()%>"
							method="post" onsubmit="clicked()">
							<button type="submit" id="submit" class="btn btn-link">Cancel
								Reservation</button>
						</form></td>
				</tr>
				<%
					}
				%>

			</table>
			<br> <br>






		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
	<%@include file="footer.jsp"%>