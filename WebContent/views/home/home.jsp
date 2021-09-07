<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link type="text/css" rel="stylesheet" href="css/home/css/main.css" />
<title>Home</title>
</head>
<body id="top">
	<%=session.getAttribute("id")%>
	<%=session.getAttribute("username")%>
	<!-- Header -->



	<header id="header">
	<div class="inner">
		<a href="#" class="image avatar"><img src="images/tutm.jpg" alt="" /></a>
		<h1>
			<strong>Trần Minh Tú 
			<a href="${pageContext.request.contextPath}/logout">
				<img src="images/home/logout.png" alt="" />
			</a>
			</strong> <br /> <strong>Nickname: </strong> zonBook
			<!-- <a href="http://html5up.net"></a> -->
			.
		</h1>
	</div>
	</header>

	<!-- Main -->
	<div id="main">

		<!-- One -->
		<!-- <section id="one"> <header class="major">
		<h2>
			Ipsum lorem dolor aliquam ante commodo<br /> magna sed accumsan arcu
			neque.
		</h2>
		</header>
		<p>Accumsan orci faucibus id eu lorem semper. Eu ac iaculis ac
			nunc nisi lorem vulputate lorem neque cubilia ac in adipiscing in
			curae lobortis tortor primis integer massa adipiscing id nisi
			accumsan pellentesque commodo blandit enim arcu non at amet id arcu
			magna. Accumsan orci faucibus id eu lorem semper nunc nisi lorem
			vulputate lorem neque cubilia.</p>
		<ul class="actions">
			<li><a href="#" class="button">Learn More</a></li>
		</ul>
		</section> -->

		<!-- Two -->
		<section id="two">
		<h2>Product</h2>
		<div class="row">
			<article class="6u 12u$(xsmall) work-item"> <a
				href="images/home/fulls/01.jpg" class="image fit thumb"><img
				src="images/home/thumbs/01.jpg" alt="" /></a>
			<h3>Magna sed consequat tempus</h3>
			<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
			</article>
			<article class="6u$ 12u$(xsmall) work-item"> <a
				href="images/home/fulls/02.jpg" class="image fit thumb"><img
				src="images/home/thumbs/02.jpg" alt="" /></a>
			<h3>Ultricies lacinia interdum</h3>
			<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
			</article>
			<article class="6u 12u$(xsmall) work-item"> <a
				href="images/home/fulls/03.jpg" class="image fit thumb"><img
				src="images/home/thumbs/03.jpg" alt="" /></a>
			<h3>Tortor metus commodo</h3>
			<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
			</article>
			<article class="6u$ 12u$(xsmall) work-item"> <a
				href="images/home/fulls/04.jpg" class="image fit thumb"><img
				src="images/home/thumbs/04.jpg" alt="" /></a>
			<h3>Quam neque phasellus</h3>
			<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
			</article>
			<article class="6u 12u$(xsmall) work-item"> <a
				href="images/home/fulls/05.jpg" class="image fit thumb"><img
				src="images/home/thumbs/05.jpg" alt="" /></a>
			<h3>Nunc enim commodo aliquet</h3>
			<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
			</article>
			<article class="6u$ 12u$(xsmall) work-item"> <a
				href="images/home/fulls/06.jpg" class="image fit thumb"><img
				src="images/home/thumbs/06.jpg" alt="" /></a>
			<h3>Risus ornare lacinia</h3>
			<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
			</article>
		</div>
		<ul class="actions">
			<li><a href="#" class="button">Full Portfolio</a></li>
		</ul>
		</section>

		<!-- Three -->
		<section id="three">
		<h2>Get In Touch</h2>
		<p>Accumsan pellentesque commodo blandit enim arcu non at amet id
			arcu magna. Accumsan orci faucibus id eu lorem semper nunc nisi lorem
			vulputate lorem neque lorem ipsum dolor.</p>
		<div class="row">
			<div class="8u 12u$(small)">
				<form method="post" action="#">
					<div class="row uniform 50%">
						<div class="6u 12u$(xsmall)">
							<input type="text" name="name" id="name" placeholder="Name" />
						</div>
						<div class="6u$ 12u$(xsmall)">
							<input type="email" name="email" id="email" placeholder="Email" />
						</div>
						<div class="12u$">
							<textarea name="message" id="message" placeholder="Message"
								rows="4"></textarea>
						</div>
					</div>
				</form>
				<ul class="actions">
					<li><input type="submit" value="Send Message" /></li>
				</ul>
			</div>
			<div class="4u$ 12u$(small)">
				<ul class="labeled-icons">
					<li>
						<h3 class="icon fa-home">
							<span class="label">Address</span>
						</h3> 1234 Somewhere Rd.<br /> Nashville, TN 00000<br /> United
						States
					</li>
					<li>
						<h3 class="icon fa-mobile">
							<span class="label">Phone</span>
						</h3> 000-000-0000
					</li>
					<li>
						<h3 class="icon fa-envelope-o">
							<span class="label">Email</span>
						</h3> <a href="#">hello@untitled.tld</a>
					</li>
				</ul>
			</div>
		</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
				<li><a href="#" class="icon fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span
						class="label">Email</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
		</footer>

		<!-- Scripts -->
		<script src="js/home/jquery.min.js"></script>
		<script src="js/home/jquery.poptrox.min.js"></script>
		<script src="js/home/skel.min.js"></script>
		<script src="js/home/util.js"></script>
		<script src="js/home/main.js"></script>
</body>
</html>