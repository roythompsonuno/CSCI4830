<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ page import="Manager.User" %>
<%@ include file="Header.jsp" %>
<%
	if(session.getAttribute("isLoggedIn") != null)
	{
		if((Boolean) session.getAttribute("isLoggedIn"))
		{
			response.sendRedirect("ViewTicket.jsp");
		}
	}

	User user = new User();
	String userID = null, password = null, message = "";

	if(request.getParameter("submit") != null)
	{
		userID = request.getParameter("userID");
		password = request.getParameter("password");
		
		if(userID.equals("") || password.equals(""))
		{
			message = "User ID and Password Required.";
		}
		else if(user.CheckLogin(userID, password))
		{
			session.setAttribute("isLoggedIn", true);
			session.setAttribute("user", user);
			response.sendRedirect("ViewTicket.jsp");
		}
		else
		{
			message = "User ID and/or Password not Found";
			session.invalidate();
		}
}

%>
		<div>
			<form action="Login.jsp" method="post">
				<div class="header">
					<% if(!message.equals("")){ %>
					<div><p><%= message %></p></div>
					<% } %>
					<a>Log in:</a>
					<div>
						<label>User ID:</label>
						<input type="text" name="userID">
					</div>
					<div>
						<label>Password:</label>
						<input type="password" name="password">
					</div>
					<div>
						<button name="submit" type="submit">Login</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>