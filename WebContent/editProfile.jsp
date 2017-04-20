<%@ page import="java.sql.*"%>
<%@ page import="Database.AuthDAO"%>
<%
	ResultSet rs = null;
%>
<%@include file="header.jsp"%>
<script>function checkPasswordMatch() {
    var password = $("#pwd").val();
    var confirmPassword = $("#cpwd").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("<font color='red'>Passwords do not match!</font>");
    else
        $("#divCheckPasswordMatch").html("<font color='green'>Passwords match.</font>");
}

$(document).ready(function () {
   $("#cpwd").keyup(checkPasswordMatch);
});
</script>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">UAlbany</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="facultyHome.jsp">Home</a></li>
			<li class="active"><a href="profilepage.jsp">Profile</a></li>
			<li><a href="courses.jsp">Courses</a></li>
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
			<li><a href="profile.jsp">View Profile</a></li>

		</ul>
	</div>
	<!-- /#sidebar-wrapper -->
	<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle
		Menu</a>
	<!-- Page Content -->
	<br> <br> <br> <br> <br> <br> <br> <br>
	<br>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="form-top center_div">
			<div class="form-top-left">
				<h3 style="color: black">Enter New Course info</h3>
				<p style="color: black"></p>
			</div>
			<div class="form-top-right">
				<i class="fa fa-pencil"></i>
			</div>
		</div>
		<%
			AuthDAO ad = new AuthDAO();
			rs = ad.getProfile(session.getAttribute("netid").toString());
		%>

		<div class="form-bottom">
			<form role="form" action="ProfileServlet" method="post"
				class="registration-form center_div">
				<%
					while (rs.next()) {
				%>

				<div class="form-group">
					<label style="color: black" class="" for="fname">First name</label>
					<input type="text" name="fname" value="<%out.println(rs.getString(1)); %>"
						class="form-first-name form-control" id="form-first-name" required>
				</div>
				<div class="form-group">
					<label style="color: black" class="" for="lname">Last name</label>
					<input id="lname" type="text" name="lname"
						value="<%out.println(rs.getString(2)); %>" class="form-last-name form-control"
						id="form-last-name" required>
				</div>
				<div class="form-group">
					<label style="color: black" class="" for="pwd">Enter New Password</label>
					<input type="password" name="pwd" value=""
						class="form-first-name form-control" id="pwd" required>
				</div>
				<div class="form-group">
					<label style="color: black" class="" for="pwd">Confirm Password</label>
					<input type="password" name="cpwd" onchange="checkPasswordMatch();"
						class="form-first-name form-control" id="cpwd" required>
				</div>
				<div style = "font-size: 20px" class="registrationFormAlert" id="divCheckPasswordMatch"></div>
				
				<br>

				<input type="submit" class="btn btn-lg btn-default page-scroll"
					value="Update"><br> <br>



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