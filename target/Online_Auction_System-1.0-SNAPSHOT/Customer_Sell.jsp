<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
  if(session.getAttribute("id")==null){
    response.sendRedirect("CustomerLogin.jsp");
    }
    String uid=(String)session.getAttribute("id");
  
    String uname=(String)session.getAttribute("uname");

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Status Page</title>
           <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
body {
    color: #566787;
    background: #f5f5f5;
    font-family: 'Roboto', sans-serif;
}
.table-responsive {
    margin: 30px 0;
}
.table-wrapper {
    min-width: 1000px;
    background: #fff;
    padding: 20px;
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
    min-width: 100%;
}
.table-title h2 {
    margin: 8px 0 0;
    font-size: 22px;
}
.search-box {
    position: relative;        
    float: right;
}
.search-box input {
    height: 34px;
    border-radius: 20px;
    padding-left: 35px;
    border-color: #ddd;
    box-shadow: none;
}
.search-box input:focus {
    border-color: #3FBAE4;
}
.search-box i {
    color: #a0a5b1;
    position: absolute;
    font-size: 19px;
    top: 8px;
    left: 10px;
}
table.table tr th, table.table tr td {
    border-color: #e9e9e9;
}
table.table-striped tbody tr:nth-of-type(odd) {
    background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
    background: #f5f5f5;
}
table.table th i {
    font-size: 13px;
    margin: 0 5px;
    cursor: pointer;
}
table.table td:last-child {
    width: 130px;
}
table.table td a {
    color: #a0a5b1;
    display: inline-block;
    margin: 0 5px;
}
table.table td a.view {
    color: #03A9F4;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}    
.pagination {
    float: right;
    margin: 0 0 5px;
}
.pagination li a {
    border: none;
    font-size: 95%;
    width: 30px;
    height: 30px;
    color: #999;
    margin: 0 2px;
    line-height: 30px;
    border-radius: 30px !important;
    text-align: center;
    padding: 0;
}
.pagination li a:hover {
    color: #666;
}	
.pagination li.active a {
    background: #03A9F4;
}
.pagination li.active a:hover {        
    background: #0397d6;
}
.pagination li.disabled i {
    color: #ccc;
}
.pagination li i {
    font-size: 16px;
    padding-top: 6px
}
.hint-text {
    float: left;
    margin-top: 6px;
    font-size: 95%;
}    
</style>
    </head>
  <body>

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
        <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">auction@System.com</a></i>
        <i class="bi bi-phone d-flex align-items-center ms-4"><span>9876543210</span></i>
      </div>
     
    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="Page.html">Auction Management System</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
       <a href="index.html" class="logo"><img src="assets/img/logo/logo.jpeg" alt=""></a>

      <nav id="navbar" class="navbar">
        <ul>
            <li><a class="nav-link scrollto " href="CustomerDashboard.jsp">Home</a></li>
          
          <li><a class="nav-link scrollto" href="CustomerProducts.jsp">Products</a></li>
          <li><a class="nav-link scrollto active" href="Customer_Sell.jsp">Status</a></li>
          
          <li><span class="badge badge-primary"><%=uname%></span></li>
          <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          More
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item pl-4" href="CustomerProfile.jsp">Profile</a>
            <a class="dropdown-item pl-4"" href="customer_logout">Logout</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item pl-4"" href="#">Settings</a>
        </div>
      </li>
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
      </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->

  <main id="main">
    
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2>Bidding <b>Details</b></h2></div>
                    <div class="col-sm-4">
                        <div class="search-box">
                            <i class="material-icons">&#xE8B6;</i>
                            <input type="text" class="form-control" placeholder="Search&hellip;">
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                         <th>Product Image</th>
                        <th>Product</th>
                        <th>Other Info<i class="fa fa-sort"></i></th>
                        <th>Highest Bid Amount <i class="fa fa-sort"></i></th>
                        <th>Bid Status</th>
                      
                        <th>Actions</th>
                    </tr>
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
            rs=st.executeQuery("select * from bids where user_id='"+uid+"'");
            while(rs.next()){
            srno+=1;
            int pid=Integer.parseInt(rs.getString(3));
            String highBid=(String)rs.getString(10);
            String bStatus=(String)rs.getString(5);
            String yamount=(String)rs.getString(4);
            String pname=null,desc=null,sbid=null,rprice=null,benddate=null,bstartdate=null,cname=null,imgname=null;
             rs1=st1.executeQuery("select * from products where id="+pid);
             while(rs1.next()){
             pname=(String)rs1.getString(2);
            desc=(String)rs1.getString(3);
             sbid=(String)rs1.getString(4);
             rprice=(String)rs1.getString(5);
             benddate=(String)rs1.getString(6);
             bstartdate=(String)rs1.getString(10);
             cname=(String)rs1.getString(11);
             imgname=(String)rs1.getString(7);
              }
            %>
                <tr>
                        <td><%=srno%></td>
                        <td>    <div class="text-center">
                             <img src="assets/img/Products/<%=imgname%>" class="rounded img-thumbnail" width="200" height="200" alt="...">
                        </div></td>
                        <td><span>Name:  <%=pname%> </span><br>
                            <span>Description: <%=desc%> </span></td>
                        <td> <span>Regular Price:<%=rprice%>&nbsp;&#8377; </span><br>
                            <span>Start Price: <%=sbid%>&nbsp;&#8377; </span><br>
                             <span>Start Date/Time:<%=bstartdate%> </span><br>
                            <span>End Date/Time: <%=benddate%> </span><br>
                            <span>Category: <%=cname%> </span>
                             </td>
                        <td><span>Highest Bid:<%=highBid%>&nbsp;&#8377;</span><br>
                            <span>Your Bid Amount:<%=yamount%>&nbsp;&#8377;</span>
                        </td>
                        <td> <%if(bStatus.equals("Winner of bidding")){%>
                            <span class="badge badge-success" style="font-size:13px; font-weight:400;">Winner of bidding</span>
                            <%}else if(bStatus.equals("Bid loss!")){%>
                            <span class="badge badge-danger"  style="font-size:13px; font-weight:400;">Bid loss!</span>
                            <%}else{%>
                            <span class="badge badge-warning "  style="font-size:13px; font-weight:400;">Bidding Stage</span>
                            <%}%></td>
                        <td>
                            <a href="#" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                            <a href="#" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                            <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
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
            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
                </ul>
            </div>
        </div>
    </div>  
</div> 

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

   

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>Nikita</h3>
            <p>
              <strong>Phone:</strong> 9876543210<br>
              <strong>Email:</strong> auction@gmail.com<br>
            </p>
          </div>
          </div>

        </div>
      </div>
    </div>

    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>nikita</span></strong> All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bizland-bootstrap-business-template/ -->
        Designed by <a href="AdminPanel/AdminIndexPage.jsp">Nikita</a>
        
        <form action="admin_register" method="post">
            <input type="text" value="10" name="Uname">
            <button type="submit">Save</button>
        </form>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
  </body>
</html>
