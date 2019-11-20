<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@ page import="Manager.User" %>
<%@ include file="Nav2.jsp" %>
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


    <div class="login-dark">
        <form action="LoginE.jsp" method="post">
        	<% if(!message.equals("")){ %>
			<div><p><%= message %></p></div>
			<% } %>
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
            <div class="form-group"><input class="form-control" type="text" name="userID" placeholder="UserID" required></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" name="submit" type="submit">Log In</button></div>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
    			</div>
        	</div>
    	</div>
	</body>
</html>