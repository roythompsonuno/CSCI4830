<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
<%@ page import="Manager.*" %>
<%
	User user = (User) session.getAttribute("user");
%>
		<div>
			<h1>MY TICKETS</h1>
			<table style="width:100%">
				<tr>
					<th>Ticket Number</th>
					<th>Impact</th>
					<th>Summary</th>
					<th>Status</th>
					<%
						if(user.isSupport())
						{
							%><th>Edit</th><%
						}
					%>
				</tr>
				<%user.getMyTicket(out, "User_ID"); %>
			</table>
		</div>
		<%
			if(user.isSupport())
			{
				%>
					<div>
						<h1>ASSIGNED TICKETS</h1>
						<table style="width:100%">
							<tr>
								<th>Ticket Number</th>
								<th>Impact</th>
								<th>Summary</th>
								<th>Status</th>
								<th>Edit</th>
							</tr>
							<%user.getMyTicket(out, "Assignee"); %>
						</table>
					</div>
					<div>
						<h1>UNASSIGNED TICKETS</h1>
						<table style="width:100%">
							<tr>
								<th>Ticket Number</th>
								<th>Impact</th>
								<th>Summary</th>
								<th>Status</th>
								<th>Edit</th>
							</tr>
							<%user.getNoTicket(out, "Assignee"); %>
						</table>
					</div>
				<%
			}
		%>
    			</div>
        	</div>
    	</div>		
	</body>
</html>