<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp" %>
<%@ page import="Manager.User" %>
<%
	User user = new User();
	String message = "";
	if(request.getParameter("addUser") != null)
	{
		if(request.getParameter("fName").equals(""))
		{
			message = "First Name is required.";
		}
		else if(request.getParameter("lName").equals(""))
		{
			message = "Last Name is required.";
		}
		else if(request.getParameter("phone").equals(""))
		{
			message = "Phone Number is required.";
		}
		else if(request.getParameter("email").equals(""))
		{
			message = "Email Address is required.";
		}
		else if(request.getParameter("pass").equals(""))
		{
			message = "Password is required.";
		}
		else
		{
			user.setfName(request.getParameter("fName"));
			user.setlName(request.getParameter("lName"));
			user.setEmail(request.getParameter("email"));
			user.setPhone(request.getParameter("phone"));
			user.setPassword(request.getParameter("pass"));
			user.setRoleID(Integer.parseInt(request.getParameter("role")));
			user.addNewUser();
		}		
	}
%>
		<div>
			<h1>All Users:</h1>
			<h3><%= message%></h3>
			<table style="width:100%">
				<tr>
					<th>User ID</th>
					<th>Name</th>
					<th>Role</th>
					<th>Edit</th>
				</tr>
				<% user.getUserList(out); %>
			</table>
		</div>
		<div>
			<h1>Add New User:</h1>
			<h3><%=message %></h3>
			<form action="AddRemoveUser.jsp" method="post">
				<div class="column">
					<h3>First Name: <input type="text" name="fName"></h3>
					<h3>Phone Number: <input type="text" name="phone"></h3>
					<h3>Password: <input type="password" name="pass"></h3>
					<h3 style="align: center"><button name="addUser" type="submit" value="0">Add User</button></h3>
				</div>
				<div class="column">
					<h3>Last Name: <input type="text" name="lName"></h3>
					<h3>Email Address: <input type="text" name="email"></h3>
					<h3>Role: <select name="role"><%user.getList(out, "Role", 0); %></select></h3>
				</div>
			</form>
		</div>
	</body>
</html>