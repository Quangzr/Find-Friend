<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

	
</script>

<style type="text/css">
.user_info{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 15px;
	}
.content {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}
.darker {
  border-color: #ccc;
  background-color: #ddd;
}
.content::after {
  content: "";
  clear: both;
  display: table;
}

.content img {
  float: left;
 max-width: 60px; 
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}
.content img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}
.newsfeed-menu:hover {
	
}

</style>


</head>
<body onload="loadForm()">
	<%@ include file="header.jsp"%>
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
							<a href="${pageContext.request.contextPath}/timeLine" class="text-white">${currentUser.first_name} ${currentUser.last_name}</a>
						</h5>
						<table id="follow-table">
							<tr>
								<th><a style="color: white" href="#">Posts</a></th>
								<th><a style="color: white" href="${pageContext.request.contextPath}/follower">Followers</a></th>
								<th><a style="color: white" href="${pageContext.request.contextPath}/following">Following</a></th>
							</tr>
							<tr>
								<td>${currentUser.posts }</td>
								<td>${currentUser.followers }</td>
								<td>${currentUser.followings }</td>
							</tr>
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

				<div class="col-md-5">
					<div class="content">
					  <!-- <img src="/w3images/bandmember.jpg" alt="Avatar" style="width:100%;"> -->
					  <img src="images/tutm.jpg" alt="user"  class="img-responsive profile-photo"/>
					  <p>Hello. How are you today?</p>
					  <span class="time-right">11:00</span>
					</div>
					
					<div class="content darker">
					 <!--  <img src="/w3images/avatar_g2.jpg" alt="Avatar" class="right" style="width:100%;"> -->
					  <img src="images/tutm.jpg" alt="user" class="img-responsive profile-photo right"/>
					  <p>Hey! I'm fine. Thanks for asking!</p>
					  <span class="time-left">11:01</span>
					</div>
					
					<div class="content">
					 <img src="images/tutm.jpg" alt="user"  class="img-responsive profile-photo"/>
					  <p>Sweet! So, what do you wanna do today?</p>
					  <span class="time-right">11:02</span>
					</div>
					
					<div class="content darker">
					  <img src="images/tutm.jpg" alt="user" class="img-responsive profile-photo right"/>
					  <p>Nah, I dunno. Play soccer.. or learn more coding perhaps?</p>
					  <span class="time-left">11:05</span>
					</div>
					
					<div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Write your message here..." />
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
                        </span>
                    </div>												
				</div>
				<div class="col-md-4">
					<!--news-feed links ends-->
					<div id="chat-block">
						<div class="title">Chat online</div>
						<ul class="online-users list-inline">
							<%-- <c:forEach var="i" items="${arr1}"> --%>
								<li><!-- <a href="newsfeed-messages.html" title="Linda Lohan">
										<img
										src="images/tutm.jpg" alt="user"
										class="img-responsive profile-photo" style="float: left" />
										<span
										class="online-dot"></span>
										<h5>Name</h5>
									</a> -->
									<!-- <div class="row" >
										<div class="col-sm-6">
											<img src="images/tutm.jpg" alt="user" class="img-responsive profile-photo"/>
											<span class="online-dot"></span>
											
										</div>
										<div class="col-sm-6">
											<span>Khalid aafafafas</span>
											
										</div>
									</div> -->
									<c:forEach var="m" items="${whoToFollow}">
										<div class="follow-user follow-${m.id}">
											<img src="images/tutm.jpg" alt=""
												class="profile-photo-sm pull-left" />
											<div>
												<h5>
													<a href="#">${m.first_name} ${m.last_name}</a>
												</h5>
												<a href="#" class="change-text text-green"
													onclick="changeText(${m.id})">Follow</a>
											</div>
										</div>
									</c:forEach>
								</li>
							<%-- </c:forEach> --%>
						</ul>
												
					</div>
					<!--chat block ends-->											
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
