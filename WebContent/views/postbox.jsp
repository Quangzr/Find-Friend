<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/css/style.css" />
<link rel="stylesheet" href="css/css/ionicons.min.css" />
<link rel="stylesheet" href="css/css/font-awesome.min.css" />
<link href="css/css/emoji.css" rel="stylesheet">

<script type="text/javascript">

</script>
</head>
<body>
	<!-- Post Create Box
            ================================================= -->
	<div class="create-post">
		<div class="row">
			<div class="col-md-7 col-sm-7">
				<div class="form-group">
					<img src="images/tutm.jpg" alt="" class="profile-photo-md" />
					<textarea name="postContent" id="postContent" cols="30" rows="1"
						class="form-control" placeholder="Write what you wish"
						onclick="txtClick()"></textarea>
				</div>

			</div>
			<div class="col-md-5 col-sm-5">
				<div class="tools">
					<ul class="publishing-tools list-inline">
						<li><a href="#"><i><img
									src="images/icons/compose.png"></i> </a></li>
						<li><a href="#" id="btnImageUpload"><i><img
									src="images/icons/image.png"></i> </a></li>
						<input type="file" id="FileUpload" style="display: none" />
						<li><a href="#"><i><img src="images/icons/video.png"></i>
						</a></li>
					</ul>
					<button class="btn btn-primary pull-right">Publish</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Post Create Box End-->
</body>
</html>