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
		<br><br><br><br><br><br><br><br><br>
	<div  class="col-md-4"></div>
	<div  class="col-md-4">
		<div class="form-top center_div">
			<div class="form-top-left">
				<h3 style="color: black">Enter New Topic</h3>
				<p style="color: black"></p>
			</div>
			<div class="form-top-right">
				<i class="fa fa-pencil"></i>
			</div>
		</div>

		<div  class="form-bottom">
			<form role="form" action="InsertTopicServlet" method="post"
				class="registration-form center_div">

				
				<div class="form-group">
					<label style="color: black" class="" for="topic_name">Topic Name:</label> <input
						type="text" name="topic_name" placeholder="Topic..."
						class="form-password form-control" id="topic_name" required></input>
				</div>
				
				<input type="submit" class="btn btn-lg btn-default page-scroll"
					value="Create"><br><br>
					
					
			
				</form>
		</div>
	</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
<%@include file="footer.jsp"%>