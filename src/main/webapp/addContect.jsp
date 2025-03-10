<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #dfe6e0;">
	<%@ include file="component/navbar.jsp"%>

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
						String sucssMsg = (String) session.getAttribute("succMsg");
						String errorMsg = (String) session.getAttribute("failedMsg");

						if (sucssMsg != null) {
						%>
						<p class="text-success text-center"><%=sucssMsg%></p>
						<%
						session.removeAttribute("succMsg");
						}
						if (errorMsg != null) {
						%>
						<p class="text-success text-center"><%=errorMsg%></p>
						<%
						session.removeAttribute("failedMsg");
						}
						%>
						
						<form action="addContact" method="post">
						
						<%
							if(user!=null)
							{ %>
								<input type="hidden" value="<%=user.getId()%>" name="userid">
								
							<%}
						%>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									name="name" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone Number</label> <input
									name="phno" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<textarea rows="3" cols="" placeholder="Enter about "
									name="about" class="form-control"></textarea>

							</div>



							<div class="text-center mg-2">
								<button type="submit" class="btn btn-primary">Save
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