<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp" %>
<%@ page import="Manager.User" %>
<%
	User user = new User();
	String message = "";
	int err = 0;
	
	if(request.getParameter("edituser") != null)
	{
		user.getProfileData(request.getParameter("edituser"));
		session.setAttribute("changeUser", (User) user);
	}
	else if(request.getParameter("removeUser") != null)
	{
		System.out.print("\n\n\n\n\n\n\n\n\n");
		user = (User) session.getAttribute("changeUser");
		user.removeUser();
		response.sendRedirect("AddRemoveUser.jsp");
	}
	else
	{
		user = (User) session.getAttribute("changeUser");
		if(!request.getParameter("fName").equals("") && !request.getParameter("fName").equals(user.getfName()))
		{
			user.updateUser("First_Name", request.getParameter("fName"));
		}
		else if(request.getParameter("fName").equals(""))
		{
			message = "First Name is required.";
			err++;
		}
		
		if(!request.getParameter("lName").equals("") && !request.getParameter("lName").equals(user.getlName()))
		{
			user.updateUser("Last_Name", request.getParameter("lName"));
		}
		else if(request.getParameter("lName").equals(""))
		{
			message = "Last Name is required.";
			err++;
		}
		
		if(!request.getParameter("phone").equals("") && !request.getParameter("phone").equals(user.getPhone()))
		{
			user.updateUser("Phone_Number", request.getParameter("phone"));
		}
		else if(request.getParameter("phone").equals(""))
		{
			message = "Phone Number is required.";
			err++;
		}
		
		if(!request.getParameter("email").equals("") && !request.getParameter("email").equals(user.getEmail()))
		{
			user.updateUser("Email_Address", request.getParameter("email"));
		}
		else if(request.getParameter("email").equals(""))
		{
			message = "Email Address is required.";
			err++;
		}
		
		if(Integer.parseInt(request.getParameter("role")) != user.getRoleID())
		{
			user.updateUser("Role_ID", request.getParameter("role"));
		}
		
		if(!request.getParameter("pass").equals(user.getPassword()))
		{
			user.updateUser("Password", request.getParameter("pass"));
		}
		
		if(err == 0)
		{
			user.getProfileData(request.getParameter("edituser"));
			session.setAttribute("changeUser", (User) user);
			response.sendRedirect("AddRemoveUser.jsp");
		}
	}
%>
		<h2><%=message %></h2>
		<div>
			<form action="EditUser.jsp">
				<h1>User Data:</h1>
				<h3>User ID: <%=user.getUserID() %></h3>
				<h3>Password: <input type="Password" name="pass"></h3>
				<h3>First Name: <input type="text" name="fName" value="<%=user.getfName() %>"></h3>
				<h3>Last Name: <input type="text" name="lName" value="<%=user.getlName() %>"></h3>
				<h3>Phone: <input type="text" name="phone" value="<%=user.getPhone() %>"></h3>
				<h3>Email: <input type="text" name="email" value="<%=user.getEmail() %>"></h3>
				<h3>Role: <select name="role"><%user.getList(out, "Role", user.getRoleID()); %></select></h3>
				<h3 style="align: center"><button name="sumbit" type="submit" value="0">Save User</button></h3>
				<h3 style="align: center"><button name="removeUser" type="submit" value="0">Remove User</button></h3>
			</form>
		</div>
	</body>
</html>