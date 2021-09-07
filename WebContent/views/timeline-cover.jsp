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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<!--Google Font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--Favicon-->
<link rel="shortcut icon" type="image/png" href="images/images/fav.png" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	var user = '<%=session.getAttribute("currentUser")%>';
	console.log(user);
	function doPost_1() {	
	   	var ac = confirm("Bạn muốn cập nhật trạng thái ?");
	   	if(ac == true) {
	   		document.getElementById("formPost_1").target="_self";
	   		document.getElementById("formPost_1").method="post";
	   		document.getElementById("formPost_1").submit();
	   	}
	}
</script>
</head>
<body>
	<div class="timeline-cover">

		<!--Timeline Menu for Large Screens-->
		<div class="timeline-nav-bar ">
			<div class="row">
				<div class="col-md-4">
					<div class="profile-info">
						<form id="formPost_1" method="post" action="uploadServlet" enctype="multipart/form-data">
							<input type="file" id="fileElem_1" name ="avatar" multiple accept="image/*" style="display: none" onchange="handleFiles(this.files)" />
							<a href="#" id="fileSelect_1">
								<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt=""
							class="img-responsive profile-photo" />
							</a>
						</form>
						
						<a href="${pageContext.request.contextPath}/myTimeLine"><h3>${currentUser.first_name} ${currentUser.last_name}</h3></a>
						<p class="text-muted">Creative Director</p>
						<!-- <div style=" width: 30px"> -->
							<i style='font-size:24px;margin-top: 30px;margin-left: -126px;margin-right: 5px;' class='fas'>&#xf666;</i> 
							<span style="font-size: 18px">Introduce</span>
						<!-- </div> -->
							<ul class="nav-news-feed" style="margin-left: -35px">
								<li class="" style="margin-bottom: -37px;">
									 <i class='far fa-calendar' style="font-size:15px"></i>
							      	<p >Date of birth: ${currentUser.dateofbirth}</p>
								</li>
								<li class="" style="margin-bottom: -37px;">
									<i class='far fa-envelope' style="font-size:15px"></i>
							        <p style=" margin-right: 36px;">Email: ${currentUser.email}</p>
								</li>
								<li class="" style="margin-bottom: -37px;">
							          <i class='fas fa-university'></i>
							        <p style="margin-right: 87px;">City: ${currentUser.city}</p>
								</li>
								<li class="" >
							          <i class='far fa-flushed' style="font-size:15px"></i>
							        <p style="margin-right: 93px;">Sex: ${currentUser.gender}</p>
								</li>
							</ul>
							<!-- <input type="button" class="btn btn-primary "
										onclick="doUpdate()" value="Update profile" /> -->
					</div>
					
					
				</div>
				<div class="col-md-8">
					<ul class="list-inline profile-menu">
						<li><a href="${pageContext.request.contextPath}/myTimeLine" class="active">Timeline</a></li>
						<li><a href="${pageContext.request.contextPath}/updateProfile">Update Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/sendMail">Send Mail</a></li>
						<li><a href="${pageContext.request.contextPath}/friend">Friend</a></li>
					</ul>
					<ul class="follow-me list-inline">
						<li style="margin-top: 7px;"><a style="color: white" href="${pageContext.request.contextPath}/follower">${currentUser.followers} Followers</a></li>
						<li style="margin-top: 7px;"><a style="color: white" href="${pageContext.request.contextPath}/following">${currentUser.followings} Following</a></li>
						<!-- <li><button class="btn-primary">Follow</button></li> -->
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
					<li><a href="${pageContext.request.contextPath}/myTimeLine" class="active">Timeline</a></li>
					<li><a href="${pageContext.request.contextPath}/updateProfile">Update Profile</a></li>
					<li><a href="${pageContext.request.contextPath}/sendMail">Send Mail</a></li>
					<li><a href="${pageContext.request.contextPath}/friend">Friend</a></li>
				</ul>
				<button class="btn-primary">Add Friend</button>
			</div>
		</div>
		<!--Timeline Menu for Small Screens End-->

	</div>

</body>
</html>