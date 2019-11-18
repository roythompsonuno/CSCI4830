<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Header.jsp" %>
<%@ page import="Manager.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	User user = (User) session.getAttribute("user");
	Ticket ticket = (Ticket) new Ticket();
	String message = "";
	DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	Date date = new Date();
	int lastTicket = ticket.getLastTicketNumber();;
	
	if(request.getParameter("submit") != null)
	{
		if(request.getParameter("summary").equals(""))
		{
			message = "Summary is Required.";
		}
		else
		{
			ticket.setSummary(request.getParameter("summary"));
			
			if(!request.getParameter("description").equals(""))
			{
				ticket.setDescription(request.getParameter("description"));
			}
			
			ticket.setImpactID(Integer.parseInt(request.getParameter("impact")));
			ticket.setCatID(Integer.parseInt(request.getParameter("categ")));
			ticket.setStatID(1);
			ticket.setUserID(user.getUserID());
			
			ticket.addNewTicket();
			
			session.setAttribute("ticket", (Ticket) ticket);
			
			response.sendRedirect("ViewTicket.jsp");
		}
	}
%>
	<h2><%=message %></h2>
		<div>
			<form action="SubmitTicket.jsp" method="post">
				<h1>New Ticket:</h1>
				<h3>Ticket ID: <%=lastTicket %></h3>
				<h3>Submit Date: <%=df.format(date) %></h3>
				<h3>Owner: <%=user.getlName() %>, <%=user.getfName() %></h3>
				<h3>Impact: <select name="impact"><%ticket.getList(out, "Impact", ""); %></select></h3>
				<h3>Category: <select name="categ"><%ticket.getList(out, "Category", ""); %></select></h3>
				<h3>Summary: <input type="text" name="summary" value=""></h3>
				<h3>Description: <input type="text" name="description" value=""></h3>
				<h3 style="align: center"><button name="submit" type="submit" value="0">Save Ticket</button></h3>
			</form>
		</div>
</html>