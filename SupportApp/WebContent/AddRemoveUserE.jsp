<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
<%@ page import="Manager.User" %>

<%
	User user = new User();
	String message = "";
	if(request.getParameter("addUser") != null)
	{
		if(request.getParameter("fName").equals(""))
		{
			message = "First Name is required.";
		}
		else if(request.getParameter("lName").equals(""))
		{
			message = "Last Name is required.";
		}
		else if(request.getParameter("phone").equals(""))
		{
			message = "Phone Number is required.";
		}
		else if(request.getParameter("email").equals(""))
		{
			message = "Email Address is required.";
		}
		else if(request.getParameter("pass").equals(""))
		{
			message = "Password is required.";
		}
		else
		{
			user.setfName(request.getParameter("fName"));
			user.setlName(request.getParameter("lName"));
			user.setEmail(request.getParameter("email"));
			user.setPhone(request.getParameter("phone"));
			user.setPassword(request.getParameter("pass"));
			user.setRoleID(Integer.parseInt(request.getParameter("role")));
			user.addNewUser();
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
                                <div class="card-body">
                                    <h2 class="text-center text-primary bg-white card-title">All Users</h2>
                                    <ul class="list-group"></ul>
                                    <div class="table-responsive table-bordered">
                                        <table class="table table-striped table-bordered table-sm">
                                            <thead class="text-monospace">
                                                <tr class="border rounded">
                                                    <th class="text-center" style="width: 100px;font-family: 'Roboto Slab', serif;">User ID</th>
                                                    <th class="text-center" style="width: em;font-family: 'Roboto Slab', serif;">Name</th>
                                                    <th class="text-center" style="font-family: 'Roboto Slab', serif;" colspan="1">Role</th>
                                                    <th class="text-center" style="font-family: 'Roboto Slab', serif;">Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<% user.getUserList(out); %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-body bg-light border rounded">
                                    <h2 class="text-center text-primary card-title">Add New User</h2>
                                    <form action="AddRemoveUserE.jsp" method="post">
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label><strong>First Name:</strong></label><input class="form-control" type="text" name="fName" inputmode="latin-name" required=""></div>
                                                <div class="form-group"><label><strong>Phone Number:</strong></label><input class="form-control" type="tel" name="phone" required="" inputmode="tel"></div>
                                                <div class="form-group"><label><strong>Password</strong>:</label><input class="form-control" type="password" name= "pass"></div><button class="btn btn-success btn-block" name="addUser" type="submit">Add User</button></div>
                                            <div class="col">
                                                <div class="form-group"><label><strong>Last Name:</strong></label><input class="form-control" type="text" name="lName"></div>
                                                <div class="form-group"><label><strong>Email Address:</strong></label><input class="form-control" type="email" name="email"></div>
                                                <div class="form-group"><label><strong>Role:</strong></label><select class="form-control" name="role"><%user.getList(out, "Role", 0); %></select></div>
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