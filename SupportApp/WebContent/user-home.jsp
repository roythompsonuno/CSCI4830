<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>

<body id="page-top" style="font-family: 'Roboto Slab', serif;">
    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand text-white bg-dark shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <h1 class="text-white"><strong>Support Portal</strong></h1>
                        <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <div class="input-group-append"></div>
                            </div>
                        </form>
                        <ul class="nav navbar-nav text-white flex-nowrap ml-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" role="menu" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item text-white dropdown no-arrow" role="presentation">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle text-white nav-link" data-toggle="dropdown" aria-expanded="false" href="#"><span class="text-white d-none d-lg-inline mr-2 text-gray-600 small"></span><strong>Sign Out&nbsp;</strong><img class="border rounded-circle img-profile" src="assets/img/avatars/avatar5.jpeg"></a>
                                    <div
                                        class="dropdown-menu shadow dropdown-menu-right animated--grow-in" role="menu"><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Settings</a>
                                        <a
                                            class="dropdown-item" role="presentation" href="#"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Activity log</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" role="presentation" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a></div>
                    </div>
                    </li>
                    </ul>
            </div>
            </nav>
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-5">
                        <h2 class="text-left justify-content-lg-center align-items-lg-start" style="font-family: 'Roboto Slab', serif;">My Requests</h2>
                    </div>
                </div>
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
                <div class="row flex-grow-1 flex-shrink-1">
                    <div class="col-10">
                        <div class="card flex-grow-1 flex-shrink-1">
                            <div class="card-body flex-grow-1 flex-shrink-1" style="width: 750px;">
                                <ul class="list-group"></ul>
                                <div class="table-responsive table-bordered flex-grow-1 flex-shrink-1">
                                    <table class="table table-striped table-bordered table-sm">
                                        <thead class="text-monospace">
                                            <tr class="border rounded">
                                                <th style="width: 100px;font-family: 'Roboto Slab', serif;">Ticket #</th>
                                                <th style="font-family: 'Roboto Slab', serif;">Notes</th>
                                                <th style="font-family: 'Roboto Slab', serif;">Open</th>
                                            </tr>
                                        </thead>
                                        <tbody class="flex-grow-1 flex-shrink-1">
                                            <tr>
                                                <td>0000000</td>
                                                <td>The notes about this ticket could include a simple summary.</td>
                                                <td class="text-center"><a class="btn btn-primary text-center btn-circle ml-1" role="button"><i class="fas fa-info-circle text-white"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>0000001</td>
                                                <td>I have multiple problems.</td>
                                                <td class="text-center"><a class="btn btn-primary btn-circle ml-1" role="button"><i class="fas fa-info-circle text-white"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>0000002</td>
                                                <td></td>
                                                <td class="text-center"><a class="btn btn-primary btn-circle ml-1" role="button"><i class="fas fa-info-circle text-white"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>0000003</td>
                                                <td></td>
                                                <td class="text-center"><a class="btn btn-primary btn-circle ml-1" role="button"><i class="fas fa-info-circle text-white"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>0000004</td>
                                                <td></td>
                                                <td class="text-center"><a class="btn btn-primary btn-circle ml-1" role="button"><i class="fas fa-info-circle text-white"></i></a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-2 text-center"><a class="btn btn-success btn-block d-lg-flex" role="button" style="height: 60px;" href="user-ticket.html">Submit &nbsp;Ticket</a>
                        <div class="row"></div>
                        <div class="card shadow border-left-warning py-2">
                            <div class="card-body">
                                <div class="row align-items-center no-gutters">
                                    <div class="col mr-2">
                                        <div class="text-uppercase text-warning font-weight-bold text-xs mb-1"><span style="font-family: 'Roboto Slab', serif;">Pending Requests</span></div>
                                        <div class="text-dark font-weight-bold h5 mb-0"><span>18</span></div>
                                    </div>
                                    <div class="col-auto offset-3"><i class="fas fa-comments fa-2x text-gray-300"></i></div>
                                </div>
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
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>