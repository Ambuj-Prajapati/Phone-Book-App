<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #CEF5D1">
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Login Page</h4>
						<%
						String invalidMsg=(String)session.getAttribute("invalidMsg");
						if(invalidMsg!=null)
						{%>
						<p class="text-danger text-center"><%=invalidMsg %></p>	
						
						<% 
						session.removeAttribute("invalidMsg");
						}
						%>
						
						<%
						String logMsg=(String)session.getAttribute("logMsg");
						if(logMsg!=null)
						{%>
						<p class="text-success text-center"><%=logMsg %></p>	
						
						<% 
						session.removeAttribute("invalidMsg");
						}
						%> 
						
						<form action="Login" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="password"
									type="password" class="form-control" id="exampleInputPassword1">
							</div>

							<div class="text-center mg-2">
								<button type="submit" class="btn btn-primary">Login</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 200px">
		<%@include file="component/footer.jsp"%>
	</div>
</body>
</html>