<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
<%@ page import="Manager.User" %>

<!DOCTYPE html>
<html>


<body id="page-top" style="font-family: 'Roboto Slab', serif;">
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
                                                <tr>
                                                    <td class="text-center">1</td>
                                                    <td class="text-center">Yumul, Bryson</td>
                                                    <td class="text-center">End User</td>
                                                    <td class="text-center"><button class="btn btn-warning" type="button">Edit</button></td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">2</td>
                                                    <td class="text-center">Thompson, Roy</td>
                                                    <td class="text-center">Admin</td>
                                                    <td class="text-center"><button class="btn btn-warning" type="button">Edit</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="card-body bg-light border rounded">
                                    <h2 class="text-center text-primary card-title">Add New User</h2>
                                    <form>
                                        <div class="form-row">
                                            <div class="col">
                                                <div class="form-group"><label><strong>First Name:</strong></label><input class="form-control" type="text" name="fname" inputmode="latin-name" required=""></div>
                                                <div class="form-group"><label><strong>Phone Number:</strong></label><input class="form-control" type="tel" name="phone" required="" inputmode="tel"></div>
                                                <div class="form-group"><label><strong>Password</strong>:</label><input class="form-control" type="password"></div><button class="btn btn-success btn-block" type="submit">Add User</button></div>
                                            <div class="col">
                                                <div class="form-group"><label><strong>Last Name:</strong></label><input class="form-control" type="text" name="lname"></div>
                                                <div class="form-group"><label><strong>Email Address:</strong></label><input class="form-control" type="email"></div>
                                                <div class="form-group"><label><strong>Role:</strong></label><select class="form-control" name="role"><optgroup label="Role"><option value="12" selected="">End User</option><option value="13">Hardware Support</option><option value="14">Software Support</option><option value="15">Administrator</option></optgroup></select></div>
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
</body>

</html>