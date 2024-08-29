<%
    if(session.getAttribute("id")==null){
    response.sendRedirect("AdminLogin.jsp");
    }
    String uname=(String)session.getAttribute("uname");

%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Products
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
    name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
    integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="assets/demo/demo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="blue">
     <div class="logo">
        <a href="http://www.creative-tim.com" class="simple-text logo-mini">
          OL
        </a>
        <a href="http://www.creative-tim.com" class="simple-text logo-normal">
          Auction System
        </a>
      </div>
      <div class="sidebar-wrapper" id="sidebar-wrapper">
      <ul class="nav">
          <li >
              <a href="dashboard.jsp">
              <i class="now-ui-icons design_app"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li>
              <a href="Categories.jsp">
              <i class="now-ui-icons education_atom"></i>
              <p>Categories</p>
            </a>
          </li>
           <li class="active">
               <a href="Products.jsp">
              <i class="now-ui-icons design_bullet-list-67"></i>
              <p>Products</p>
            </a>
          </li>
           <li>
               <a href="Bids.jsp">
              <i class="now-ui-icons design_bullet-list-67"></i>
              <p>Bids</p>
            </a>
          </li>
          <li>
              <a href="Users.jsp">
              <i class="now-ui-icons design_bullet-list-67"></i>
              <p>Users</p>
            </a>
          </li>
        
       
        </ul>
      </div>
    </div>
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="#pablo">Product List</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
            aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="now-ui-icons ui-1_zoom-bold"></i>
                  </div>
                </div>
              </div>
            </form>
        <ul class="navbar-nav">
              <li class="nav-item mt-2 ml-2 mr-2">
                
                  <span><%=uname%></span>
                
             
              </li>
            
              <li class="nav-item">
                <a class="nav-link" dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
                  aria-haspopup="true" aria-expanded="false">
                  <i class="now-ui-icons users_single-02"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Account</span>
                  </p>
                </a>
                   <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                       <a class="dropdown-item" href="AdminProfile.jsp">Profile</a>
                  <a class="dropdown-item" href="admin_logout">Logout</a>
                  <a class="dropdown-item" href="#">System Settings</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header d-flex">
                <h4 class="card-title">Product List</h4>
                <a href="AddProduct.jsp"><button type="button" class="btn btn-primary" style="margin-left:600px;" data-toggle="modal" data-target="#exampleModalCenter">
                Add Product
                </button>
                    </a>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                      <th>
                        ID
                      </th>
                      <th>
                        Product Image
                      </th>
                      <th>
                        Category
                      </th>
                      <th>
                        Product
                      </th>
                       <th>
                        Other Info
                      </th>
                      <th class="text-right">
                        Actions
                      </th>
                    </thead>
                    <tbody>
                                                  <%
                 Connection con;
                 Statement st=null,st1=null;
                 ResultSet rs=null,rs1=null;
                 int srno=0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
            st=con.createStatement();
             st1=con.createStatement();
            rs=st.executeQuery("select * from products");
            while(rs.next()){
            srno+=1;
            int pid=Integer.parseInt(rs.getString(1));
            String highBid="Not Available..";
             rs1=st1.executeQuery("select * from bids where product_id="+pid);
             while(rs1.next()){
             highBid=(String)rs1.getString(10);
              }
            %>
                        <tr>
                            <td>
                               <%=rs.getString(1)%> 
                            </td>
                        <td>
                         <div class="text-center">
                             <img src="assets/img/Products/<%=rs.getString(7)%>" class="rounded img-thumbnail" width="200" height="200" alt="...">
                        </div>
                        </td>
                        <td>
                         <%=rs.getString(11)%>
                        </td>
                        <td>
                            <span>Name:  <%=rs.getString(2)%> </span><br>
                            <span>Description: <%=rs.getString(3)%> </span>
                        </td>
                         <td>
                             <span>Regular Price:<%=rs.getString(5)%> </span><br>
                            <span>Start Price: <%=rs.getString(4)%> </span><br>
                             <span>Start Date/Time:<%=rs.getString(10)%> </span><br>
                            <span>End Date/Time: <%=rs.getString(6)%> </span><br>
                             <span>Highest Bid:<%=highBid%> </span><br>
                            <span>Total Bids: <%=highBid%> </span>
                        </td>
                        <td class="text-right d-flex">
                            <form action="EditProduct.jsp" method="post">
                                <input type="hidden" name="id" value="<%=rs.getString(1)%>">
                                <input type="hidden" name="name" value="<%=rs.getString(2)%>">
                                <input type="hidden" name="desc" value="<%=rs.getString(3)%>">
                                <input type="hidden" name="sbid" value="<%=rs.getString(4)%>">
                                <input type="hidden" name="rprice" value="<%=rs.getString(5)%>">
                                <input type="hidden" name="benddate" value="<%=rs.getString(6)%>">
                                <input type="hidden" name="imgname" value="<%=rs.getString(7)%>">
                                <input type="hidden" name="category" value="<%=rs.getString(11)%>">
                                <input type="hidden" name="path" value="<%=rs.getString(9)%>">
                                <input type="hidden" name="bstartdate" value="<%=rs.getString(10)%>">
                                       
                                <button  type="submit" data-toggle="modal"  style="margin-top: 50px;" data-target="#exampleModalCenter1" class="edit btn-outline-light" ><i class="material-icons text-warning" data-toggle="tooltip" title="Edit">&#xE254;</i></button>  
                            </form>
                               
                                <button href="#deleteEmployeeModal"  onclick="myFunction('<%=rs.getString(1)%>')" style="margin-top: 50px;" class="delete btn-outline-light" data-toggle="modal"><i class="material-icons text-danger" data-toggle="tooltip" title="Delete">&#xE872;</i></button>

                        </td>
                      </tr>
                      
              
                        
                        <%
                            }
            
            
        }catch(Exception e){
            System.out.println(e);
        }
                        
                        %>
         
                  
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      <footer class="footer">
        <div class=" container-fluid ">
          <nav>
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="http://presentation.creative-tim.com">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Blog
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright" id="copyright">
            &copy;
            <script>
              document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
            </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by : Nikita <a
              href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
          </div>
        </div>
      </footer>
    </div>
  </div>
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
            <form action="delete_product" method="post">
                <input type="hidden" name="id" id="id">
				<div class="modal-header">						
					<h4 class="modal-title">Delete Category</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>
  <!--   Core JS Files   -->
  <script src="assets/js/core/jquery.min.js"></script>
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"></script>
  <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="assets/demo/demo.js"></script>
  <script>
      
      function myFunction(name) {
  document.getElementById("id").value= name;
}
  </script>
</body>

</html>