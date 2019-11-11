<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Header.jsp" %>
<%@ page import="Manager.*" %>
<%
	User user = (User) session.getAttribute("user");
	Ticket ticket = new Ticket();
	String message = "", desc = "";
	
	if(request.getParameter("edit") != null)
	{
		String id = request.getParameter("edit");
		ticket.getTicket(id);
		session.setAttribute("ticket", ticket);
		if(ticket.getDescription() != null)
		{
			desc = ticket.getDescription();
		}
	}
	else
	{
		ticket = (Ticket) session.getAttribute("ticket");
		int transfer = 0, update = 0, closed = 0, resolved = 0;
		
		if(Integer.parseInt(request.getParameter("impact")) != ticket.getImpactID())
		{
			update++;
			ticket.updateTicket("Impact_ID", request.getParameter("impact"));
		}
		
		if(Integer.parseInt(request.getParameter("categ")) != ticket.getCatID())
		{
			update++;
			ticket.updateTicket("Category_ID", request.getParameter("categ"));
		}
		
		if(Integer.parseInt(request.getParameter("stat")) != ticket.getStatID())
		{
			int action = Integer.parseInt(request.getParameter("stat"));
			
			if(action < 4)
			{
				update++;
			}
			else if(action == 4)
			{
				closed++;
			}
			else
			{
				resolved++;
			}
			
			ticket.updateTicket("Status_ID", request.getParameter("stat"));
		}
		
		if(!request.getParameter("summary").equals("") && !request.getParameter("summary").equals(ticket.getSummary()))
		{
			update++;
			ticket.updateTicket("Summary", request.getParameter("summary"));
		}
		else if(request.getParameter("summary").equals(""))
		{
			message = "Summary is required.";
		}
		
		if(!request.getParameter("description").equals(ticket.getDescription()))
		{
			update++;
			ticket.updateTicket("Description", request.getParameter("description"));
		}
		
		if(Integer.parseInt(request.getParameter("assign")) != ticket.getAssignee())
		{
			transfer++;
			ticket.updateTicket("Assignee", request.getParameter("assign"));
			ticket.updateTicket("Status_ID", "2");
		}
		
		
		if(update != 0 || transfer != 0 || closed != 0 || resolved != 0)
		{
			if(update != 0)
			{
				ticket.addLog(2);		
			}

			if(transfer != 0)
			{
				ticket.addLog(1);
			}
			else if(closed != 0)
			{
				ticket.addLog(3);
			}
			else if(resolved != 0)
			{
				ticket.addLog(4);
			}
			
			ticket.getTicket(Integer.toString(ticket.getUserID()));
			session.setAttribute("ticket", (Ticket) ticket);
		}
	}
%>
		<h2><%=message %></h2>
		<div>
			<form name ="ticketEdit" action="EditTicket.jsp">
				<h1>Ticket Data:</h1>
				<h3>Ticket ID: <%=ticket.getTicketID() %></h3>
				<h3>Submit Date: <%=ticket.getSubmitDate() %></h3>
				<h3>Owner: <%=ticket.getUserName() %></h3>
				<h3>Impact: <select name="impact"><%ticket.getList(out, "Impact", ticket.getImpact()); %></select></h3>
				<h3>Category: <select name="categ"><%ticket.getList(out, "Category", ticket.getCategory()); %></select></h3>
				<h3>Status: <select name="stat"><%ticket.getList(out, "Status", ticket.getStatus()); %></select></h3>
				<h3>Summary: <input type="text" name="summary" value="<%=ticket.getSummary() %>"></h3>
				<h3>Description: <input type="text" name="description" value="<%=desc %>"></h3>
				<h3>Assignee: <select name="assign"><%ticket.getListUser(out, "User", ticket.getAssignee()); %></select></h3>
				<h3 style="align: center"><button name="submit" type="submit" value="0">Save Ticket</button></h3>
			</form>
		</div>
		<div>
			<h1>Log:</h1>
			<table style="width:100%">
				<tr>
					<th>Date</th>
					<th>Action</th>
				</tr>
				<%ticket.getMyLog(out); %>
			</table>
		</div>
	</body>
</html>