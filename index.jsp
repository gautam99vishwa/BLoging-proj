<%@page import="java.util.List"%>
<%@page import="com.tech.loom.entities.Post"%>
<%@page import="com.tech.loom.dao.PostDao"%>
<%@page import="com.tech.loom.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>TechLoom</title>

<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.container-fluid {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 75% 94%, 49% 99%, 23% 94%,
		0 99%, 0% 35%, 0 0);
}
</style>
</head>
<body>

	<%@include file="normal_navbar.jsp"%>

	<!-- Banner  -->
	<div class="container-fluid p-0 m-0">

		<div class="jumbotron bg-dark text-white">
			<div class="container">
				<h3 class="display-2">Welcome to Tech Blog</h3>
				<p>A programming language is a system of notation for writing
					computer programs. The source code for a simple computer program
					written in the C programming language.</p>
				<p>A language usually has at least one implementation in the
					form of a compiler or interpreter, allowing programs written in the
					language to be executed.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-external-link"></span>Start! it's free
				</button>
				<a href="Login.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa fa-user-o"></span>Login
				</a>

			</div>
		</div>


	</div>


	<!-- Cards  -->
	<div class="container">

		<div class="row mb-2">

			<%
			PostDao posts = new PostDao(ConnectionProvider.getConnection());
			List<Post> p = posts.getAllPosts();

			for (Post post : p) {
			%>

			<div class="col-md-4">
				<div class="card">
			<img class="card-img-top" style="height: 180px; width: 344px"
				src="blog_pics/<%=post.getpPic()%>" alt="Card image cap">
			<div class="card-body">
				<b><%=post.getpTitle()%></b>
				<p><%=post.getpContent()%></p>
			</div>
			
			
				<div class="card-footer p-2 mr-0">
					<a href="#" class="btn btn-outline-primary btn-sm "> <i class="fa fa-thumbs-o-up"></i><span>20</span></a>
					<a href="#" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o"></i><span>10</span></a>
					<a href="show_blog.jsp?post_id=<%=post.getPid() %>" class="btn btn-outline-primary btn-sm" style="margin-left:133px"> Read more...</a>

				</div>
			
			
		</div>
			</div>
			<%
			}
			%>
		</div>



	</div>


	<!-- JavaScript -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>