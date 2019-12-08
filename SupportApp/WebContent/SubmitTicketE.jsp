<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Nav2.jsp" %>
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
			
			response.sendRedirect("ViewTicketE.jsp");
		}
	}
%>
    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col m-auto">
                        <h1 class="text-primary">New Ticket:</h1>
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
                                        <td><%=lastTicket %></td>
                                        <td><%=df.format(date) %></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="container-fluid" style="padding-left: 0px;">
                    <form action="SubmitTicketE.jsp" method="post">
                        <div class="form-row">
                            <div class="col">
                                <div class="form-group"><label><strong>First Name:</strong></label><input class="form-control" type="text" readonly="" value="<%=user.getfName() %>"></div>
                                <div class="form-group"><label><strong>Last Name:&nbsp;</strong></label><input class="form-control" type="text" readonly="" value="<%=user.getlName() %>"></div>
                            </div>
                            <div class="col offset-md-0"></div>
                            <div class="col">
                                <div class="form-group"><label><strong>Category</strong>:&nbsp;</label><select class="form-control" name="categ"><%ticket.getList(out, "Category", ""); %></select></div>
                                <div
                                    class="form-group"><label><strong>Impact</strong>:</label><select class="form-control" name="impact"><%ticket.getList(out, "Impact", ""); %></select></div>
                        </div>
                </div>
                <div class="form-row">
                    <div class="col"><label><strong>Description:&nbsp;</strong></label><textarea class="form-control" name="description"></textarea></div>
                    <div class="col">
                    <%
                    	if(user.isSupport()) 
                    	{
                    	%>
                        	<div class="form-group"><label><strong>Solution:&nbsp;</strong></label><textarea class="form-control" name="summary"></textarea></div>
                    	<%
                    	}
                    	else {
                    	%>
                    		<div class="form-group"><label><strong>Solution:&nbsp;</strong></label><textarea class="form-control" name="summary" readonly=""></textarea></div>
                    	<%
                    	}
                    %>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col">
                        <div class="table-responsive border rounded">
                        </div>
                    </div>
                    <div class="col-2 text-right align-self-center">
                        <div class="clearfix"></div><button class="btn btn-success btn-block btn-lg" type="submit" name="submit">Save</button></div>
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