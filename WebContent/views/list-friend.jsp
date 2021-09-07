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
	   		document.getElementById("formPost").target="_self";
	   		document.getElementById("formPost").method="post";
	   		document.getElementById("formPost").submit();
	   		
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
		<div class="">

			<%@ include file="timeline-cover.jsp"%>
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-8">
					<h2 style="text-align: center"> List Friends
					</h2>
					<form:form  id="formList" name="formList" modelAttribute="formList" acceptCharset="utf-8" class="form-cus" action="${listUrl }">
						
						<table id="follow-table" class="table table-striped">
							<tr>
								<th length="30px">STT</th>
								<th></th>
								<th size="30">Name</th>
								<th>Email</th>
								<th></th>
							</tr>
							<c:choose>
								<c:when test="${ not empty listUserFollowing }">
									<c:forEach var="bid" items="${listUserFollowing}" varStatus="item" >
										<tr>
											<td>${item.index+1}</td>
											<td><img src="getStudentPhoto/<c:out value='${bid.id_user_follower}'/>" alt="user" class="profile-photo" /></td>
											<td>${bid.first_name } ${bid.last_name }</td>
											<td>${bid.mail }</td>
											<td class='tdbc'>
												<a href="${pageContext.request.contextPath}/doView/${bid.id_user_follower}">
													<%-- <input type="hidden" name="id_user_follower" value="${bid.id_user_follower}" />  --%>
													<input  type="button" class="btn btn-success" value="View"/>
												</a>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="10" class="">Không có dữ liệu tìm kiếm</td>
									</tr>
								</c:otherwise>
							</c:choose>						 
							</table>
					</form:form>
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
