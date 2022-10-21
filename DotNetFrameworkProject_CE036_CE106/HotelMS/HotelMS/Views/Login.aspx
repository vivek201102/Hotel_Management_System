<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HotelMS.Views.Login" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href=".../Assets/libraries/Bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="../Assets/libraries/Bootstrap/css/style.css" />
	<link rel="stylesheet" href="../Assets/libraries/Bootstrap/css/StyleSheet1.scss" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .container-fluid{
            background-image:url(../Assets/Images/hotel.jpg);
        }
    </style>
</head>
<body>
   <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-3 " style="font-size:50px;">
					<h2 class="heading-section">Login</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap" style="border:0.5px solid black;">
						<div class="img" style="background-image: url(../Assets/Images/hotel.jpg); height:500;"></div>
						<div class="login-wrap p-4 p-md-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Sign In</h3>
			      		</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
									</p>
								</div>
			      	</div>
							<form class="signin-form" runat="server">
			      		<div class="form-group mt-3">
			      			<input type="text" class="form-control" id="UserTb" required runat="server">
			      			<label class="form-control-placeholder" for="UserTb">User Name</label>
			      		</div>
		            <div class="form-group">
		              <input id="PasswordTb" type="password" class="form-control" required runat="server"/>
		              <label class="form-control-placeholder" for="exampleInputPassword1">Password</label>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password" onclick="myfunction()"></span>
		            </div>
		           <label id="errMsg" class="text-danger" runat="server"></label>
					<div class="form-group">
						
                        <asp:Button ID="LoginBtn" runat="server" Text="Sign in" class="form-control btn btn-primary rounded submit px-3" OnClick="LoginBtn_Click" />
					</div>
		            <div class="form-group d-md-flex">
		            	<div class="w-50 text-left">
			            	<div class="form-check">
							 <input class="form-check-input" type="radio" name="Role" id="AdminCb" runat="server" />
							 <label class="form-check-label" for="AdminCb" >Admin</label>
                            </div>
							<div class="form-check">
							<input class="form-check-input" type="radio" name="Role" id="UserCb" runat="server"/>
							<label class="form-check-label" for="UserCb" >User</label>
							</div>
									</div>
		            </div>
		          </form>
		          
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="../Assets/libraries/Bootstrap/js/jquery.min.js"></script>
  <script src="../Assets/libraries/Bootstrap/js/popper.js"></script>
  <script src="../Assets/libraries/Bootstrap/js/bootstrap.min.js"></script>
  <script src="../Assets/libraries/Bootstrap/js/main.js"></script>
	<script>
		function myfunction() {
			var x = document.getElementById("PasswordTb");
			if (x.type == "password") {
				x.type = "text";
			}
			else {
				x.type = "password";
            }
        }
	</script>

    
</body>
</html>
