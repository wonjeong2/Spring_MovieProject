<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquey.min.js"></script>
<title>Login</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto');
html{
	padding: 0;
}
body{
	margin-top: 0;
	font-family: 'Roboto',sans-serif;
	background: url(/resources/img/movie_screen.jpg) no-repeat center center fixed;
	background-size: cover;
}
.main-section{
	margin:  0 auto;
}
.modal-content{
	background-color: #3b4652;
	opacity: .95;
	padding: 10px 18px;
	box-shadow: 0px 0px 2px #848484;
}
.col-12 user-img{
	margin-top: -50px;
	margin-bottom: 35px;
}
.user-img img{
	height: 200px;
	width: 200px;
}
.form-group{
	margin-bottom: 25px;
}
.form-group input{
	height: 42px;
	border-radius: 5px;
	border: 0;
	font-size: 18px;
}

button {
	width: 40%;
	margin: 5px 0 25px;
}
.btn{
	background-color: #27c2a5;
	color: #fff;
	font-size: 19px;
	padding: 7px 14px;
	border-radius: 5px;
	border-bottom: 4px solid #219882;
}
.btn:hover, .btn:focus{
	background-color: #25a890 !important;
	border-bottom: 4px solid #25a890 !important;
}
.svg-inline--fa{
	font-size: 20px;
	margin-right: 7px;
}
.forgot{
	padding: 5px 0 25px;
}
.forgot a{
	color: #c2fbfe;
}
</style>
<body>
	<div class="modal-dialog text-center">
		<div class="col-sm-8 main-section">
			<div class="modal-content">
				<div class="col-12 user-img">
					<img src="/resources/img/movie_login.png" >
				</div>
				<form class="col-12">
					<div class="form-group">
						<input type="text" name="cid" class="form-control" placeholder="Enter Username">
					</div>
					<div class="form-group">
						<input type="password" name="cpw" class="form-control" placeholder="Enter UserPassword">
					</div>
					<button type="submit" class="btn"><i class="fas fa-sign-in-alt"></i>Login</button>
				</form>
				<div class="col-12 forgot">
					<a href="#">Forgot Password?</a>
				</div>
			</div> <!--모달 컨텐트의 끝-->
		</div>
	</div>
	
	
	
	
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

