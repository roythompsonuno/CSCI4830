<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
<%@ page import="Manager.*" %>

<!DOCTYPE html>
<html>

<body id="page-top">
    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                    <h2 class="text-center text-primary mb-4">FAQ</h2>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Resolved Tickets</p>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-row">
                                    <div class="col">
                                        <div class="form-group"><label><strong>Search:</strong></label><input class="form-control" type="text"></div>
                                    </div>
                                    <div class="col"><label>&nbsp;&nbsp;</label>
                                        <div class="form-group"><button class="btn btn-info" type="button">Search</button></div>
                                    </div>
                                </div>
                            </form>
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table table-striped dataTable my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Ticket #</th>
                                            <th>Summary</th>
                                            <th>Solution</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>0000000</td>
                                            <td>Summary example of all the many things that the table can do for displaying summary of ticket.</td>
                                            <td>This is a test to see how the text will look if the solution spans multiple lines.</td>
                                        </tr>
                                    </tbody>
                                </table>
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
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>