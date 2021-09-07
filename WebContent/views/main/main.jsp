<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="css/main/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
	<%-- var name = '<%= session.getAttribute("id") %>';
	alert(name);  --%>
	function changeText() {
		var a = $('.hide').text();
		console.log(a);
		if(a == "Follow"){
			$('.hide').html("Unfollow");
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
			$('.hide').html("Follow");
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
		}
	}
	
	$(document).mousedown(function (e) {
	    var container = $("body-content");

	    if (container.has(e.target).length === 0) {
	    	$('#textbox').attr("rows","2");
	    	$('.post-box').css({"width":"588px", "height":"95px"});
	    }
	});
	
	function swap(){
		$('#textbox').attr("rows","5");
		$('.post-box').css({"width":"588px", "height":"160px"});
	}
	
	function postNew(){
		
	}
	
	
</script>
<title>AmaFace</title>
</head>
<body>
	<%  %>
	<%@ include file="header.jsp"%>
	<div class="body-content">
		<div class="page-container">
			<div class="dashboard-left">
				<div class="dashboard-profile">
					<a class="dashboard-cover"><img src="images/cover-mini.png"></a>
					<div class="dashboard-content">
						<div class="user-name">
							<div class="avatar"><img src="images/tutm.jpg"></div>
							<h3>
								<a href="#1">Tran Minh Tu</a> <a
									class"follow" onclick="changeText()" href="javascript:void(0)"><div
										class="hide">Follow</div></a>
							</h3>
						</div>
						<div class="follow-infor">
							<table class="table-follow">
								<tr>
									<th>Posts</th>
									<th>Followers</th>
									<th>Following</th>
								</tr>
								<tr>
									<td>${currentUser.posts}</td>
									<td>${currentUser.followers }</td>
									<td>${currentUser.followings }</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="main">
				<div class="post-box">
					<img class="post-box-img" src="https://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png" alt="">
					<textarea class="editor" rows="2" cols="68" id="textbox" onclick="swap()">Hello</textarea>
					<button class="button-post" onclick="postNew()">Post</button>
				</div>
				<div class="main-content">
					<c:forEach var="i" items="${arr}">
						<div class="post-content">
							<div class="post-username">
								<img
									src="https://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png">
								<h3>Tran Minh Tu</h3>

								<p>Last year:</p>
							</div>
							<div class="post-description">
								<p>Product</p>
							</div>
							<div class="post-img"></div>
							<div class="like-button"></div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="dashboard-right"></div>
		</div>
	</div>

</body>
</html>
