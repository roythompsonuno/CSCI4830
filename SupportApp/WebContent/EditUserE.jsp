<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
<%@ page import="Manager.*" %>

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
    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                    <div class="col">
                        <div class="clearfix"></div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="btn-toolbar">
                                <div class="btn-group" role="group"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-body bg-light border rounded">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col">
                                            <h2 class="text-left text-primary">Edit User</h2>
                                        </div>
                                        <div class="col">
                                            <h2 class="text-primary">User ID: <%=user.getUserID() %></h2>
                                        </div>
                                    </div>
                                    <form>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label><strong>First Name:</strong></label><input class="form-control" type="text" name="fName" required="" value="<%=user.getfName()%>"></div>
                                                <div class="form-group"><label><strong>Phone Number:</strong></label><input class="form-control" type="text" name="phone" required="" value="<%=user.getPhone() %>"></div>
                                                <div class="form-group"><label><strong>Password</strong>:</label><input class="form-control" type="password" name="pass"></div><button class="btn btn-success btn-block" type="submit" name="submit" value="0">Save User</button></div>
                                            <div class="col">
                                                <div class="form-group"><label><strong>Last Name:</strong></label><input class="form-control" type="text" name="lName" value="<%=user.getlName() %>"></div>
                                                <div class="form-group"><label><strong>Email Address:</strong></label><input class="form-control" type="text" name="email" value="<%=user.getEmail() %>"></div>
                                                <div class="form-group"><label><strong>Role:</strong></label><select class="form-control" name="role"><%user.getList(out, "Role", user.getRoleID()); %></select></div>
                                                <div
                                                    class="form-group"><button class="btn btn-warning btn-block" name="removeUser" type="submit" value="0">Remove User</button></div>
                                        </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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