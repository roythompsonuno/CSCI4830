<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="Manager.User" %>
<%
	boolean isLoggedIn =false, isAdmin = false; 

	if(session.getAttribute("isLoggedIn") != null )
	{
		isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
		User user = (User) session.getAttribute("user");
		isAdmin = user.isAdmin();
	}
%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="css/Main.css"/>
	</head>
	<body>
		<div class="header">
			IT Support Ticketing System
			
			<%
				if(isLoggedIn)
				{ %>
					<form action="SignOut.jsp" method="post">
						<button style="float: right;" >Sign out</button>
					</form>
			<%  } %>
		</div>
		<div class="main_nav">
			<% 
				if(isLoggedIn)
				{	%>
					<a href="Profile.jsp">Profile</a>
					<a href="ViewTicket.jsp">View Ticket</a>
					<a href="SubmitTicket.jsp">Submit Ticket</a>
					<%
						if(isAdmin)
						{
							%>
							<a href="AddRemoveUser.jsp">Add/Remove User</a>
							<%
						}
					%>
					<a href="FAQ.jsp">FAQ</a>
			<%	}
				else
				{
					%><a href="Login.jsp">Home</a><%
				}			
			%>
		</div>	