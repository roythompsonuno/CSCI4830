<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
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
		
		if(ticket.getDescription() != null)
		{
			desc = ticket.getDescription();
		}
		
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
				resolved++;
			}
			else
			{
				closed++;
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
			
			ticket.getTicket(Integer.toString(ticket.getTicketID()));
			session.setAttribute("ticket", (Ticket) ticket);
		}
	}
%>

    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col m-auto">
                        <h1 class="text-primary">Edit Ticket:</h1>
                    </div>
                    <div class="col text-center m-auto">
                        <div class="table-responsive bg-light border rounded">
                            <table class="table table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th class="text-primary">Ticket ID</th>
                                        <th class="text-primary">Submit Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%=ticket.getTicketID() %></td>
                                        <td><%=ticket.getSubmitDate() %></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="container-fluid" style="padding-left: 0px;">
                    <form name="ticketEdit" action="EditTicketE.jsp">
                        <div class="form-row">
                            <div class="col">
                                <div class="form-group"><label><strong>First Name:</strong></label><input class="form-control" type="text" readonly=""><%ticket.getUserName(1); %></div>
                                <div class="form-group"><label><strong>Last Name:&nbsp;</strong></label><input class="form-control" type="text" readonly=""><%ticket.getUserName(2); %></div>
                            </div>
                            <div class="col">
                                <div class="form-group"><label><strong>Category</strong>:&nbsp;</label><select class="form-control" name="categ"><%ticket.getList(out, "Category", ticket.getCategory()); %></select></div>
                                <div class="form-group"><label><strong>Impact</strong>:</label><select class="form-control" name="impact"><%ticket.getList(out, "Impact", ticket.getImpact()); %></select></div>
                        </div>
                        <div class="col offset-md-0">
                            <div class="form-group"><label><strong>Status:</strong></label><select class="form-control" name="stat"><%ticket.getList(out, "Status", ticket.getStatus()); %></select></div>
                            <div class="form-group"><label><strong>Assignee:</strong></label><select class="form-control" name="assign"><%ticket.getListUser(out, "User", ticket.getAssignee()); %></select></div>
                </div>
            </div>
            <div class="form-row">
                <div class="col"><label><strong>Description:&nbsp;</strong></label><textarea class="form-control" name="description" value="<%=desc %>"></textarea></div>
                <div class="col">
                    <div class="form-group"><label><strong>Solution:&nbsp;</strong></label><textarea class="form-control" name="summary" value="<%=ticket.getSummary() %>"></textarea></div>
                </div>
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="table-responsive border rounded">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%ticket.getMyLog(out); %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-2 text-right align-self-center">
                    <div class="clearfix"></div><button class="btn btn-success btn-block btn-lg" type="submit" name="submit" value="0">Save</button></div>
                <div class="col-2 align-self-center">
                    <div class="clearfix"></div><button class="btn btn-danger btn-block btn-lg" type="reset" name="reset">Cancel</button></div>
            </div>
            </form>
        </div>
    </div>
    <footer class="bg-white sticky-footer">
        <div class="container my-auto">
            <div class="text-center my-auto copyright"><span>Copyright © G8 Development 2019</span></div>
        </div>
    </footer>
    </div>
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