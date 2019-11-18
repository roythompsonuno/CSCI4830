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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
</head>

<body id="page-top">
    </div><nav class="navbar navbar-dark navbar-expand-md bg-secondary" style="font-family: 'Roboto Slab', serif;">
        <div class="container-fluid"><a class="navbar-brand" href="#"><strong>Support Portal</strong></a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div
                class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <% 
				if(isLoggedIn)
				{	%>
					<li class="nav-item" role="presentation"><a class="nav-link active" href="Profile.jsp">Profile</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ViewTicketAdmin.jsp">View Ticket</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="SubmitTicket.jsp">Submit Ticket</a></li>
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
				} %>
                </ul>
                <% 
                if(isLoggedIn) { %>
        			</div><a class="btn btn-danger" role="button" href="SignOut.html">Sign Out</a></div>
        	 <% } %>
    </nav>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
