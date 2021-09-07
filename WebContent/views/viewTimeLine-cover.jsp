<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/css/style.css" />
<link rel="stylesheet" href="css/css/ionicons.min.css" />
<link rel="stylesheet" href="css/css/font-awesome.min.css" />
<link href="css/css/emoji.css" rel="stylesheet">

<!--Google Font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">

<!--Favicon-->
<link rel="shortcut icon" type="image/png" href="images/images/fav.png" />
<script type="text/javascript">
	var user = '<%=session.getAttribute("currentUser")%>';
	console.log(user);
</script>
</head>
<body>
	<div class="timeline-cover">

		<!--Timeline Menu for Large Screens-->
		<div class="timeline-nav-bar hidden-sm hidden-xs">
			<div class="row">
				<div class="col-md-3">
					<div class="profile-info">
						<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt=""
							class="img-responsive profile-photo" />
						<h3>${currentUser.first_name} ${currentUser.last_name}</h3>
						<p class="text-muted">Creative Director</p>
					</div>
				</div>
				<div class="col-md-9">
					<ul class="list-inline profile-menu">
						<li><a href="timeline.html" class="active">Timeline</a></li>
						<li><a href="timeline-about.html">About</a></li>
						<li><a href="timeline-album.html">Album</a></li>
						<li><a href="timeline-friends.html">Friends</a></li>
					</ul>
					<ul class="follow-me list-inline">
						<li>${currentUser.followers}  followers</li>
						<li>${currentUser.followings}  following</li>
						<li><button class="btn-primary">Follow</button></li>
					</ul>
				</div>
			</div>
		</div>
		<!--Timeline Menu for Large Screens End-->

		<!--Timeline Menu for Small Screens-->
		<div class="navbar-mobile hidden-lg hidden-md">
			<div class="profile-info">
				<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt=""
					class="img-responsive profile-photo" />
				<h4>Sarah Cruiz</h4>
				<p class="text-muted">Creative Director</p>
			</div>
			<div class="mobile-menu">
				<ul class="list-inline">
					<li><a href="timline.html" class="active">Timeline</a></li>
					<li><a href="timeline-about.html">About</a></li>
					<li><a href="timeline-album.html">Album</a></li>
					<li><a href="timeline-friends.html">Friends</a></li>
				</ul>
				<button class="btn-primary">Add Friend</button>
			</div>
		</div>
		<!--Timeline Menu for Small Screens End-->

	</div>

</body>
</html>