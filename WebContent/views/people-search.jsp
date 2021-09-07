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
<!-- link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	
    $(function () {
        var fileupload = $("#FileUpload");
        var button = $("#btnImageUpload");
        button.click(function () {
            fileupload.click();
        });
        fileupload.change(function () {
            var fileName = $(this).val().split('\\')[$(this).val().split('\\').length - 1];
            console.log(fileName);
        });
    });
	
    function loadForm() {
    	if ($("#deleted").val() == 0) {
    		$('#btn-delete').attr('disabled', false);
    		$('#btn-active').attr('disabled', true);
    		
    	} else {
    		$('#btn-delete').attr('disabled', true);
    		$('#btn-active').attr('disabled', false);
    	}
        return;
    }
    function doDelete() {
    	var ac = confirm("Bạn muốn xóa tài khoản này ?");
	   	if(ac == true) {
	   		document.formList.target="_self";
		   	document.formList.method="post";
		   	document.formList.submit();
	   	}
    }
    
	function doFollow(id) {
		
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
 		
 		/* location.reload() */
    }
    
	function doUnFollow(id) {
		
 		$.ajax({
			type: "GET",
			url: '${pageContext.request.contextPath}/dounfollow/' + id,
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Follow Successful!');
				console.log(data1);
			},
			
		});
 		
 		/* location.reload() */
    }
    
    function changeText(id) {
		
 		$.ajax({
			url: '${pageContext.request.contextPath}/doGetValue/' + id,
			dataType: "json",
			crossDomain: true,
			success: function(data1){
				console.log('Successful!');
				console.log(data1);
			},
			
		});
 		
 		location.reload();
    }
</script>

<style type="text/css">

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
						<img src="getStudentPhoto/<c:out value='${currentUser.id}'/>" alt="user" class="profile-photo" />
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
							 <a><i class="fa fa-calendar" style="font-size:18px"></i></a>
					        <div><span>${currentUser.dateofbirth}</span></div>
						</li>
						<li class="">
							<i class="fa fa-envelope" style="font-size:18px"></i>
					        <div><span>${currentUser.email}</span></div>
						</li>
						<li class="">
							<a href="#">
					          <i class="fa fa-home" style="font-size:25px"></i>
					        </a>
					        <div><span>${currentUser.city}</span></div>
						</li>
						<li class="">
							<a href="#">
					          <i class="fa fa-user-circle-o" style="font-size:22px"></i>
					        </a>
					        <div><span>${currentUser.gender}</span></div>
						</li>
					</ul>
					<ul class="nav-news-feed">
						<li class="newsfeed-menu"><i class="icon"><img alt="newsfeed" src="images/icons/newfeed.png"></i>
							<div>
								<a href="${pageContext.request.contextPath}/myTimeLine">My profile page</a>
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
					</ul>
				</div>

				<div class="col-md-9">
					<h2 style="text-align: center"> List User
					</h2>
					<h4>*************</h4>
					<form:form  id="formList" name="formList"  method="post" modelAttribute="formList" acceptCharset="utf-8" class="form-cus" action="${deleteUrl }">
						<table id="follow-table" class="table table-striped">
							<tr>
								<th length="30px">STT</th>
								<th> </th>
								<th size="30">Name</th>
								<th> </th>
								<th></th>
								<!-- <th>Active</th> -->
							</tr>
							<c:choose>
								<c:when test="${ not empty listUserSearchFollowing }">
									<c:forEach var="bid" items="${listUserSearchFollowing}" varStatus="item" >
										<tr>
											<td>${item.index+1}</td>
											<td><img src="getStudentPhoto/<c:out value='${bid.id}'/>" alt="user" class="profile-photo" /></td>
											<td><a href="${pageContext.request.contextPath}/timeLine/<c:out value='${bid.id}'/>" class="" onclick="changeText(${bid.id})">${bid.first_name } ${bid.last_name }</a></td>
											<td>
												<input id="id" name="btn-delete" class="btn btn-danger" type="button" value="UnFollow" onclick="doUnFollow(${bid.id})"/>
												<%-- <input type="hidden" id="id" onclick="doFollow();" value="${bid.id }" /> --%>
											</td>
											<!-- <td>
												<input id="btn-active" type="button" class="btn btn-danger" value="Unfollow" onclick="doUnfollow()" disabled />
												
											</td> -->
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>						 
							</table>
					</form:form>	
					<h4>*************</h4>
					<form:form  id="formList" name="formList"  method="post" modelAttribute="formList" acceptCharset="utf-8" class="form-cus" action="${deleteUrl }">
						<table id="follow-table" class="table table-striped">
							<tr>
								<th length="30px">STT</th>
								<th> </th>
								<th size="30">Name</th>
								<th> </th>
								<th></th>
								<!-- <th>Active</th> -->
							</tr>
							<c:choose>
								<c:when test="${ not empty listUserSearch }">
									<c:forEach var="bid" items="${listUserSearch}" varStatus="item" >
										<tr>
											<td>${item.index+1}</td>
											<td><img src="getStudentPhoto/<c:out value='${bid.id}'/>" alt="user" class="profile-photo" /></td>
											<td><a href="${pageContext.request.contextPath}/timeLine/<c:out value='${bid.id}'/>" class="" onclick="changeText(${bid.id})">${bid.first_name } ${bid.last_name }</a></td>
											<td>
												<input id="id" name="btn-delete" class="btn btn-success" type="button" value="Follow" onclick="doFollow(${bid.id})"/>
												<%-- <input type="hidden" id="id" onclick="doFollow();" value="${bid.id }" /> --%>
											</td>
											<!-- <td>
												<input id="btn-active" type="button" class="btn btn-danger" value="Unfollow" onclick="doUnfollow()" disabled />
												
											</td> -->
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
