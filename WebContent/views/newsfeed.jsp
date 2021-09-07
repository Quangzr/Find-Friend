<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<spring:url value="/doPostComment" var="doPostComment" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/css/style.css" />
<link rel="stylesheet" href="css/css/ionicons.min.css" />
<link rel="stylesheet" href="css/css/font-awesome.min.css" />
<link href="css/css/emoji.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!--Google Font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--Favicon-->
<link rel="shortcut icon" type="image/png" href="images/images/fav.png" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>

	var name = '<%=session.getAttribute("username")%>';
	var user = '<%=session.getAttribute("currentUser")%>';
	var getPost = '<%=session.getAttribute("getPost")%>';
	
	console.log(name);
	
	console.log(user);
	
	function doPost() {	
	   	var ac = confirm("Bạn muốn cập nhật trạng thái ?");
	   	if(ac == true) {
	   		document.getElementById("formPost").target="_self";
	   		document.getElementById("formPost").method="post";
	   		document.getElementById("formPost").submit();
	   		
	   	}
	}
	
	function doPost_1() {	
	   	var ac = confirm("Bạn muốn cập nhật trạng thái ?");
	   	if(ac == true) {
	   		document.getElementById("formPost_1").target="_self";
	   		document.getElementById("formPost_1").method="post";
	   		document.getElementById("formPost_1").submit();
	   	}
	}
	
	function doPostCMT() {
		/* $.ajax({
			type: "POST",
			url: '${pageContext.request.contextPath}/doPostComment',
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Follow Successful!');
				console.log(data1);
			},
			
		}); */
		var ac = confirm("Bạn muốn cập nhật bình luận ?");
	   	if(ac == true) {
			document.getElementById("doPostComment").target="_self";
	   		document.getElementById("doPostComment").method="post";
	   		document.getElementById("doPostComment").submit();
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
	
	function changeText(id) {
		var temp = ".follow-" + id;
		console.log($('temp'));
		
		
		$(temp).fadeOut(1000, function(){
			$(this).remove();
		});
		
 		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/dofollow/' + id,
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Follow Successful!');
				console.log(data1);
			},
			
		});
 		
 		/* location.reload(); */
		
/* 		$.ajax({
		    url: '${pageContext.request.contextPath}/dofollow',
		    dataType: 'json',
		    type: 'post',
		    contentType: 'application/json',
		    data: JSON.stringify( { "first-name": $('#first-name').val(), "last-name": $('#last-name').val() } ),
		    processData: false,
		    success: function( data, textStatus, jQxhr ){
		        $('#response pre').html( JSON.stringify( data ) );
		    },
		    error: function( jqXhr, textStatus, errorThrown ){
		        console.log( errorThrown );
		    }
		}); */
		
		/* var a = $('.change-text').text();
		console.log(a);
		if(a == "Follow"){
			$('.change-text').text("Unfollow");
			$.ajax({
				type: "GET",
				url: '${pageContext.request.contextPath}/dofollow',
				dataType: "json",
				crossDomain: true,
				success: function(data1){
					console.log('Follow Successful!');
					console.log(data1);; 
				}
			});
		} else {
			$('.change-text').text("Follow");
			$.ajax({
				type: "GET",
				url: '${pageContext.request.contextPath}/dounfollow',
				dataType: "json",
				crossDomain: true,
				success: function(data2){
					console.log('Unfollow Successful!');
					console.log(data2);; 
				}
			});
		} */
	}

    $(function () {
        var fileupload = $("#fileSelect");
        var button = $("#fileElem");
        button.click(function () {
            fileupload.click();
        });
        fileupload.change(function () {
            var fileName = $(this).val().split('\\')[$(this).val().split('\\').length - 1];
            console.log(fileName);
        });
    });
    function changeStatus(id_post) {		
 		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/doLike/' + id_post,
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Successful!');
				console.log(data1);
			},
			
		});
 		
 		/* location.reload(); */
    }
    
    function doViewAll() {
    	$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/getAllUser',
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Successful!');
				console.log(data1);
			},
			
		});
 		
 		/* location.reload(); */
    }
	
    function changeListUserLike(id_post) {		
 		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/getUserLike/' + id_post,
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Successful!');
				console.log(data1);
			},
			
		});
 		
 		location.reload();
    }
    
    function getListComment(id_post) {
		
 		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/getListComment/' + id_post,
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Successful!');
				console.log(data1);
			},
			
		});
    }
    $( "#add_comment" ).keypress(function(e) {
    	 if(e.which == 13){
    		 
    	 }
    	  
    });
    
    var x = 0;
    var array = Array();

    $(document).ready(function(){
    	  $("#myBtn").click(function(){
    	    $("#myModal").modal();
    	  });
    	});
    
</script>

<style type="text/css">
.modal-header, h3, .close {
    background-color: #5cb85c;
    color:white !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-footer {
    background-color: #f9f9f9;
  }
</style>


</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="page-contents" class="page-contents">
		<div class="container">
			<div class="row">

				<!-- Newsfeed Common Side Bar Left
          ================================================= -->
				<div class="col-md-3 static">
					<div class="profile-card">
						<form id="formPost_1" method="post" action="uploadServlet" enctype="multipart/form-data">
							<input type="file" id="fileElem_1" name ="avatar" multiple accept="image/*" style="display: none" onchange="handleFiles(this.files)" />
							<a href="#" id="fileSelect_1">
								<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt="user" class="profile-photo" />
							</a>
						</form>
						
						
						<h5>
							<a href="${pageContext.request.contextPath}/myTimeLine" class="text-white">${currentUser.first_name} ${currentUser.last_name}</a>
						</h5>
						<table id="follow-table">
							<tr>
								<!-- <th><a style="color: white" href="#">Posts</a></th> -->
								<th><a style="color: white" href="${pageContext.request.contextPath}/follower">Followers</a></th>
								<th><a style="color: white" href="${pageContext.request.contextPath}/following">Following</a></th>
							</tr>
							<tr>
								<%-- <td>${currentUser.posts }</td> --%>
								<td>${currentUser.followers }</td>
								<td>${currentUser.followings }</td>
							</tr>
						</table>


						<%-- <a href="#" class="text-white"><i></i>${currentUser.followers}   followers</a> --%>
					</div>
					<!--profile card ends-->
					
					<ul class="nav-news-feed">
						<li class="">
							 <i class="fa fa-calendar" style="font-size:18px"></i>
					        <div><span>Date of birth: ${currentUser.dateofbirth}</span></div>
						</li>
						<li class="">
							<i class="fa fa-envelope" style="font-size:18px"></i>
					        <div><span>Email: ${currentUser.email}</span></div>
						</li>
						<li class="">
							<a href="#">
					          <i class="fa fa-home" style="font-size:25px"></i>
					        </a>
					        <div><span>City: ${currentUser.city}</span></div>
						</li>
						<li class="">
							<a href="#">
					          <i class="fa fa-user-circle-o" style="font-size:22px"></i>
					        </a>
					        <div><span>Sex: ${currentUser.gender}</span></div>
						</li>
					</ul>
					<ul class="nav-news-feed">
						
						<li class="newsfeed-menu"><i class="icon"><img alt="newsfeed" src="images/icons/newfeed.png"></i>
							<div>
								<a href="${pageContext.request.contextPath}/myTimeLine">My profile page</a>
							</div></li>
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
					</ul>
				</div>

				<div class="col-md-7">

					<!-- Post Create Box
            ================================================= -->
					<div class="create-post">
						<form id="formPost" method="post" action="uploadServlet_1" enctype="multipart/form-data">
							<div class="row" id="uploadImage">
									<div class="col-md-7 col-sm-7">
										<div class="form-group">
											<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt="" class="profile-photo-md" />
											<textarea name="description" id="description" cols="30"
												rows="1" class="form-control"
												placeholder="Write what you wish" onclick="txtClick()">
												</textarea>
										</div>
									</div>
									
									<div class="col-md-5 col-sm-5">
										<div class="tools">
											<ul class="publishing-tools list-inline">
												<!-- <li>
													<a href="#" id=""><i><img
															src="images/icons/compose.png"></i> </a></li> -->
												<!-- <li>
													<input type="file" id="fileElem_1" name ="avatar" multiple accept="image/*" style="display: none" onchange="handleFiles(this.files)" />
													<a href="#" id="fileSelect_1"><i><img
															src="images/icons/compose.png"></i> </a></li>
												<li> -->
													
												<!-- <li><input type="file" id="fileElem_2" name ="image" multiple accept="image/*" style="display:none" onchange="handleFiles(this.files)" />
													<a href="#" id="fileSelect_2"><i><img
															src="images/icons/image.png"></i> </a></li> -->
												
												<!-- <li><a href="#"><i><img
															src="images/icons/video.png"></i> </a></li> -->
											</ul>
											<input type="button" class="btn btn-success  "
											onclick="doPost_1()" value="Avatar" style="border-radius: 4px"/>
											<input type="button" class="btn btn-info pull-right "
											onclick="doPost()" value="Publish" />
										</div>
										
									</div>
									<div><input type="file" id="fileElem_2" name ="image" multiple accept="image/*" style="display:"  onchange="handleFiles_2(this.files)" /></div>
										
									
									<div id="fileList">
									  <p></p>
									</div>
									
								</div>
				        </form>
					</div>
					
					<!-- Post Create Box End-->

					<!-- Post Content
					
            ================================================= -->
            
					<c:forEach var="p" items="${seaList}">
						<div class="post-content" >
							<!-- <img src="http://placehold.it/1920x1280" alt="post-image"
								class="img-responsive post-image" /> -->
							<div class="post-container">
								<img src="getStudentPhoto/<c:out value='${p.user_id}'/>" alt="user"
									class="profile-photo-md pull-left" />
								<div class="post-detail">
									<div class="user-info">
										<h4>
											<a href="${pageContext.request.contextPath}/timeLine/<c:out value='${p.user_id}'/>" class="profile-link">${p.first_name} ${p.last_name}</a>
											<!-- <span class="following">following</span> -->
										</h4>
										<p class="text-muted">Published a photo about 3 mins ago</p>
									</div>
									<div class="line-divider"></div>
									<div class="post-text">
										<h5 style="color: black">
											${p.description} <i class="em em-anguished"></i> <i
												class="em em-anguished"></i> <i class="em em-anguished"></i>
										</h5>
										<img src="getPhoto/<c:out value='${p.id_post}'/>" alt=""
								class="img-responsive post-image" />
									</div>
									<div class="" style="margin-top: 5px">
										<a class="btn" onclick="changeStatus(${p.id_post})"><i class="fa fa-heart-o" style="font-size:24px; color: red"></i>
										</a>
										<a href="${pageContext.request.contextPath}/getUserLike/<c:out value='${p.id_post}'/>" ><span>${p.user_like}</span></a>
										<a class="btn"><i class="fa fa-comment-o" style="font-size:26px; color: black"></i>
										</a>
										<input type="button" id="myBtn" class="btn " value="${p.comment}" onclick="getListComment(${p.id_post})"/>
										
									</div>
									
									<div class="modal fade" id="myModal" role="dialog">
    									<div class="modal-dialog">
    										<div class="modal-content">
    											<div class="modal-header" style="padding:30px 40px;">
										          <button type="button" class="close" data-dismiss="modal">&times;</button>
										          <h3>List comment</h3>
										        </div>
										        <div class="modal-body" style="padding:30px 40px;">
										        	<c:forEach var="bid" items="${listComment}" varStatus="item" >
														<img src="getStudentPhoto/<c:out value='${bid.user_id}'/>" alt="" id="image"
													class="profile-photo-sm" />
														<h4>
															<a href="${pageContext.request.contextPath}/timeLine/<c:out value='${bid.user_id}'/>" class="profile-link">${bid.first_name} ${bid.last_name}</a>
															<!-- <span class="following">following</span> -->
														</h4>
														<span>${bid.value_comment}</span>
													</c:forEach>
										        </div>
    										</div>
    									</div>
    								</div>
											
									<!-- </div> -->
									<form name="doPostComment" id='doPostComment' modelAttribute="doPostComment"
									action="${doPostComment}" method="post" onsubmit="return validateform()">
										<input type="hidden" name="id_post" value="${p.id_post}" />
										<div class="post-comment">
											<div id="image">
												<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt="" id="image"
												class="profile-photo-sm" />
											</div> 
											<input type="text" id="value_comment" name="value_comment"
												class="form-control" placeholder="Post a comment">
											<input type="button" class="btn btn-primary " id="btn-postCmt"
											onclick="doPostCMT(${p.id_post})" value="Post" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- Newsfeed Common Side Bar Right
          ================================================= -->
				<div class="col-md-2 static">
					<div class="suggestions" id="sticky-sidebar">
						<h4 class="grey">Who to Follow</h4>
						<c:forEach var="m" items="${whoToFollow}">
							<div class="follow-user follow-${m.id}">
								<img src="getStudentPhoto/<c:out value='${m.id}'/>" alt=""
									class="profile-photo-sm pull-left" />
								<div>
									<h5>
										<a href="${pageContext.request.contextPath}/timeLine/${m.id}">${m.first_name} ${m.last_name}</a>
									</h5>
									<a href="#" class="change-text text-green"
									onclick="changeText(${m.id})">Follow</a>
								</div>
							</div>
						</c:forEach>
						<div class="text-right">
							<a href="${pageContext.request.contextPath}/getAllUser"><input type="button" class="btn btn-primary" 
										value="ALL" /></a>
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
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ&callback=initMap"></script>
	<script src="js/js/jquery-3.1.1.min.js"></script>
	<script src="js/js/bootstrap.min.js"></script>
	<script src="js/js/jquery.sticky-kit.min.js"></script>
	<script src="js/js/jquery.scrollbar.min.js"></script>
	<script src="js/js/script.js"></script>
	<!-- <script src="js/js/upImage.js"></script> -->
	<script src="js/js/upAvatar.js"></script>
</body>
</html>
