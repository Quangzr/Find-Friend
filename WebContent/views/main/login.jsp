<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<div class="cotn_principal">
		<div class="cont_centrar">
			<div class="cont_login">
				<div class="cont_info_log_sign_up">
					<div class="col_md_login">
						<div class="cont_ba_opcitiy">

							<h2>LOGIN</h2>
							<p>Everything has to start somewhere</p>
							<p>
								Waves start from the wind <br /> Where does the wind start <br />
								From where it shelves
							</p>
							<button class="btn_login" onclick="cambiar_login()">LOGIN</button>
						</div>
					</div>
					<div class="col_md_sign_up">
						<div class="cont_ba_opcitiy">
							<h2>SIGN UP</h2>
							<p>Mọi thứ bắt đầu từ đâu đó</p>
							<p>
								Sóng bắt đầu từ gió <br /> Gió bắt đầu từ đâu <br /> Từ đâu
								thì kệ nó
							</p>

							<button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN
								UP</button>
						</div>
					</div>
				</div>
				<div class="cont_back_info">
					<div class="cont_img_back_grey">
						<img
							src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"
							alt="" />
					</div>
				</div>
				<div class="cont_forms">
					<div class="cont_img_back_">
						<img
							src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d"
							alt="" />
					</div>
					<form action="${pageContext.request.contextPath}/dologin"
						method="post">
						<div class="cont_form_login">
							<a href="#" onclick="ocultar_login_sign_up()"><i
								class="material-icons">&#xE5C4;</i></a>
							<h2>LOGIN</h2>
							<input type="text" name="username" placeholder="Username" /> 
							<input type="password" name="password" placeholder="Password" />
							<button type="submit" class="btn_login">LOGIN</button>
						</div>
					</form>
					
					<form action="${pageContext.request.contextPath}/doregister" method="post">
						<div class="cont_form_sign_up">
							<a href="#" onclick="ocultar_login_sign_up()">
								<i class="material-icons">&#xE5C4;</i>
							</a>
							<h2>SIGN UP</h2>
								<input type="text" name="email" placeholder="Email" /> 
								<input type="text" name="username" placeholder="Username" />
								<input type="password" name="password" placeholder="Password" /> 
								<input type="text" name="phone" placeholder="Phone number" />
							<button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>