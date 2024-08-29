<%
    if(session.getAttribute("id")==null){
    response.sendRedirect("CustomerLogin.jsp");
    }
    String uid=(String)session.getAttribute("id");
    String name=(String)session.getAttribute("name");
    String uname=(String)session.getAttribute("uname");
    String password=(String)session.getAttribute("password");
    String email=(String)session.getAttribute("email");
    String contact=(String)session.getAttribute("contact");
     String Adate=(String)session.getAttribute("cdate");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            background: #eee;
        }

        .card {
            border: none;

            position: relative;
            overflow: hidden;
            border-radius: 8px;
            cursor: pointer;
        }

        .card:before {

            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 4px;
            height: 100%;
            background-color: #bed4e7;
            transform: scaleY(1);
            transition: all 0.5s;
            transform-origin: bottom
        }

        .card:after {

            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 4px;
            height: 100%;
            background-color: #099cf1;
            transform: scaleY(0);
            transition: all 0.5s;
            transform-origin: bottom
        }

        .card:hover::after {
            transform: scaleY(1);
        }


        .fonts {
            font-size: 11px;
        }

        .social-list {
            display: flex;
            list-style: none;
            justify-content: center;
            padding: 0;
        }

        .social-list li {
            padding: 10px;
            color: rgb(7, 96, 249);
            font-size: 19px;
        }


        .buttons button:nth-child(1) {
            border: 1px solid #099cf1 !important;
            color: #099cf1;
            height: 40px;
        }

        .buttons button:nth-child(1):hover {
            border: 1px solid #099cf1 !important;
            color: #fff;
            height: 40px;
            background-color: #099cf1;
        }

        .buttons button:nth-child(2) {
            border: 1px solid #099cf1 !important;
            background-color: #099cf1;
            color: #fff;
            height: 40px;
        }
    </style>
</head>

<body>
    <div class="container mt-5">

        <div class="row d-flex justify-content-center">

            <div class="col-md-7">

                <div class="card p-3 py-4">

                    <div class="text-center">
                        <img src="assets/img/user.png" width="100" class="rounded-circle">
                    </div>

                    <div class="text-center mt-3">
                        <span class="bg-secondary p-1 px-4 rounded text-white">UID-<%=uid%></span>
                        <h5 class="mt-2 mb-0"><%=name%></h5>
                        <span><%=email%></span>

                        <div class="px-4 mt-1" style="display: flex;">
                            <span class="ml-md-5">Username:</span>&nbsp;&nbsp;<span><%=uname%></span>
                            <span class="ml-md-5">Password:</span>&nbsp;&nbsp;<span><%=password%></span>
                        </div>
                        <div class="px-4 mt-1" style="display: flex;">
                            <span class="ml-md-5">Email:</span>&nbsp;&nbsp;<span><%=email%></span>
                            <span class="ml-md-5">Contact:</span><span>&nbsp;&nbsp;<%=contact%></span>
                        </div>
                        <div class="px-4 mt-1" style="display: flex;">
                            
                            <span class="ml-md-5">Date Created:</span>&nbsp;&nbsp;<span><%=Adate%></span>
                        </div>

                        <ul class="social-list">
                            <li><i class="fa fa-facebook"></i></li>
                            <li><i class="fa fa-dribbble"></i></li>
                            <li><i class="fa fa-instagram"></i></li>
                            <li><i class="fa fa-linkedin"></i></li>
                            <li><i class="fa fa-google"></i></li>
                        </ul>

                        <div class="buttons">

                            <button class="btn btn-outline-primary px-4">Edit</button>
                            <button class="btn btn-primary px-4 ms-3">Contact</button>
                        </div>


                    </div>




                </div>

            </div>

        </div>

    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>