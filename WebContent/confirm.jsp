<%@include file="header.jsp"%>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">WebSiteName</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="facultyHome.jsp">Home</a></li>
			<li><a href="courses.jsp">Courses</a></li>
			<li class="active"><a href="resources.jsp">Manage Resources</a></li>
			<li><a href="#">Page 3</a></li>
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
			<li><a href="#">Overview</a></li>
			<li><a href="#">Events</a></li>
			<li><a href="#">Dashboard</a></li>
			<li><a href="#">Services</a></li>
			<li><a href="#">Contact</a></li>
		</ul>
	</div>
	<!-- /#sidebar-wrapper -->
	<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle
		Menu</a>
	<!-- Page Content -->
	<div id="page-content-wrapper">

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 align="center">Confirm Reservation?</h1>
					<p style="text-align: center; font-size: 20px">
						<a  href="ReserveResourceServlet">Yes</a>
						&nbsp;<a  href="reserveResources.jsp">No</a>
					</p>


				</div>
			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->
<%@include file="footer.jsp"%>