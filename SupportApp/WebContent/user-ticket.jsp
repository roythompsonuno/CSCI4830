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
            <div class="row">
                <div class="col"></div>
                <div class="col"></div>
            </div>
            <div class="container-fluid">
                <form>
                    <div class="form-row">
                        <div class="col">
                            <div class="form-group"><label>First Name:</label><input class="form-control" type="text"></div>
                            <div class="form-group"><label>Last Name:&nbsp;</label><input class="form-control" type="text"></div>
                        </div>
                        <div class="col-3"></div>
                        <div class="col"><label>Category:&nbsp;</label><select class="form-control"><optgroup label="Category"><option value="12" selected="">Software(Windows)</option><option value="13">Software(Mac)</option><option value="14">Hardware</option></optgroup></select><label>Status:</label>
                            <select
                                class="form-control">
                                <optgroup label="Status">
                                    <option value="12" selected="">Open</option>
                                    <option value="13">Closed</option>
                                </optgroup>
                                </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-8"><label>Description:&nbsp;</label><textarea class="form-control"></textarea></div>
                        <div class="col"></div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <div class="table-responsive">
                                <table class="table table-sm">
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
                            <div class="clearfix"></div><button class="btn btn-success btn-lg" type="button">Save</button>
                            <div class="clearfix"></div>
                        </div>
                        <div class="col-2 align-self-center"><button class="btn btn-danger btn-lg" type="button">Cancel</button></div>
                    </div>
                </form>
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