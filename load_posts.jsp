
<%@page import="com.tech.loom.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.loom.helper.ConnectionProvider"%>
<%@page import="com.tech.loom.dao.PostDao"%>

<div class="row">


	<%
	PostDao d = new PostDao(ConnectionProvider.getConnection());

	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts = null;

	if (cid == 0) {
		posts = d.getAllPosts();
	}else{
		posts = d.getPostByCatId(cid);
	}
	
	if(posts.size()==0){
		
		out.println("<h3 class ='display-3 text-center'>No Posts in this category..</h3>");
		return;
	}
	
	for (Post p : posts) {
	%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<img class="card-img-top" style="height: 180px; width: 344px"
				src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
			<div class="card-body">
				<b><%=p.getpTitle()%></b>
				<p><%=p.getpContent()%></p>
			</div>
			
			
				<div class="card-footer p-2 mr-0">
					<a href="#" class="btn btn-outline-primary btn-sm "> <i class="fa fa-thumbs-o-up"></i><span>20</span></a>
					<a href="#" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o"></i><span>10</span></a>
					<a href="show_blog.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-primary btn-sm" style="margin-left:133px"> Read more...</a>

				</div>
			
			
		</div>

	</div>

	<%
	}
	%>

</div>