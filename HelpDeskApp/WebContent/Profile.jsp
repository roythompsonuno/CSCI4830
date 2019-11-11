<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Header.jsp" %>
<%@ page import="Manager.User" %>
<%
	User user = (User) session.getAttribute("user");
	String message = "", newPass = null;
	
	if(request.getParameter("submit") != null)
	{
		newPass = request.getParameter("changePass");
		if(newPass.equals(""))
		{
			message = "Password did not change. Enter new Password.";
		}
		else if(newPass.equals(user.getPassword()))
		{
			message = "Password di not change. Current password is the same as new password.";
		}
		else
		{
			user.updatePassword(newPass);
			session.setAttribute("user", user);
		}
	}
%>
		<div>
			<div class="column">
				<h3>User ID: <%=user.getUserID() %></h3>
				<h3>First Name: <%=user.getfName() %></h3>
				<h3>Last Name: <%=user.getlName() %></h3>
				<h3>Email: <%=user.getEmail() %></h3>
				<h3>Phone: <%=user.getPhone() %></h3>
			</div>
			<div class="column">
				<h3>Group: <%=user.getgName() %></h3>
				<h3>Role: <%=user.getrName() %></h3>
				<form action="Profile.jsp" method="post">
					<h3>
						Password: <input type=Password name=changePass>
						<button name="submit" type="submit" value="changePass">Change Password</button>
					</h3>
					<h4><%=message %></h4>
				</form>
			</div>
		</div>
	</body>
</html>