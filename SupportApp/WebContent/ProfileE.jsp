<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
<%@ page import="Manager.User" %>
<%
	User user = (User) session.getAttribute("user");
	String message = "", newPass = null;
	
	if(request.getParameter("submit") != null)
	{
		newPass = request.getParameter("changePass");
		if(newPass.equals(""))
		{
			message = "Password did not change. Enter new Password.";
		}
		else if(newPass.equals(user.getPassword()))
		{
			message = "Password did not change. Current password is the same as new password.";
		}
		else
		{
			user.updatePassword(newPass);
			session.setAttribute("user", user);
		}
	}
%>

<body id="page-top">
    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Profile</h3>
                    <div class="row mb-3">
                        <div class="col-lg-4">
                            <div class="card bg-primary mb-3">
                                <div class="card-body text-center shadow"><img class="rounded-circle mb-3 mt-4" src="assets/img/dogs/image2.jpeg" width="160" height="160"></div>
                            </div>
                            <form action="ProfileE.jsp" method="post">
                                <div class="form-group"><label><strong>Password</strong></label><input class="form-control" type=Password name=changePass></div>
                                <div class="form-group"><button class="btn btn-success btn-block" name="submit" type="submit" value="changePass">Change Password</button></div>
                                <h4><%=message %></h4>
                            </form>
                        </div>
                        <div class="col-lg-8">
                            <div class="row mb-3 d-none">
                                <div class="col">
                                    <div class="card text-white bg-primary shadow">
                                        <div class="card-body">
                                            <div class="row mb-2">
                                                <div class="col">
                                                    <p class="m-0">Peformance</p>
                                                    <p class="m-0"><strong>65.2%</strong></p>
                                                </div>
                                                <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                            </div>
                                            <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="card text-white bg-success shadow">
                                        <div class="card-body">
                                            <div class="row mb-2">
                                                <div class="col">
                                                    <p class="m-0">Peformance</p>
                                                    <p class="m-0"><strong>65.2%</strong></p>
                                                </div>
                                                <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                            </div>
                                            <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="card shadow mb-3">
                                        <div class="card-header py-3">
                                            <p class="text-primary m-0 font-weight-bold">User Information</p>
                                        </div>
                                        <div class="card-body">
                                            <form>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group"><label for="userid"><strong>Username</strong></label><input class="form-control" type="text" placeholder= <%=user.getUserID() %> name="userid" readonly=""></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group"><label for="email"><strong>Email Address</strong></label><input class="form-control" type="email" placeholder= <%=user.getEmail() %> name="email" readonly=""></div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group"><label for="fname"><strong>First Name</strong></label><input class="form-control" type="text" placeholder= <%=user.getfName() %> name="fname" readonly=""></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group"><label for="lname"><strong>Last Name</strong></label><input class="form-control" type="text" placeholder= <%=user.getlName() %> name="fname" readonly=""></div>
                                                    </div>
                                                </div>
                                                <div class="form-row">
                                                    <div class="col">
                                                        <div class="form-group"><label for="phone"><strong>Phone</strong></label><input class="form-control" type="text" name="phone" readonly="" inputmode="tel" placeholder= <%=user.getPhone() %>></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group"><label for="group"><strong>Group</strong></label><input class="form-control" type="text" placeholder= <%=user.getgName() %> name="group" readonly=""></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="form-group"><label for="role"><strong>Role</strong></label><input class="form-control" type="text" placeholder= <%=user.getrName() %> name="role" readonly=""></div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="card shadow"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow mb-5"></div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright ©G8 Development 2019</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
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