<%@page import="java.text.ParseException"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimerTask"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Timer"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String category=(String)request.getParameter("category");
String id=null; String uname=null;
 if(session.getAttribute("id")!=null){
    id=(String)session.getAttribute("id");
    }
uname=(String)session.getAttribute("uname");

%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  <link rel="stylesheet" href="assets/css/sidebarStyle.css">
  <link rel="stylesheet" href="assets/scss/sidebarStyle.scss">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <style>
      
body {
  min-height: 100vh;
  background: #fafafa;
}


.social-link {
  width: 30px;
  height: 30px;
  border: 1px solid #ddd;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
  border-radius: 50%;
  transition: all 0.3s;
  font-size: 0.9rem;
}

.social-link:hover,
.social-link:focus {
  background: #ddd;
  text-decoration: none;
  color: #555;
}

.progress {
  height: 10px;
}
#ribbon {
  width: 100px;
  height: 28px;
  font-size: 12px;
  text-align: center;
  color: #fff;
  font-weight: bold;
  box-shadow: 0px 2px 3px rgba(136, 136, 136, 0.25);
  background: #4dbe3b;
  transform: rotate(45deg);
  position: absolute;
  right: -34px;
  top: 6px;
  padding-top: 7px; 
}

 .dropdown1 {
            float: left;
            overflow: hidden;
        }

        .dropdown1 .dropbtn1 {
            font-size: 16px;
            border: none;
            outline: none;
            color: black;
            padding: 14px 16px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
        }
    

        .dropdown-content1 {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content1 a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content1 a:hover {
            background-color: #ddd;
        }

.dropdown1:hover .dropdown-content1 {
  display: block;
}
#salert{
            display: none;
}
#dalert{
          display: none;
}
#message{
        display: none;
}
.clockdiv{
    background:black;
    color:white;
    padding-left:5px;
    padding-right: 5px;
    border-radius:2px;
}
.clockdiv:hover{
       background:#0096FF;
}


  </style>
  <script>
     function createReverseCountdownClock(endDate,id){
         var elementId="countdown"+id;
               var countDownDate = new Date(endDate).getTime();
            var x = setInterval(function () {
                var now = new Date().getTime();
                var distance = countDownDate - now;

                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                document.getElementById(elementId).innerHTML = days + "d " + hours + "h " +
                    minutes + "m " + seconds + "s ";

                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById(elementId).innerHTML = "Countdown Finished!";
                }
            }, 1000);
     }
      
    </script>
    </head>
  <body>
<input  type="hidden" id="status" value="<%= request.getAttribute("status")%>">
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
       <a href="index.jsp" class="logo"><img src="assets/img/logo/logo.jpeg" alt=""></a>

      <nav id="navbar" class="navbar">
        <ul> <%if(uname!=null){%>
            <li><a class="nav-link scrollto " href="CustomerDashboard.jsp">Home</a></li>
            <%}else{%>
              <li><a class="nav-link scrollto " href="index.jsp">Home</a></li>
            <%}%>
          
          
          <li><a class="nav-link scrollto active" href="CustomerProducts.jsp">Products</a></li>
          <li><a class="nav-link scrollto " href="Customer_Sell.jsp">Status</a></li>
          <%if(uname!=null){%>
           <li><span class="badge badge-primary"><%=uname%></span></li>
                <li>
                  <div class="dropdown1">
            <button class="dropbtn1">More
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content1">
                <a href="CustomerProfile.jsp">Profile</a>
                <a href="customer_logout">Logout</a>
                <a href="#">Settings</a>
            </div>
        </div>
          </li>
          <%}else{%>
          
                <li>
                  <div class="dropdown1">
            <button class="dropbtn1">More
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content1">
                <a href="CustomerLogin.jsp">Login</a>
                <a href="CustomerRegister.jsp">Register</a>
                <a href="#">Settings</a>
            </div>
        </div>
          </li>
          <%}%>
          
     
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
      </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
   <div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar">
      <div class="custom-menu">
        <button type="button" id="sidebarCollapse" class="btn btn-primary">
          <i class="fa fa-bars"></i>
          <span class="sr-only">Toggle Menu</span>
        </button>
      </div>
      <h1><a href="index.jsp" class="logo">Category</a></h1>
      <ul class="list-unstyled components mb-5">
           <li>
                                <form action="CustomerProducts.jsp" method="post">
                                    <input type="hidden" name="category" value="All Products">
                                    <a href="#"><button id="subbtn" class="btn btn-primary" type="submit"><span class="fa fa-list-alt mr-3"></span>All Products</button></a> 
                                </form>
          
                             </li>
                                        <%
                 Connection con;
                 Statement st=null;
                 ResultSet rs=null;
                 int srno=0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
            st=con.createStatement();
            rs=st.executeQuery("select * from categories");
            while(rs.next()){
            srno+=1;
            %>
                            <li>
                                <form action="CustomerProducts.jsp" method="post">
                                    <input type="hidden" name="category" value="<%=rs.getString(2)%>">
                                    <a href="#"><button id="subbtn" class="btn btn-primary" type="submit"><span class="fa fa-list-alt mr-3"></span><%=rs.getString(2)%></button></a> 
                                </form>
          
                             </li>
              
                        
                        <%
                            }
            
            
        }catch(Exception e){
            System.out.println(e);
        }
                        
                        %>
    
      </ul>

    </nav>

    <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5 pt-5">
  <main id="main">
      
       
      <div class="container py-5">

          <%if(category==null || category.equals("All Products")){%>
          
           <h2 class="font-weight-bold mb-2">All Products</h2>
          <%}else{%>
           
           <h2 class="font-weight-bold mb-2"><%=category%></h2>
           <%}%>

  <!-- First Row [Prosucts]-->
  
 
  <p class="font-italic text-muted mb-4"></p>

  <div class="row pb-5 mb-4">
      <%if(category==null || category.equals("All Products")){%>
                                    <%
                 Connection con1;
                 Statement st1=null,st2=null;
                 ResultSet rs1=null,rs2=null;
                 int srno1=0;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
            st1=con1.createStatement();
            st2=con1.createStatement();
            rs1=st1.executeQuery("select * from products");
            while(rs1.next()){
            srno1+=1;
            String StartDate=(String)rs1.getString(10);
            String EndDate=(String)rs1.getString(6);
            //Check Current Date Bet Start And End Date
                // Define the format of the string
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        
        // Parse the string to LocalDateTime using the formatter
        LocalDateTime bidenddate = LocalDateTime.parse(EndDate, formatter);
        LocalDateTime bidStartdate = LocalDateTime.parse(StartDate, formatter);
        
         LocalDateTime currentDateTime = LocalDateTime.now();
         if(currentDateTime.isEqual(bidStartdate)||currentDateTime.isAfter(bidStartdate)&& currentDateTime.isEqual(bidenddate)||currentDateTime.isBefore(bidenddate)){
            
            String Category=(String)rs1.getString(11);
            int productid=Integer.parseInt(rs1.getString(1));
            String highBid="Not Available..";
   
            rs2=st2.executeQuery("select * from bids where category='"+Category+"' and product_id="+productid);
        while(rs2.next()){
            highBid=rs2.getString(10);
             }
             //Date Parsing
                   // String originalDateString = "2023-11-22T06:09";
        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        String formattedEndDate=null;
        try {
            Date originalDate = originalFormat.parse(EndDate);

            SimpleDateFormat newFormat = new SimpleDateFormat("d MMMM yyyy hh:mm:ss a", Locale.ENGLISH);
             formattedEndDate= newFormat.format(originalDate);

            System.out.println("Formatted Date: " + formattedEndDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
            %>
            
   <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 mt-3">
      <!-- Card-->
      <div class="card rounded shadow-sm border-0">
          <div class="card-body p-4">
               <div id="ribbon">Best Value</div>
              <img src="assets/img/Products/<%=rs1.getString(7)%>" alt="" width="250" height="250" class="img-fluid d-block mx-auto mb-3">
              <span class="badge badge-warning"><%=formattedEndDate%></span>  
              <h5> <a href="#" class="text-dark"><%=rs1.getString(2)%></a></h5>
          <p class="small text-muted font-italic">
              <span><b>Category: </b><%=rs1.getString(11)%></span><br>
              <span><b>Description: </b><%=rs1.getString(3)%></span><br>
              <span style="font-size:20px;color:red; font-family: none;">Price:<%=rs1.getString(5)%> 	&#8377;</span> &nbsp;&nbsp;&nbsp;<i class="fa fa-tag" style="font-size:30px;color:#FFC300;"></i>
             
          </p>
          
          
          <ul class="list-inline small">
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star-o text-success"></i></li>
<button type="button" class="btn btn-primary btn-sm float-right" onclick="myFunction('<%=rs1.getString(1)%>','<%=rs1.getString(2)%>','<%=rs1.getString(3)%>','<%=rs1.getString(4)%>','<%=rs1.getString(5)%>','<%=rs1.getString(6)%>','<%=rs1.getString(10)%>','<%=rs1.getString(11)%>','<%=rs1.getString(7)%>','<%=highBid%>')" data-toggle="modal" data-target=".bd-example-modal-lg">View</button>
    
          </ul>
<span id="countdown<%=srno1%>" class="clockdiv"></span>
        </div>
      </div>
    </div>
              <script>createReverseCountdownClock('<%=EndDate%>','<%=srno1%>');</script>
                        
        <%}
                            }
            
            
        }catch(Exception e){
            System.out.println(e);
        }
                        
                        %>
          
   
          <%}else{%>
                                      <%
                 Connection con2;
                 Statement st2=null,st3=null;
                 ResultSet rs2=null,rs3=null;
                 int srno2=0;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
            st2=con2.createStatement();
            st3=con2.createStatement();
            rs2=st2.executeQuery("select * from products where category_name='"+category+"'");
           
            
            while(rs2.next()){
            srno2+=1;
                    String EndDate1=(String)rs2.getString(6);
                     String Category=(String)rs2.getString(11);
            int productid=Integer.parseInt(rs2.getString(1));
            String highBid1="Not Available..";
          String StartDate=(String)rs2.getString(10);
           
            //Check Current Date Bet Start And End Date
                // Define the format of the string
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        
        // Parse the string to LocalDateTime using the formatter
        LocalDateTime bidenddate = LocalDateTime.parse(EndDate1, formatter);
        LocalDateTime bidStartdate = LocalDateTime.parse(StartDate, formatter);
        
         LocalDateTime currentDateTime = LocalDateTime.now();
         if(currentDateTime.isEqual(bidStartdate)||currentDateTime.isAfter(bidStartdate)&& currentDateTime.isEqual(bidenddate)||currentDateTime.isBefore(bidenddate)){
            
        
      rs3=st3.executeQuery("select * from bids where category='"+Category+"' and product_id="+productid);
        while(rs3.next()){
            highBid1=rs3.getString(10);
             }
                     //Date Parsing
                   // String originalDateString = "2023-11-22T06:09";
        SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        String formattedEndDate=null;
        try {
            Date originalDate = originalFormat.parse(EndDate1);

            SimpleDateFormat newFormat = new SimpleDateFormat("d MMMM yyyy hh:mm:ss a", Locale.ENGLISH);
             formattedEndDate= newFormat.format(originalDate);

            System.out.println("Formatted Date: " + formattedEndDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
            %>
   <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 mt-3">
      <!-- Card-->
      <div class="card rounded shadow-sm border-0">
          <div class="card-body p-4">
               <div id="ribbon">Best Value</div>
              <img src="assets/img/Products/<%=rs2.getString(7)%>" alt="" width="250" height="250" class="img-fluid d-block mx-auto mb-3">
          <span class="badge badge-warning"><%=formattedEndDate%></span>
              <h5> <a href="#" class="text-dark"><%=rs2.getString(2)%></a></h5>
          <p class="small text-muted font-italic">
              <span><b>Category: </b><%=rs2.getString(11)%></span><br>
              <span><b>Description: </b><%=rs2.getString(3)%></span><br>
              <span style="font-size:20px;color:red; font-family: none;">Price:<%=rs2.getString(5)%> 	&#8377;</span> &nbsp;&nbsp;&nbsp;<i class="fa fa-tag" style="font-size:30px;color:#FFC300;"></i>
              
          </p>
          
          
          <ul class="list-inline small">
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
            <li class="list-inline-item m-0"><i class="fa fa-star-o text-success"></i></li>
     
          </ul>
<button type="button" class="btn btn-primary btn-sm float-right" onclick="myFunction('<%=rs2.getString(1)%>','<%=rs2.getString(2)%>','<%=rs2.getString(3)%>','<%=rs2.getString(4)%>','<%=rs2.getString(5)%>','<%=rs2.getString(6)%>','<%=rs2.getString(10)%>','<%=rs2.getString(11)%>','<%=rs2.getString(7)%>','<%=highBid1%>')" data-toggle="modal" data-target=".bd-example-modal-lg">View</button>
        <span id="countdown<%=srno2%>" class="clockdiv"></span>
          </div>
      </div>
    </div>
                 <script>createReverseCountdownClock('<%=EndDate1%>','<%=srno2%>');</script>
                        
                        <%}
                            
                     
                            }
                       if(srno2==0){%>
                        <div class="text-center bg-secondary text-white h5 pt-2 pb-2"> No Data Available</div>
                            <%
                            
                            }  
            
            
        }catch(Exception e){
            System.out.println(e);
        }
                        
                        %>
           <%}%>
    

 
  </div>

</div>
    
  </main><!-- End #main -->
    </div>
  </div>

  

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
<!-- Modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <form action="bid" method="post">
            <input type="hidden" id="id" name="pid">
            <input type="hidden" value="<%=id%>" name="uid">
            <input type="hidden" value="<%=uname%>"  name="Uname">
            <input type="hidden" id="Pname"  name="Pname">
             <input type="hidden" id="Category"  name="Category">
         <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    <div class="modal-body">
       <div class="text-center">
           <img src="" id="imgname" width="250" height="250" class="rounded img-thumbnail mb-3" alt="...">
        </div>
    
        <ul class="list-group">
            
            <li class="list-group-item active" >Product Name:&nbsp;&nbsp;<label id="name"></label></li>
  <li class="list-group-item" id="name">Category:&nbsp;&nbsp;<label id="cname"></label></li>
  <li class="list-group-item">Price:&nbsp;&nbsp;<label id="rprice"></label> &nbsp;&#8377;<span style="margin-left:300px;">Starting Amount:&nbsp;&nbsp;<label id="sbid"></label>&nbsp;&#8377;</span></li>
  <li class="list-group-item">Bidding Start Date:&nbsp;&nbsp;<label id="bsdate"></label><span style="margin-left:100px;">Bidding End Date:&nbsp;&nbsp;<label id="bedate"></label></span></li>
  <li class="list-group-item">Description:&nbsp;&nbsp;<p id="desc"></p><span style="margin-left:300px;">Highest Bid:&nbsp;&nbsp;<label id="Hbid"></label></span></li>
        </ul>
   <p class="align-items-center">
     <%
    if(session.getAttribute("id")!=null){
           String Uname=(String)session.getAttribute("uname");%>
       <button style="margin-left:300px; margin-top:10px; padding-left:50px; padding-right:50px;" class="btn btn-primary float-center" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
    Bid
  </button>
       <%}else{%>
       <a href="CustomerLogin.jsp"> <button style="margin-left:300px; margin-top:10px; padding-left:50px; padding-right:50px;" class="btn btn-primary float-center" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
            Bid
       </button> <span class="float-right">Note:Please login for bid</span></a> 
       <%}%>
</p>
        <div class="collapse" id="collapseExample">
  <div class="card card-body">
      
           <div class="form-group">
    <label for="exampleInputPassword1">Enter Bid Amount:</label>
    <input type="number" class="form-control" name="bidamount" id="exampleInputPassword1" placeholder="Bid Amount">
  </div>
      
  </div>
      </div>
</div>
    
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
            
            </form>
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
        Designed by <a href="#">Nikita</a>
   
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <div id="message" style="position:absolute; top:50%; left:20%; width:80%; padding:10px; background-color: #fff; border-radius: 5px;" >
      <div class="alert alert-success alert-dismissable" id="salert">
            <button type="button" onclick="successdivclose()" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            Success! Bid successfully submitted...!
        </div>
  <div class="alert alert-danger alert-dismissable" id="dalert">
            <button type="button" onclick="dangerdivclose()" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          Oops Something went wrong!
        </div>
  </div> 
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

  
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/popper.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/main1.js"></script>
  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   <script>
      
      function myFunction(id,name,desc,sbid,rprice,bedate,bsdate,cname,imgname,highbid) {
  document.getElementById("id").value= id;
  document.getElementById("Pname").value=name;
  document.getElementById("Category").value= cname;
   document.getElementById("name").innerHTML= name;
    document.getElementById("desc").innerHTML= desc;
     document.getElementById("sbid").innerHTML= sbid;
      document.getElementById("rprice").innerHTML= rprice;
       document.getElementById("bedate").innerHTML= bedate;
        document.getElementById("bsdate").innerHTML= bsdate;
         document.getElementById("cname").innerHTML= cname;
          document.getElementById("imgname").src="assets/img/Products/"+imgname;
          
          if(highbid=="Not Available.."){
                 document.getElementById("Hbid").innerHTML="Not Available..";  
          }else if(highbid==0){
                document.getElementById("Hbid").innerHTML="Not Available.."; 
          }else{
               document.getElementById("Hbid").innerHTML=highbid+"&nbsp;&#8377;"; 
          }
          
}
  </script>
  <script>
       var status=document.getElementById("status").value;
       $(document).ready(function () {
              if(status=="success"){
                
                 $('#message').show();
            $('#salert').show();
            }
            if(status=="exception"){
                  $('#message').show();
            $('#dalert').show();
            }
                
            
        });
   
  function successdivclose(){
       document.getElementById("message").style.display = "none";
  }
    function dangerdivclose(){
       document.getElementById("message").style.display = "none";
  }         
              
          
      
  </script>
  
 
  </body>
</html>
