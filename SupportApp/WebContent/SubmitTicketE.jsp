<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
<%@ page import="Manager.*" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto+Slab">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Dark.css">
</head>

<body id="page-top" style="font-family: 'Roboto Slab', serif;">
    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
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
                                        <td>Cell 1</td>
                                        <td>Cell 2</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="container-fluid" style="padding-left: 0px;">
                    <form>
                        <div class="form-row">
                            <div class="col">
                                <div class="form-group"><label><strong>First Name:</strong></label><input class="form-control" type="text" readonly=""></div>
                                <div class="form-group"><label><strong>Last Name:&nbsp;</strong></label><input class="form-control" type="text" readonly=""></div>
                            </div>
                            <div class="col offset-md-0"></div>
                            <div class="col">
                                <div class="form-group"><label><strong>Category</strong>:&nbsp;</label><select class="form-control" name="Category"><optgroup label="Category"><option value="12" selected="">Software Issue</option><option value="13">Hardware Issue</option><option value="14">Profile Issue</option></optgroup></select></div>
                                <div
                                    class="form-group"><label><strong>Impact</strong>:</label><select class="form-control"><optgroup label="Status"><option value="12" selected="">Low</option><option value="13">Medium</option><option value="14">High</option></optgroup></select></div>
                        </div>
                </div>
                <div class="form-row">
                    <div class="col"><label><strong>Description:&nbsp;</strong></label><textarea class="form-control"></textarea></div>
                    <div class="col">
                        <div class="form-group"><label><strong>Solution:&nbsp;</strong></label><textarea class="form-control"></textarea></div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col">
                        <div class="table-responsive border rounded">
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th>Log:</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Cell 1</td>
                                    </tr>
                                    <tr>
                                        <td>Cell 3</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-2 text-right align-self-center">
                        <div class="clearfix"></div><button class="btn btn-success btn-block btn-lg" type="button">Save</button></div>
                    <div class="col-2 align-self-center">
                        <div class="clearfix"></div><button class="btn btn-danger btn-block btn-lg" type="button">Cancel</button></div>
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
</body>

</html>