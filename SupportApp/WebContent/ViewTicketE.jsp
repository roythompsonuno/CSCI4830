<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="Nav2.jsp" %>
<%@ page import="Manager.*" %>
<%
	User user = (User) session.getAttribute("user");
%>

    <div id="wrapper">
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-4"><a class="btn btn-primary btn-block btn-lg" role="button" style="height: 60px;" href="SubmitTicketE.jsp">Create Ticket</a></div>
                    <div class="col-4 offset-0"><input class="form-control-lg" type="search" name="Search Tickets" placeholder="Search" style="width: 300px;height: 60px;"></div>
                    <div class="col"></div>
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
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-body"><label style="font-size: 18px;">My Tickets</label>
                                <ul class="list-group"></ul>
                                <div class="table-responsive table-bordered">
                                    <table class="table table-striped table-bordered table-sm">
                                        <thead class="text-monospace">
                                            <tr class="border rounded">
                                                <th style="width: 100px;font-family: 'Roboto Slab', serif;">Ticket #</th>
                                                <th style="width: em;font-family: 'Roboto Slab', serif;">Impact</th>
                                                <th style="font-family: 'Roboto Slab', serif;" colspan="1">Summary</th>
                                                <th style="font-family: 'Roboto Slab', serif;">Status</th>
                                                <%
                                                	if( user.isSupport())
                                                	{
                                                		%><th style="font-family: 'Roboto Slab', serif;">Edit</th><%
                                                	}
                                                %>	
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%user.getMyTicket( out, "User_ID" ); %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <%
                            	if( user.isSupport())
                            	{
                            		%>
                           <div class="card-body"><label style="font-size: 18px;">Assigned Tickets</label>
                                <div class="table-responsive table-bordered">
                                    <table class="table table-striped table-bordered table-sm">
                                        <thead class="text-monospace">
                                            <tr class="border rounded">
                                                <th style="width: 100px;font-family: 'Roboto Slab', serif;">Ticket #</th>
                                                <th style="width: em;font-family: 'Roboto Slab', serif;">Impact</th>
                                                <th style="font-family: 'Roboto Slab', serif;" colspan="1">Summary</th>
                                                <th style="font-family: 'Roboto Slab', serif;">Status</th>
                                                <th style="font-family: 'Roboto Slab', serif;">Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%user.getMyTicket( out, "Assignee" ); %>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="list-group"></ul>
                            </div>
                            <div class="card-body"><label style="font-size: 18px;">Unassigned Tickets</label>
                                <div class="table-responsive table-bordered">
                                    <table class="table table-striped table-bordered table-sm">
                                        <thead class="text-monospace">
                                            <tr class="border rounded">
                                                <th style="width: 100px;font-family: 'Roboto Slab', serif;">Ticket #</th>
                                                <th style="width: em;font-family: 'Roboto Slab', serif;">Impact</th>
                                                <th style="font-family: 'Roboto Slab', serif;" colspan="1">Summary</th>
                                                <th style="font-family: 'Roboto Slab', serif;">Status</th>
                                                <th style="font-family: 'Roboto Slab', serif;">Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%user.getNoTicket( out, "Assignee" ); %>
                                        </tbody>
                                    </table>
                                </div>
                                <% 
                                	} 
                       			%>
                                <ul class="list-group"></ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12" style="height: 396px;">
                        <div class="row">
                            <div class="col">
                                <h2 class="text-center text-primary">Support Metrics</h2>
                            </div>
                        </div>
                        <div style="height: 343px;"><canvas data-bs-chart="{&quot;type&quot;:&quot;line&quot;,&quot;data&quot;:{&quot;labels&quot;:[&quot;January&quot;,&quot;February&quot;,&quot;March&quot;,&quot;April&quot;,&quot;May&quot;,&quot;June&quot;],&quot;datasets&quot;:[{&quot;label&quot;:&quot;Revenue&quot;,&quot;backgroundColor&quot;:&quot;rgba(223,139,78,0.18)&quot;,&quot;borderColor&quot;:&quot;#df684e&quot;,&quot;data&quot;:[&quot;4500&quot;,&quot;5300&quot;,&quot;6250&quot;,&quot;7800&quot;,&quot;9800&quot;,&quot;15000&quot;],&quot;fill&quot;:true,&quot;borderWidth&quot;:&quot;3&quot;}]},&quot;options&quot;:{&quot;maintainAspectRatio&quot;:false,&quot;legend&quot;:{&quot;display&quot;:true,&quot;reverse&quot;:false},&quot;title&quot;:{&quot;display&quot;:false},&quot;scales&quot;:{&quot;xAxes&quot;:[{&quot;gridLines&quot;:{&quot;drawBorder&quot;:true,&quot;drawOnChartArea&quot;:true},&quot;ticks&quot;:{&quot;beginAtZero&quot;:false}}],&quot;yAxes&quot;:[{&quot;gridLines&quot;:{&quot;drawBorder&quot;:true},&quot;ticks&quot;:{&quot;beginAtZero&quot;:false}}]}}}"></canvas></div>
                    </div>
                    <div class="col-lg-6" style="height: 290px;">
                        <div><canvas data-bs-chart="{&quot;type&quot;:&quot;doughnut&quot;,&quot;data&quot;:{&quot;labels&quot;:[&quot;January&quot;,&quot;February&quot;,&quot;March&quot;,&quot;April&quot;,&quot;May&quot;,&quot;June&quot;],&quot;datasets&quot;:[{&quot;label&quot;:&quot;Per Department&quot;,&quot;backgroundColor&quot;:[&quot;#00b5d6&quot;,&quot;#f97242&quot;,&quot;#54d8a8&quot;,&quot;#9bafc4&quot;,&quot;#1e7a6d&quot;,&quot;#f95602&quot;],&quot;borderColor&quot;:[&quot;rgba(78,115,223,0.91)&quot;,&quot;rgba(78,115,223,0.91)&quot;,&quot;rgba(78,115,223,0.91)&quot;,&quot;rgba(78,115,223,0.91)&quot;,&quot;rgba(78,115,223,0.91)&quot;,&quot;rgba(78,115,223,0.91)&quot;],&quot;data&quot;:[&quot;4500&quot;,&quot;5300&quot;,&quot;6250&quot;,&quot;7800&quot;,&quot;9800&quot;,&quot;15000&quot;]}]},&quot;options&quot;:{&quot;maintainAspectRatio&quot;:true,&quot;legend&quot;:{&quot;display&quot;:true},&quot;title&quot;:{}}}"></canvas></div>
                    </div>
                    <div class="col-lg-6">
                        <div><canvas data-bs-chart="{&quot;type&quot;:&quot;bar&quot;,&quot;data&quot;:{&quot;labels&quot;:[&quot;January&quot;,&quot;February&quot;,&quot;March&quot;,&quot;April&quot;,&quot;May&quot;,&quot;June&quot;],&quot;datasets&quot;:[{&quot;label&quot;:&quot;Revenue&quot;,&quot;backgroundColor&quot;:&quot;#4e73df&quot;,&quot;borderColor&quot;:&quot;#4e73df&quot;,&quot;data&quot;:[&quot;4500&quot;,&quot;5300&quot;,&quot;6250&quot;,&quot;7800&quot;,&quot;9800&quot;,&quot;15000&quot;]}]},&quot;options&quot;:{&quot;maintainAspectRatio&quot;:true,&quot;legend&quot;:{&quot;display&quot;:true},&quot;title&quot;:{}}}"></canvas></div>
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
    
    			</div>
        	</div>
    	</div>
	</body>
</html>