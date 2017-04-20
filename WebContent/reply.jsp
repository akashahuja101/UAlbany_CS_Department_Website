<%@ page import="java.sql.*"%>
<%@ page import="Database.AuthDAO"%>
<%
	ResultSet rs1 = null;
	ResultSet rs2 = null;
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
			<li class="active"><a href="discussion.jsp">Discussion Board</a></li>
			<li><a href="#">Page 3</a></li>
		</ul>
	</div>
</nav>
<%
	String topic = request.getParameter("topic");
	String author = request.getParameter("author");
	String parent = request.getParameter("parent");
%>
<%
	AuthDAO ad = new AuthDAO();

	rs1 = ad.getQuestion();
	rs2 = ad.getReply(parent,topic);
%>

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
		<h1 style="color: black; text-align: center">
			<%
				out.println(topic);
			%>
		</h1>
		<h2 style="color: black; text-align: right">
			<%
				out.println("-" + author);
			%></h1>
			<br>


			<div class="form-bottom">
				<form role="form"
					action="InsertQuestion?topic=<%=topic%>&amp;author=<%=author%>"
					method="post" class="registration-form center_div">


					<div style="text-align: justify; font-size: 20px"
						class="form-group">
						<label style="color: black" class="" for="ques">Post
							Question: </label> <input type="text" name="ques"
							placeholder="Question.." class="form-first-name form-control"
							id="ques" required>
					</div>
					<input type="submit" class="btn btn-lg btn-default page-scroll"
						value="Post">


				</form>
				<br> <br>
				<%
					while (rs1.next()) {
				%>


				<form role="form"
					action="InsertReplyServlet?topic=<%=topic%>&amp;author=<%=author%>&amp;content=<%=rs1.getString(3)%>	"
					method="post" class="registration-form center_div">

					<div style="text-align: justify; font-size: 20px"
						class="form-group">
						<label style="color: black" class="" for="ques"> Question:
						</label>
						<%
							out.println(rs1.getString(3));
						%><br> <label style="color: black" class="" for="reply">Reply:</label><input
							type="text" name="reply" placeholder="reply.."
							class="form-first-name form-control" id="reply" required>
						<input type="submit" class="btn btn-lg btn-default page-scroll"
							value="Reply">
							<br>
						<%
							while(rs2.next()) {
						%>
						<%
							out.println(rs2.getString(3));
						out.println("<a href=''>Delete</a>");
						%>
						<br>
						<%
							}
						%>
						
					</div>



				</form>
				<%
					}
				%>

				<p style="font-size: 20px; text-align: center; color: red">${warning }</p>

			</div>
	</div>


	<!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->
<%@include file="footer.jsp"%>