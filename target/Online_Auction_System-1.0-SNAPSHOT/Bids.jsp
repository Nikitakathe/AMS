<%
    if(session.getAttribute("id")==null){
    response.sendRedirect("AdminLogin.jsp");
    }
    String uname=(String)session.getAttribute("uname");

%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
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
    Bids
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
  <style>
   
      #cbtn:hover,#productbtn:hover{
          background-color: #002147 ;
      }
    
  </style>
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="blue">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
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
          <li>
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
           <li>
               <a href="Products.jsp">
              <i class="now-ui-icons design_bullet-list-67"></i>
              <p>Products</p>
            </a>
          </li>
           <li  class="active ">
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
            <a class="navbar-brand" href="#pablo">Bidder List</a>
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
              <div class="card-header">
                <h4 class="card-title">Bidder List</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                      <th>
                        Sr.No
                      </th>
                      <th>
                        Name
                      </th>
                      <th>
                        Product Name
                      </th>
                      <th>
                        Amount
                      </th>
                      <th class="text-right">
                        Status
                      </th>
                      <th class="text-right">
                        Buyer Details
                      </th>
                       <th class="text-right">
                        Product Details
                      </th>
                    </thead>
                    <tbody>
                                                                        <%
                 Connection con2;
                 Statement st2=null,st3=null,st4=null,st5=null;
                 ResultSet rs2=null,rs3=null,rs4=null,rs5=null;
                 int srno2=0;
                 String BidDate=null,BidAmount=null,Status=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
            st2=con2.createStatement();
            rs2=st2.executeQuery("select * from bids");
           st3=con2.createStatement();
           st4=con2.createStatement();
           st5=con2.createStatement();
            
            while(rs2.next()){
            srno2+=1;
            BidDate=(String)rs2.getString(6);
            BidAmount=(String)rs2.getString(4);
            Status=(String)rs2.getString(5);
            String ID=(String)rs2.getString(3);
              int pid=Integer.parseInt(ID);
            int UID=Integer.parseInt(rs2.getString(2));
            
            String Name=null,Email=null,Contact=null;
            rs4=st4.executeQuery("select * from users where id="+UID);
            while(rs4.next()){
            Name=rs4.getString(2);
            Email=rs4.getString(5);
            Contact=rs4.getString(6);
          }
         
            
            String name=null,desc=null,sbid=null,rprice=null,bedate=null,bsdate=null,cname=null,imgname=null;
              rs3=st3.executeQuery("select * from products where id="+pid);
              while(rs3.next()){
              name=rs3.getString(2);
              desc=rs3.getString(3);
              sbid=rs3.getString(4);
              rprice=rs3.getString(5);
             bedate=rs3.getString(6);
              bsdate=rs3.getString(10);
             cname=rs3.getString(11);
              imgname=rs3.getString(7);
           }
             
              ArrayList<Integer> userid = new ArrayList<>();
              ArrayList<Integer> productid = new ArrayList<>();
              ArrayList<Integer> amount = new ArrayList<>();
              rs5=st5.executeQuery("select * from bids where category='"+cname+"'");
                  while(rs5.next()){
                    userid.add(Integer.parseInt(rs5.getString(2)));
                    productid.add(Integer.parseInt(rs5.getString(3)));
                    amount.add(Integer.parseInt(rs5.getString(4)));
                    }
        Integer max = Collections.max(amount);
        int winuserindex= amount.indexOf(max);
        int winUserID=userid.get(winuserindex);
          int sellProductID=productid.get(winuserindex);
        // Define the format of the string
        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        
        // Parse the string to LocalDateTime using the formatter
        LocalDateTime bidenddate = LocalDateTime.parse(bedate, formatter);
        
         LocalDateTime currentDateTime = LocalDateTime.now();
             PreparedStatement pstmt3=con2.prepareStatement("update bids set highBid=? where category=? and product_id=?");
        
                pstmt3.setInt(1,max);
                pstmt3.setString(2,cname);
                pstmt3.setInt(3,pid);
            int rowCount3=pstmt3.executeUpdate();
         
            
            if(rowCount3>0){
              System.out.println("highBid Updated");
              
              
            }
         
           // Compare the specified date and time with the current date and time
        if (bidenddate.isAfter(currentDateTime)) {
            System.out.println("The specified date and time is in the future.");
             PreparedStatement pstmt=con2.prepareStatement("update bids set highBid=? where category=? and product_id=?");
        
                pstmt.setInt(1,max);
                pstmt.setString(2,cname);
                pstmt.setInt(3,pid);
            int rowCount=pstmt.executeUpdate();
         
            
            if(rowCount>0){
              System.out.println("highBid Updated");
              
              
            }
           
        } else if (bidenddate.isBefore(currentDateTime)) {
            System.out.println("The specified date and time is in the past.");
           PreparedStatement pstmt=con2.prepareStatement("update bids set status=?,highBid=? where user_id=? and product_id=?");
         pstmt.setString(1,"Winner of bidding");
         pstmt.setInt(2,max);
            pstmt.setInt(3,winUserID);
             pstmt.setInt(4,sellProductID);
                  int rowCount=pstmt.executeUpdate();
         
            
            if(rowCount>0){
              System.out.println("Status Updated");
              
              
            }
             
            PreparedStatement pstmt2=con2.prepareStatement("update bids set status='Bid loss!' where user_id!=? and product_id=? and category=?");
         pstmt2.setInt(1,winUserID);
             pstmt2.setInt(2,sellProductID);
             pstmt2.setString(3,cname);
                     int rowCount1=pstmt2.executeUpdate();
         
            
            if(rowCount1>0){
              System.out.println("Status Updated loss");
              
              
            }
      } else {
            System.out.println("The specified date and time is the same as the current date and time.");
         PreparedStatement pstmt=con2.prepareStatement("update bids set status=?,highBid=? where user_id=? and product_id=?");
         pstmt.setString(1,"Winner of bidding");
         pstmt.setInt(2,max);
            pstmt.setInt(3,winUserID);
             pstmt.setInt(4,sellProductID);
                  int rowCount=pstmt.executeUpdate();
         
            
            if(rowCount>0){
              System.out.println("Status Updated");
              
              
            }
             
            PreparedStatement pstmt2=con2.prepareStatement("update bids set status='Bid loss!' where user_id!=? and product_id=? and category=?");
         pstmt2.setInt(1,winUserID);
             pstmt2.setInt(2,sellProductID);
             pstmt2.setString(3,cname);
                     int rowCount1=pstmt2.executeUpdate();
         
            
            if(rowCount1>0){
              System.out.println("Status Updated loss");
              
              
            }
            
           }
           String bidstatus=(String)rs2.getString(5);
            %>
                        <tr>
                         <td>
                          <%=srno2%>
                        </td>
                        <td>
                          <%=rs2.getString(7)%>
                        </td>
                        <td>
                        <%=rs2.getString(8)%>
                        </td>
                        <td>
                        <%=rs2.getString(4)%> &#8377;
                        </td>
                        <td class="text-right">
                            <%if(bidstatus.equals("Winner of bidding")){%>
                            <span class="badge badge-success" style="font-size:13px; font-weight:400;">Winner of bidding</span>
                            <%}else if(bidstatus.equals("Bid loss!")){%>
                            <span class="badge badge-danger"  style="font-size:13px; font-weight:400;">Bid loss!</span>
                            <%}else{%>
                            <span class="badge badge-warning "  style="font-size:13px; font-weight:400;">Bidding Stage</span>
                            <%}%>
                        </td>
                         <td class="text-right">
                           
                             <button type="button" class="btn btn-primary btn-sm" id="cbtn" onclick="BuyerDetails('<%=Name%>','<%=Email%>','<%=Contact%>','<%=BidDate%>','<%=BidAmount%>','<%=Status%>')" data-toggle="modal" data-target="#buyermodel" ><i class="fa fa-eye"></i> View Details</button>
                        </td>
                         <td class="text-right">
                      <button  type="button" class="btn btn-primary btn-sm" id="productbtn" onclick="myFunction('<%=name%>','<%=desc%>','<%=sbid%>','<%=rprice%>','<%=bedate%>','<%=bsdate%>','<%=cname%>','<%=imgname%>','<%=max%>')" data-toggle="modal" data-target="#productmodal"><i class="fa fa-info-circle"></i> Product Info</button>
                      </tr>
                        
                        <%  }  
  
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
     
 <!--Buyer Modal -->
 <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="buyermodel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        
           
         <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Buyer Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    <div class="modal-body">
       <div class="text-center">
           <img src="assets/img/user.png"  width="250" height="250" class="rounded img-thumbnail mb-3" alt="...">
        </div>
    
        <ul class="list-group">
            
  <li class="list-group-item active" >Name:&nbsp;&nbsp;<label id="Name"></label></li>
  <li class="list-group-item">Email:&nbsp;&nbsp;<label id="Email"></label></li>
  <li class="list-group-item">Contact:&nbsp;&nbsp;<label id="Contact"></label> &nbsp;&nbsp;<span style="margin-left:300px;">Bid Amount:&nbsp;&nbsp;<label id="BidAmount"></label>&nbsp;&#8377;</span></li>
  <li class="list-group-item">Bid Date:&nbsp;&nbsp;<label id="BidDate"></label><span style="margin-left:100px;">Status:&nbsp;&nbsp;<label id="Status"></label></span></li>
 

  </ul>

  
</div>
  
            
          
    </div>
  </div>
</div>
                        
<!-- Modal -->
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="productmodal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        
           
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
  <li class="list-group-item">Description:&nbsp;&nbsp;<p id="desc"></p><span style="margin-left:300px;">Highest Bid:&nbsp;&nbsp;<label id="max"></label>&nbsp;&#8377;</span></li>

  </ul>

  
</div>
  
            
          
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
      
      function myFunction(name,desc,sbid,rprice,bedate,bsdate,cname,imgname,max) {

   document.getElementById("name").innerHTML= name;
    document.getElementById("desc").innerHTML= desc;
     document.getElementById("sbid").innerHTML= sbid;
      document.getElementById("rprice").innerHTML= rprice;
       document.getElementById("bedate").innerHTML= bedate;
        document.getElementById("bsdate").innerHTML= bsdate;
         document.getElementById("cname").innerHTML= cname;
          document.getElementById("imgname").src="assets/img/Products/"+imgname;
          document.getElementById("max").innerHTML= max;
}
function BuyerDetails(Name,Email,Contact,BidDate,BidAmount,Status) {

   document.getElementById("Name").innerHTML= Name;
    document.getElementById("Email").innerHTML= Email;
     document.getElementById("Contact").innerHTML= Contact;
      document.getElementById("BidDate").innerHTML= BidDate;
       document.getElementById("BidAmount").innerHTML= BidAmount;
        document.getElementById("Status").innerHTML= Status;
         
}
  </script>
</body>

</html>