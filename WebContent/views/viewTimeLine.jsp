<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

<!-- Stylesheets
    ================================================= -->
<link href="${style}" rel="stylesheet" />
<link href="${bootstrap}" rel="stylesheet" />
<link href="${font}" rel="stylesheet" />

<link rel="stylesheet" href="css/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/css/style.css" />
<link rel="stylesheet" href="css/css/ionicons.min.css" />
<link rel="stylesheet" href="css/css/font-awesome.min.css" />
<link href="css/css/emoji.css" rel="stylesheet">
 
<link rel="stylesheet" href="viewTimeLine/css/css/bootstrap.min.css" />
<link rel="stylesheet" href="viewTimeLine/css/css/style.css" />
<link rel="stylesheet" href="viewTimeLine/css/css/ionicons.min.css" />
<link rel="stylesheet" href="viewTimeLine/css/css/font-awesome.min.css" />

<!--Google Font-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">

<!--Favicon-->
<link rel="shortcut icon" type="image/png" href="images/images/fav.png" />

<script type="text/javascript">
	var name = '<%=session.getAttribute("username")%>';
	var user = '<%=session.getAttribute("currentUser")%>';
	console.log(name);	
	console.log(user);
	
	function txtClick() {

		$('#description').css({
			"width" : "490px",
			"height" : "100px"
		});
		$('.tools').css({
			"padding" : "110px 0 10px"
		});
	}
	
	function doPost() {	
	   	var ac = confirm("Bạn muốn cập nhật trạng thái ?");
	   	if(ac == true) {
	   		document.postForm.target="_self";
		   	document.postForm.method="post";
		   	document.postForm.submit();
	   	}
	}

	$(document).mousedown(
			function(e) {
				var container1 = $("#page-contents");
				var container2 = $(".create-post");

				if (container1.has(e.target).length === 0
						|| container2.has(e.target).length === 0) {
					$('#description').css({
						"width" : "253px",
						"height" : "50px"
					});
					$('.tools').css({
						"padding" : "8px 0 10px"
					});
				}
			});

	$(function() {
		var fileupload = $("#FileUpload");
		var button = $("#btnImageUpload");
		button.click(function() {
			fileupload.click();
		});
		fileupload
				.change(function() {
					var fileName = $(this).val().split('\\')[$(this).val()
							.split('\\').length - 1];
					console.log(fileName);
				});
	});
</script>
</head>
<body>

	<%@ include file="header.jsp"%>

	<div class="container">

		<!-- Timeline
      ================================================= -->
		<div class="timeline">

			<%@ include file="timeline-cover.jsp"%>

			<div id="page-contents">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-7">


					<!-- Post Create Box
            ================================================= -->
					<div class="create-post">
						<form id="formPost" method="post" action="uploadServlet" enctype="multipart/form-data">
							<div class="row">
									<div class="col-md-7 col-sm-7">
										<div class="form-group">
											<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt="" class="profile-photo-md" />
											<textarea name="description" id="description" cols="30"
												rows="1" class="form-control"
												placeholder="Write what you wish" onclick="txtClick()">
												</textarea>
										</div>
		
									</div>
									<!-- Photo: <br/><input type="file" name="image" value="" /><br/> -->
									<div class="col-md-5 col-sm-5">
										<div class="tools">
											<ul class="publishing-tools list-inline">
												<li><input type="file" id="fileElem_1" name ="avatar" multiple accept="image/*" style="display: none" style="display:none" onchange="handleFiles(this.files)" />
													<a href="#" id="fileSelect_1"><i><img
															src="images/icons/compose.png"></i> </a></li>
												<li>
													<input type="file" id="fileElem" name ="image" multiple accept="image/*" style="display: none" style="display:none" onchange="handleFiles(this.files)" />
													<a href="#" id="fileSelect"><i><img
															src="images/icons/image.png"></i> </a></li>
												
												<li><a href="#"><i><img
															src="images/icons/video.png"></i> </a></li>
											</ul>
											<input type="button" class="btn btn-primary pull-right "
											onclick="doPost()" value="Publish" />
											<!-- <input type="submit" class="btn btn-primary pull-right " value="Publish"> -->
										</div>
									</div>
									<div id="fileList">
									  <p></p>
									</div>
								</div>
				        </form>
					</div>
					<!-- Post Create Box End-->



						<!-- Post Content
              ================================================= -->
						<div class="post-content">

							<!--Post Date-->
							<div class="post-date hidden-xs hidden-sm">
								<h5>${currentUser.first_name} ${currentUser.last_name}</h5>
								<p class="text-grey">Sometimes ago</p>
							</div>
							<!--Post Date End-->

							<!-- <img src="http://placehold.it/1920x1280" alt="post-image"
								class="img-responsive post-image" /> -->
							<div class="post-container">
								<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt="user"
									class="profile-photo-md pull-left" />
								
								<c:forEach var="p" items="${seaList}">
									<div class="post-content" >
										<!-- <img src="http://placehold.it/1920x1280" alt="post-image"
											class="img-responsive post-image" /> -->
										<div class="post-container">
											<img src="getStudentPhoto/<c:out value='${p.user_id}'/>" alt="user"
												class="profile-photo-md pull-left" />
											<div class="post-detail">
												<div class="user-info">
													<a href="${pageContext.request.contextPath}/timeLine" class="profile-link">${p.first_name} ${p.last_name}</a>
													<p class="text-muted">Published a photo about 3 mins ago</p>
												</div>
												<div class="line-divider"></div>
												<div class="post-text">
													<p>
														${p.description} <i class="em em-anguished"></i> <i
															class="em em-anguished"></i> <i class="em em-anguished"></i>
													</p>
													<img src="getPhoto/<c:out value='${p.id_post}'/>" alt=""
								class="img-responsive post-image" />
												</div>
												<div class="" style="margin-top: 5px">
													<a class="btn" onclick="changeStatus(${p.id_post})"><i class="fa fa-heart-o" style="font-size:24px; color: red"></i>
													</a>
													<a href="${pageContext.request.contextPath}/getUserLike/<c:out value='${p.id_post}'/>" ><span>${p.user_like}</span></a>
													<a class="btn"><i class="fa fa-comment-o" style="font-size:26px; color: black"></i>
													</a>
													<span>${p.comment}</span>
												</div>
												<form class="" name="" id='' modelAttribute="" method="" onsubmit="return validateform()">
													<div class="post-comment">
														<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt=""
															class="profile-photo-sm" /> 
														<input type="text" id="add_comment" name="comment"
															class="form-control" placeholder="Post a comment">
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
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
