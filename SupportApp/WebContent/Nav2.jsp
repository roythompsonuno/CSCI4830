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
    <title>Supportal</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="material-icons">filter_8</i></div>
                    <div class="sidebar-brand-text mx-3"><span>Supportal</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="nav navbar-nav text-light" id="accordionSidebar"> 
                <% 
				if(isLoggedIn)
				{	%>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ProfileE.jsp" style="padding-bottom: 2px;padding-top: 16px;"><span>Profile</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ViewTicket.jsp" style="padding-bottom: 2px;padding-top: 2px;"><span>View Ticket</span></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="SubmitTicket.jsp" style="padding-top: 2px;padding-bottom: 2px;"><span>Submit Ticket</span></a></li>
                    <%
						if(isAdmin)
						{
							%>
                    		<li class="nav-item" role="presentation"><a class="nav-link" href="AddRemoveUser.jsp" style="padding-top: 2px;padding-bottom: 2px;"><span>Add/Remove User</span></a></li>
                    		<%
						}
					%>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="FAQ.jsp" style="padding-top: 2px;padding-bottom: 2px;"><span>FAQ</span></a></li>
               <%}
				 else
				 {
			   %>	<li class="nav-item" role="presentation"><a class="nav-link" href="LoginE.jsp" style="padding-bottom: 2px;padding-top: 16px;">Login</a></li>
			  <% } %>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" data-toggle="collapse" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <ul class="nav navbar-nav flex-nowrap ml-auto">
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow" role="presentation">
                            <%
                            if(isLoggedIn) { %>
                            <a class="nav-link" href="SignOut.jsp"><span>Sign Out&nbsp;</span><img class="rounded-circle img-fluid" src="assets/img/avatars/avatar5.jpeg" width="45" height="45"></a></li>
                         <% } %>
                        </ul>
                    </div>
                </nav>
            
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>