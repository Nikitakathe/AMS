<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> Sign Up Form</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #999;
	background: #fafafa;
	font-family: 'Roboto', sans-serif;
}
.form-control {
	min-height: 41px;
	box-shadow: none;
	border-color: #e6e6e6;
}
.form-control:focus {
	border-color: #00c1c0;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 425px;
	margin: 0 auto;
	padding: 30px 0;
}
.signup-form h2 {
	color: #333;
	font-weight: bold;
	margin: 0 0 25px;
}
.signup-form form {
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f4f4f4;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 40px 50px;
}
.signup-form .form-group {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 14px;
}
.signup-form input[type="checkbox"] {
	position: relative;
	top: 1px;
}    
.signup-form .btn, .signup-form .btn:active {        
	font-size: 16px;
	font-weight: bold;
    color:#fff;
	background:  #002147 !important;
	border: none;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #00b3b3 !important;
}
.signup-form a {
	color: #00c1c0;
	text-decoration: none;
}	
.signup-form a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
<div class="signup-form">
    <form action="register_customer" method="post">
		<h2>Sign Up</h2>
        <div class="form-group">
        	<input type="text" class="form-control" name="fname" placeholder="Full Name" required="required">
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="username" placeholder="Username" required="required">
        </div>
        <div class="form-group">
        	<input type="email" class="form-control" name="email" placeholder="Email Address" required="required">
        </div>
         <div class="form-group">
        	<input type="number" class="form-control" name="contact" placeholder="Contact" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required">
        </div>        
        <div class="form-group">
			<label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
		</div>
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg" >Sign Up</button>
        </div>
    </form>
    <div class="text-center">Already have an account? <a href="CustomerLogin.jsp">Login here</a></div>
</div>
</body>
</html>