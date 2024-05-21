<%@page import="com.tech.loom.entities.Post"%>
<%@page import="com.tech.loom.helper.ConnectionProvider"%>
<%@page import="com.tech.loom.dao.PostDao"%>
<%
PostDao d = new PostDao(ConnectionProvider.getConnection());
int postId = Integer.parseInt(request.getParameter("post_id"));

Post post = d.getPostByPostId(postId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>This is blog page</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Custom CSS for styling */
.custom-card {
	background-color: #343a40; /* Dark background color */
	color: #fff; /* White text color */
}
</style>
</head>
<body>
	<div class="container mt-2">
		<div class="row justify-content-center">

			<div class="col-md-10">
				<div class="card custom-card">
					<div class="card-body">
						<h5 class="card-title"><%=post.getpTitle()%></h5>
						<h6 class="card-subtitle mb-2 text-muted">Subtitle or
							additional details</h6>
						<p class="card-text"><%=post.getpContent()%></p>
						<pre class="card-text text-white"><%=post.getpCode()%></pre>
						<!-- Additional content or links can be added here -->
						<a href="#" class="card-link">Card Link</a> <a href="#"
							class="card-link">Another Link</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
