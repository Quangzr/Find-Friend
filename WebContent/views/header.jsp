<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<spring:url value="/logout" var="logout" />
<spring:url value="/search" var="form_search" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Stylesheets
    ================================================= -->
		<link rel="stylesheet" href="css/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/css/style.css" />
    	<link rel="stylesheet" href="css/css/ionicons.min.css" />
    	<link rel="stylesheet" href="css/css/font-awesome.min.css" />
    	<link href="/css/css/emoji.css" rel="stylesheet">
    
    <!--Google Font-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    $(document).on("keypress", "input", function(e){
        if(e.which == 13){
        	document.form_search.target="_self";
		   	document.form_search.method="post";
		   	document.form_search.submit();
        }
    });
</script> 
</head>
<body>
	<!-- Header
    ================================================= -->
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
					<a href="${pageContext.request.contextPath}/home">Home</a>
					<%-- <ul class="dropdown-menu newsfeed-home">
						<li><a href="index.html">Landing Page 1</a></li>
						<li><a href="${pageContext.request.contextPath}/dologin">Landing Page 2</a></li>
					</ul> --%>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Find friends <span><img
							src="images/images/down-arrow.png" alt="" /></span></a>
					<ul class="dropdown-menu newsfeed-home">
						<li><a href="${pageContext.request.contextPath}/searchAddress">People Nearly</a></li>
						<li><a href="${pageContext.request.contextPath}/searchSex">Sex</a></li>
						<!-- <li><a href="newsfeed-friends.html"></a></li> -->
						<!-- <li><a href="newsfeed-messages.html">Chatroom</a></li>
						<li><a href="newsfeed-images.html">Images</a></li>
						<li><a href="newsfeed-videos.html">Videos</a></li> -->
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
						<!-- <li><a href="#">Manage account</a></li> -->
					</ul>
				</li>
			</ul>
			<form class="navbar-form navbar-right hidden-sm" name="form_search" id='form_search' modelAttribute="form_search"
									action="${form_search }" method="post" onsubmit="return validateform()">
				<div class="form-group">
					<i class="icon"></i> <input type="text"
						class="form-control" placeholder="Search friends, photos, videos" name="value_search">
				</div>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav> </header>
	<!--Header End-->
</body>
</html>