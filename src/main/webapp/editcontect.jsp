<%@page import="com.entity.Contect"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg", "Please Login..");
		response.sendRedirect("login.jsp");
	}
	%>

	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Contect Page</h4>

						<%
						
						String errorMsg = (String) session.getAttribute("failedMsg");
						if (errorMsg != null) {
						%>
						<p class="text-success text-center"><%=errorMsg%></p>
						<%
						session.removeAttribute("failedMsg");
						}
						%>

						<form action="update" method="post">

							<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDAO dao = new ContactDAO(DbConnect.getConn());
							Contect c = dao.getContectByID(cid);
							%>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									value="<%=c.getName()%>" name="name" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									value="<%=c.getEmail()%>" name="email" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone Number</label> <input
									value="<%=c.getPhno()%>" name="phno" type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<textarea rows="3" cols="" placeholder="Enter about "
									name="about" class="form-control">  value="<%=c.getAbout()%>"</textarea>

							</div>



							<div class="text-center mg-2">
								<button type="submit" class="btn btn-primary">Update
									Contect</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="component/footer.jsp"%>
</body>
</html>