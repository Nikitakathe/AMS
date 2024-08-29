<%
    if(session.getAttribute("id")==null){
    response.sendRedirect("AdminLogin.jsp");
    }
    String uname=(String)session.getAttribute("uname");

%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
    Add Products
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
    
   
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <style>
        .image-container{
    width: 90%;
    margin: 0 auto 30px auto;
}
.image-container img{
    display: block;
  
    max-width: 250px;
    max-height: 250px;
    margin-left: 20px;
    margin-bottom:20px; 
}
figcaption{
    margin: 20px 0 30px 0;
    text-align: left;
    margin-left: 60px;
    color: #2a292a;
}
input[type="file"]{
    display: none;
     
}
#filelabel{
    display: block;
    float:left;
    background-color: #025bee;
    color: #ffffff;
    font-size: 14px;
    text-align:center;
    width: 200px;
    padding: 10px 0;
    border-radius: 5px;
   
    margin-left: 100px;
    margin-bottom:20px; 
    cursor: pointer;
}
    </style>
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
            <a class="navbar-brand" href="#pablo">Add Product</a>
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
                <h4 class="card-title">Add Product</h4>
               
              </div>
              <div class="card-body">
       <form action="add_product" method="post" enctype="multipart/form-data">
  
        <div class="form-group col-md-4">
            <label for="exampleFormControlInput1">Product Name</label>
            <input type="text" name="productname" style="border-radius:5px;" class="form-control" id="exampleFormControlInput1">
        </div>
            <div class="form-group col-md-4">
            <label for="exampleFormControlInput1">Category</label>
            <select class="form-control" name="category" style="border-radius:5px;">
               <option value="-1">Please Select Here</option>
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
                          <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
      
                        <%
                            }
            
            
        }catch(Exception e){
            System.out.println(e);
        }
                        
                        %>
            </select>
        </div>
         <div class="form-group col-md-12">
            <label for="exampleFormControlTextarea1">Description</label>
            <textarea class="form-control" name="description" style="border-radius:5px; border:1px solid #D3D3D3;" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
           <div class="form-group  d-flex">
             <div class="form-group col-md-4">
            <label for="exampleFormControlInput1">Regular Price</label>
            <input type="number" name="regularprice" style="border-radius:5px;" class="form-control" id="exampleFormControlInput1" >
        </div>
            <div class="form-group col-md-4">
            <label for="exampleFormControlInput1">Starting Bidding Price</label>
            <input type="number" name="biddingprice" style="border-radius:5px;" class="form-control" id="exampleFormControlInput1" >
        </div>
            </div>
             <div class="form-group  d-flex">
                <div class="form-group col-md-4">
                    <label for="exampleFormControlInput1">Bidding Start Date/Time</label>
               
                    <input type="datetime-local" name="bstartdate" style="border-radius:5px;" class="form-control bg-white">
                      
                    
                </div>
                 <div class="form-group col-md-4">
                    <label for="exampleFormControlInput1">Bidding End Date/Time</label>
                    <input type="datetime-local"  name="benddate" style="border-radius:5px;" class="form-control bg-white">
                </div>
            </div>
                
                      <figure class="image-container">
            <img id="chosen-image">
            <figcaption id="file-name"></figcaption>
             </figure>

            <input type="file" id="upload-button" name="pimg" accept="image/*">
             <label  id="filelabel" for="upload-button">
                <i class="fas fa-upload"></i> &nbsp; Choose A Photo
            </label>
               
            
             <button type="submit" class="btn btn-primary" style="margin-left: -200px;margin-top: 80px;">Submit</button>
          <button type="reset" class="btn btn-primary" style="margin-top: 80px;">Cancel</button>
           
          
            </form>
    
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
            </script>, Designed by <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by <a
              href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
          </div>
        </div>
      </footer>
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

  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <script>
      config={
           enableTime: true,
    dateFormat: "Y-m-d H:i",
    altInput:true;
    altFormat:"F j, Y h:S K";
      }
      flatpickr("input[type=datetime-local]", config);

  </script>
  <script>
            
let uploadButton = document.getElementById("upload-button");
let chosenImage = document.getElementById("chosen-image");
let fileName = document.getElementById("file-name");

uploadButton.onchange = () => {
    let reader = new FileReader();
    reader.readAsDataURL(uploadButton.files[0]);
    reader.onload = () => {
        chosenImage.setAttribute("src",reader.result);
    }
    fileName.textContent = uploadButton.files[0].name;
}
  </script>
      
</body>

</html>