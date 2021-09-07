<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<spring:url value="/updateProfile" var="registration_form" />
<spring:url value="/doPost" var="postForm" />
<spring:url value="/resources/viewTimeLine/css/css/style.css" var="style" />
<spring:url value="/resources/viewTimeLine/css/css/bootstrap.min.css" var="bootstrap" />
<spring:url value="/resources/viewTimeLine/css/css/font-awesome.min.css" var="font" />


<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="This is social network html5 template available in themeforest......" />
<meta name="keywords"
	content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
<meta name="robots" content="index, follow" />
<title>My Timeline | This is My Coolest Profile</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="~/css/css/bootstrap.min.css" />
<link rel="stylesheet" href="~/css/css/style.css" />
<link rel="stylesheet" href="css/css/ionicons.min.css" />
<link rel="stylesheet" href="css/css/font-awesome.min.css" />
<link href="css/css/emoji.css" rel="stylesheet">
 <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!--Google Font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--Favicon-->
<link rel="shortcut icon" type="image/png" href="images/images/fav.png" />


<script type="text/javascript">
	var name = '<%=session.getAttribute("username")%>';
	var user = '<%=session.getAttribute("currentUser")%>';
	function doUpdate() {
		if(document.registration_form.first_name.value === '') {
			alert("Vui lòng nhập họ");
			 return;
		}
		if(document.registration_form.last_name.value === '') {
			alert("Vui lòng nhập tên");
			 return;
		}
		if(document.registration_form.email.value === '') {
			alert("Vui lòng nhập email");
			 return;
		}
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!filter.test(document.registration_form.email.value)) {
            alert('Hãy nhập địa chỉ email hợp lệ.\nExample@gmail.com');
            return;
        }
		if(document.registration_form.password.value === '') {
			alert("Vui lòng nhập mật khẩu");
			 return;
		}
		var check = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/;
        if (!check.test(document.registration_form.password.value)) {
            alert('Mật khẩu có ít nhất 6 kí tự, ít nhất một chữ cái và một số');
            return;
        } 
		if(document.registration_form.password.value.length < 6) {
			alert("Mật khẩu có ít nhất 6 kí tự");
			 return;
		}
		if(document.getElementById("city").value === '') {
			alert("Vui lòng nhập thành phố");
			 return;
		}
		if(document.registration_form.country.value === '') {
			alert("Vui lòng nhập đất nước");
			 return;
		}
		document.registration_form.target="_self";
	   	document.registration_form.method="post";
	   	document.registration_form.submit();
	   	alert(" Thanh cong !");
	}
</script>
</head>
<body>

	<%@ include file="header.jsp"%>

	<div class="container">

		<!-- Timeline
      ================================================= -->
		<div class="">

			<%@ include file="timeline-cover.jsp"%>

			<div id="page-contents">
				<div class="row">
					<div class="col-md-4">
						
					</div>
					<div class="col-md-8">
					<h2 style="text-align: center"> Update Profile
					</h2>
						<form name="registration_form" id='registration_form' modelAttribute="registration_form"
									class="form-inline"
									action="${registration_form }"
									method="post" onsubmit="return validateform()">
									<div class="row">
										<p><strong>Name (*)</strong></p>
										<div class="form-group col-xs-6">
											
											<label for="first_name" class="sr-only">First Name(*)</label> <input style="" required
												id="first_name" class="form-control input-group-lg item"
												type="text" name="first_name" title="Enter first name"
												value="${currentUser.first_name}"/>
										</div>
										<div class="form-group col-xs-6">
											<label for="last_name" class="sr-only">Last Name(*)</label> <input
												id="last_name" class="form-control input-group-lg item"
												type="text" name="last_name" title="Enter last name"
												value="${currentUser.last_name}" />
										</div>
									</div>
									<div class="row">
										<p><strong>Email (*)</strong></p>
										<div class="form-group col-xs-12">
											<label for="email" class="sr-only">Email(*)</label> <input
												id="email" class="form-control input-group-lg" type="text"
												name="email" title="Enter Email" value="${currentUser.email}"/>
										</div>
									</div>
									<div class="row">
										<p><strong>Password (*)</strong></p>
										<div class="form-group col-xs-12">
											<label for="password" class="sr-only">Password(*)</label> <input
												id="password" class="form-control input-group-lg"
												type="password" name="password" title="Enter password"
												placeholder="Password (*)" maxlength="11" minlength="6"/>
										</div>
									</div>
									<div class="row">
										<p class="birth">
											<strong>Date of Birth (*)</strong>
										</p>
										<div class="form-group col-sm-3 col-xs-6">
											<label for="month" class="sr-only"></label> <select
												class="form-control" id="day" name="day">
												<option value="day" disabled selected>Day</option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
												<option>9</option>
												<option>10</option>
												<option>11</option>
												<option>12</option>
												<option>13</option>
												<option>14</option>
												<option>15</option>
												<option>16</option>
												<option>17</option>
												<option>18</option>
												<option>19</option>
												<option>20</option>
												<option>21</option>
												<option>22</option>
												<option>23</option>
												<option>24</option>
												<option>25</option>
												<option>26</option>
												<option>27</option>
												<option>28</option>
												<option>29</option>
												<option>30</option>
												<option>31</option>
											</select>
										</div>
										<div class="form-group col-sm-3 col-xs-6">
											<label for="month" class="sr-only"></label> <select
												class="form-control" id="month" name="month" required>
												<option value="month" disabled selected>Month</option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
												<option>9</option>
												<option>10</option>
												<option>11</option>
												<option>12</option>
											</select>
										</div>
										<div class="form-group col-sm-6 col-xs-12">
											<label for="year" class="sr-only"></label> <select
												class="form-control" id="year" name="year" required>
												<option value="year" disabled selected>Year</option>
												<option>1987</option>
												<option>1988</option>
												<option>1989</option>
												<option>1990</option>
												<option>1991</option>
												<option>1992</option>
												<option>1993</option>
												<option>1994</option>
												<option>1995</option>
												<option>1996</option>
												<option>1997</option>
												<option>1998</option>
												<option>1999</option>
												<option>2000</option>
												<option>2001</option>
												<option>2002</option>
												<option>2004</option>
												<option>2005</option>
												<option>2006</option>
												<option>2007</option>
												<option>2008</option>
												<option>2009</option>
												<option>2010</option>
											</select>
										</div>
									</div>
									<div class="form-group gender">
										<p><strong>Sex (*)</strong></p>
										<input id="gender" class="form-control input-group-lg reg_name"
												type="text" name="gender" title="Enter city"
												value="${currentUser.gender}" required/>
										<!-- <label class="radio-inline"> 
										<input type="radio" value="Male"
											name="gender" checked required>Male
										</label>
										 <label class="radio-inline"> <input type="radio" value="Female"
											name="gender" required>Female
										</label>
										</label> <label class="radio-inline"> <input type="radio" value="Other"
											name="gender" required>Other
										</label> -->
									</div>
									<div class="row">
										<p><strong>Address (*)</strong></p>
										<div class="form-group col-xs-6">
											<label for="city" class="sr-only">City(*)</label> <input
												id="city" class="form-control input-group-lg reg_name"
												type="text" name="city" title="Enter city"
												value="${currentUser.city}" required/>
										</div>
										<div class="form-group col-xs-6">
											<label for="country" class="sr-only">Country(*)</label>
											<input
												id="country" class="form-control input-group-lg reg_name"
												type="text" name="country" title="Enter country"
												value="${currentUser.country}" required/>
										</div>
									</div>

									<!--Register Now Form Ends-->
									
									<input type="button" class="btn btn-success commonbutton"
										onclick="doUpdate()" value="Update Profile" style="margin-left: 238px;
    margin-top: 20px;"/>
								</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!--preloader-->
	<div id="spinner-wrapper">
		<div class="spinner"></div>
	</div>

	<!-- Scripts
    ================================================= -->
	<script src="js/js/jquery-3.1.1.min.js"></script>
	<script src="js/js/bootstrap.min.js"></script>
	<script src="js/js/jquery.sticky-kit.min.js"></script>
	<script src="js/js/jquery.scrollbar.min.js"></script>
	<script src="js/js/script.js"></script>
	<script src="js/js/upImage.js"></script>
	<script src="js/js/upAvatar.js"></script>
</body>
</html>
