<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<spring:url value="/doDelete" var="deleteUrl" />
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
<title>News Feed | Check what your friends are doing</title>

<!-- Stylesheets
    ================================================= -->
<link rel="stylesheet" href="css/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/css/style.css" />
<link rel="stylesheet" href="css/css/ionicons.min.css" />
<link rel="stylesheet" href="css/css/font-awesome.min.css" />
<link href="css/css/emoji.css" rel="stylesheet">

<!--Google Font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--Favicon-->
<link rel="shortcut icon" type="image/png" href="images/images/fav.png" />

<script>

	var name = '<%=session.getAttribute("username")%>';
	var user = '<%=session.getAttribute("currentUser")%>';
	
	console.log(name);
	
	console.log(user);
	
	function doPost() {	
	   	var ac = confirm("Bạn muốn cập nhật trạng thái ?");
	   	if(ac == true) {
	   		document.postForm.target="_self";
		   	document.postForm.method="post";
		   	document.postForm.submit();
	   	}
	}
	
	function txtClick() {
		$('#description').css({
			"width" : "490px",
			"height" : "100px"
		});
		$('.tools').css({
			"padding" : "110px 0 10px"
		}); 
	}
	
	$(document).mousedown(function (e) {
	    var container1 = $("#page-contents");
	    var container2 = $(".create-post");

	    if (container1.has(e.target).length === 0 || container2.has(e.target).length === 0) {
	    	$('#description').css({
				"width" : "253px",
				"height" : "50px"
			});
			$('.tools').css({
				"padding" : "8px 0 10px"
			});
	    }
	});
	
	function doDelete(id) {
		
 		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/doDelete/' + id,
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Successful!');
				console.log(data1);
			},
			
		});
 		
 		/* location.reload() */
    }
	
	function doActive(id) {
		
 		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/doActive/' + id,
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Successful!');
				console.log(data1);
			},
			
		});
 		
 		/* location.reload() */
    }
</script>

<style type="text/css">

.newsfeed-menu:hover {
	
}

</style>


</head>
<body onload="loadForm()">
	<header id="header"> <nav
		class="navbar navbar-default navbar-fixed-top menu">
	<div class="container">

		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
				src="images/images/logo.png" alt="logo" /></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right main-menu">
				<li class="dropdown">
					<a href="#">Home</a>
					<%-- <ul class="dropdown-menu newsfeed-home">
						<li><a href="index.html">Landing Page 1</a></li>
						<li><a href="${pageContext.request.contextPath}/dologin">Landing Page 2</a></li>
					</ul> --%>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Newsfeed <span><img
							src="images/images/down-arrow.png" alt="" /></span></a>
					<ul class="dropdown-menu newsfeed-home">
						<li><a href="newsfeed.html">Newsfeed</a></li>
						<li><a href="newsfeed-people-nearby.html">Poeple Nearly</a></li>
						<li><a href="newsfeed-friends.html">My friends</a></li>
						<li><a href="newsfeed-messages.html">Chatroom</a></li>
						<li><a href="newsfeed-images.html">Images</a></li>
						<li><a href="newsfeed-videos.html">Videos</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Timeline <span><img
							src="images/images/down-arrow.png" alt="" /></span></a>
					<ul class="dropdown-menu login">
						<li><a href="timeline.html">Timeline</a></li>
						<li><a href="timeline-about.html">Timeline About</a></li>
						<li><a href="timeline-album.html">Timeline Album</a></li>
						<li><a href="timeline-friends.html">Timeline Friends</a></li>
						<li><a href="edit-profile-basic.html">Edit: Basic Info</a></li>
						<li><a href="edit-profile-work-edu.html">Edit: Work</a></li>
						<li><a href="edit-profile-interests.html">Edit: Interests</a></li>
						<li><a href="edit-profile-settings.html">Account Settings</a></li>
						<li><a href="edit-profile-password.html">Change Password</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle pages"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">All Pages <span><img
							src="images/images/down-arrow.png" alt="" /></span></a>
					<ul class="dropdown-menu page-list">
						<li><a href="index.html">Landing Page 1</a></li>
						<li><a href="index-register.html">Landing Page 2</a></li>
						<li><a href="newsfeed.html">Newsfeed</a></li>
						<li><a href="newsfeed-people-nearby.html">Poeple Nearly</a></li>
						<li><a href="newsfeed-friends.html">My friends</a></li>
						<li><a href="newsfeed-messages.html">Chatroom</a></li>
						<li><a href="newsfeed-images.html">Images</a></li>
						<li><a href="newsfeed-videos.html">Videos</a></li>
						<li><a href="timeline.html">Timeline</a></li>
						<li><a href="timeline-about.html">Timeline About</a></li>
						<li><a href="timeline-album.html">Timeline Album</a></li>
						<li><a href="timeline-friends.html">Timeline Friends</a></li>
						<li><a href="edit-profile-basic.html">Edit Profile</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul></li>
				<!-- <li class="dropdown"><a href="contact.html">Contact</a></li> -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">About Account <span><img
							src="images/images/down-arrow.png" alt="" /></span></a>
					<ul class="dropdown-menu about-account">
						<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
						<li><a href="#">Manage account</a></li>
					</ul>
				</li>
			</ul>
			<form class="navbar-form navbar-right hidden-sm">
				<div class="form-group">
					<i class="icon"></i> <input type="text"
						class="form-control" placeholder="Search friends, photos, videos">
				</div>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav> </header>
	<!--Header End-->
	<div id="page-contents" class="page-contents">
		<div class="container">
			<div class="row">

				<!-- Newsfeed Common Side Bar Left
          ================================================= -->
				<div class="col-md-3 static">
					<div class="profile-card">
						<img src="images/tutm.jpg" alt="user" class="profile-photo" />
						<h5>
							<a href="#" class="text-white">${currentUser.first_name} ${currentUser.last_name}</a>
						</h5>
						<table id="follow-table">
							<%-- <tr>
								<a href="#"><th style ="text-align:center">Posts</th></a>
								<a href=""><th style ="text-align:center">Account</th></a>
							</tr>
							<tr>
								<td style ="text-align:center">${currentUser.posts }</td>
								<td style ="text-align:center">${currentUser.followers }</td>
							</tr> --%>
						</table>


						<%-- <a href="#" class="text-white"><i></i>${currentUser.followers}   followers</a> --%>
					</div>
					<!--profile card ends-->
					<ul class="nav-news-feed">
						<li class="newsfeed-menu"><i class="icon"><img alt="newsfeed" src="images/icons/newfeed.png"></i>
							<div>
								<a href="${pageContext.request.contextPath}/timeLine">My profile page</a>
							</div></li>
						<!-- <li><i class="icon ion-ios-people"></i>
							<div>
								<a href="newsfeed-people-nearby.html">People Nearby</a>
							</div></li> -->
						<li class="newsfeed-menu"><i class="icon"><img alt="newsfeed" src="images/icons/people.png"></i>
							<div>
								<a class="newsfeed-menu" href="${pageContext.request.contextPath}/people">People</a>
							</div></li>
						<li class="newsfeed-menu"><i class="icon"><img alt="newsfeed" src="images/icons/message.png"></i>
							<div>
								<a class="newsfeed-menu" href="${pageContext.request.contextPath}/message">Messages</a>
							</div></li>
						<li class="newsfeed-menu"><i class="icon"><img alt="newsfeed" src="images/icons/imagenewfeed.png"></i>
							<div>
								<a class="newsfeed-menu" href="${pageContext.request.contextPath}/image">Images</a>
							</div></li>
						<!-- <li><i class="icon ion-ios-videocam"></i>
							<div>
								<a href="newsfeed-videos.html">Videos</a>
							</div></li> -->
					</ul>
					<!--news-feed links ends-->
					<%-- <div id="chat-block">
						<div class="title">Chat online</div>
						<ul class="online-users list-inline">
							<c:forEach var="i" items="${arr1}">
								<li><a href="newsfeed-messages.html" title="Linda Lohan"><img
										src="images/tutm.jpg" alt="user"
										class="img-responsive profile-photo" /><span
										class="online-dot"></span></a></li>
							</c:forEach>
						</ul>
					</div>
					<!--chat block ends--> --%>
				</div>

				<div class="col-md-9">
					<h2 style="text-align: center"> List user
					</h2>
					<%-- <p>**********</p>
					<form:form  id="formList" name="formList"  method="post" modelAttribute="formList" acceptCharset="utf-8" class="form-cus" action="${deleteUrl }">
						<table id="follow-table" class="table table-striped">
							<tr>
								<th>STT</th>
								<th name="">UserId</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Password</th>
								<th>deleted</th>
								<th></th>
								<th></th>
							</tr>
							<c:choose>
								<c:when test="${ not empty listUser }">
									<c:forEach var="bid" items="${listUser}" varStatus="item" >
										<tr>
											<td>${item.index+1}</td>
											<td name="user_id">${bid.id }</td>
											<td>${bid.first_name }</td>
											<td>${bid.last_name }</td>
											<td>${bid.email }</td>
											<td>${bid.password }</td>
											<td id="deleted" >${bid.deleted }</td>
											<td><input class="btn btn-success"type="button" value="Delete" onclick="doDelete('${bid.id }')" /></td>
											
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>						 
							</table>
						</form:form> --%>	
					<p>**********</p>
					<form:form  id="formList" name="formList"  method="post" modelAttribute="formList" acceptCharset="utf-8" class="form-cus" action="${deleteUrl }">
						<table id="follow-table" class="table table-striped">
							<tr>
								<th>STT</th>
								<th name="">UserId</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Password</th>
								<th>deleted</th>
								<th></th>
								<th></th>
							</tr>
							<c:choose>
								<c:when test="${ not empty listUserActive }">
									<c:forEach var="bid" items="${listUserActive}" varStatus="item" >
										<tr>
											<td>${item.index+1}</td>
											<td name="user_id">${bid.id }</td>
											<td>${bid.first_name }</td>
											<td>${bid.last_name }</td>
											<td>${bid.email }</td>
											<td>${bid.password }</td>
											<td id="deleted" >${bid.deleted }</td>
											<td><input class="btn btn-success"type="button" value="Delete" onclick="doDelete('${bid.id }')" /></td>
											
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>						 
							</table>
						</form:form>	
						<p>**********</p>
						<form:form  id="formList" name="formList"  method="post" modelAttribute="formList" acceptCharset="utf-8" class="form-cus" action="${deleteUrl }">
							<table id="follow-table" class="table table-striped">
								<tr>
									<th>STT</th>
									<th name="">UserId</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
									<th>Password</th>
									<th>deleted</th>
									<th></th>
									<th></th>
								</tr>
								<c:choose>
									<c:when test="${ not empty listUserDelete }">
										<c:forEach var="bid" items="${listUserDelete}" varStatus="item" >
											<tr>
												<td>${item.index+1}</td>
												<td name="user_id">${bid.id }</td>
												<td>${bid.first_name }</td>
												<td>${bid.last_name }</td>
												<td>${bid.email }</td>
												<td>${bid.password }</td>
												<td id="deleted" >${bid.deleted }</td>
												<td><input class="btn btn-danger"type="button" value="Active" onclick="doActive('${bid.id }')" /></td>
												
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>						 
								</table>
							</form:form>
					<div class="create-post">						
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
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ&callback=initMap"></script>
	<script src="js/js/jquery-3.1.1.min.js"></script>
	<script src="js/js/bootstrap.min.js"></script>
	<script src="js/js/jquery.sticky-kit.min.js"></script>
	<script src="js/js/jquery.scrollbar.min.js"></script>
	<script src="js/js/script.js"></script>
</body>
</html>
