<%@ page import="java.sql.*" %>
<%@ page import="Database.AuthDAO" %>
<%ResultSet rs = null;%>
<%@include file="header.jsp"%>
<script type="text/javascript">
    function clicked() {
       if (confirm('Confirm Reservation?')) {
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
				<li><a href="ViewReservedResourceServlet">View Reserved Resources</a></li> 
				
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
				<h3 style="color: black">Reserve Resource</h3>
				<p style="color: black"></p>
			</div>
			<div class="form-top-right">
				<i class="fa fa-pencil"></i>
			</div>
		</div>

		<div  class="form-bottom">
			<form name = "f1" role="form" onsubmit="clicked()" action="ReserveResourceServlet" method="post"
				class="registration-form center_div">
				<%
				AuthDAO ad = new AuthDAO();
				rs = ad.getResource();
				%>
				<div class="form-group">
					<label style="color: black" class="" for="res_name">Select Resource</label><br>


					<select class="form-control" name="res_name" id="res_name"
						onChange="showfield();">
						<%  while(rs.next()){ %>
						<option><%= rs.getString("resourceName")%></option>
						<% } %>
					</select>

				</div>
				
				<div class="form-group">
					<label style="color: black" class="" for="date">Select Date</label> <input
						type="date" name="date" placeholder="Date..."
						class="form-password form-control" id="date" required></input>
				</div>


				<div class="form-group">
					<label style="color: black" class="" for="slot">Select slot</label><br>


					<select class="form-control" name="slot" id="slot"
						onChange="showfield();">
						<option>7-8</option>
						<option>8-9</option>
						<option>9-10</option>
						<option>10-11</option>
						<option>11-12</option>
					</select>
					
				</div>
				
				
				
				<input type="submit" class="btn btn-lg btn-default page-scroll"
					value="Reserve"><br><br>
					
					
			
				</form>
				<p style = "font-size: 20px;text-align: center">${warning }</p>
				<p style = "font-size: 20px;text-align: center">${success }</p>
		</div>
	</div>
	
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->
<%@include file="footer.jsp"%>