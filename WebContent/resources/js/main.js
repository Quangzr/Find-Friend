/* ------------------------------------ Click on login and Sign Up to  changue and view the effect
---------------------------------------
 */

/*function cambiar_login() {
	document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
	document.querySelector('.cont_form_login').style.display = "block";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_login').style.opacity = "1";
	}, 400);

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.display = "none";
	}, 200);
}*/

function cambiar_login() {
//	$('.cont_forms').removeAttr('class');
//	$(".cont_forms").attr('class', '');
	$('.cont_forms').removeClass( "cont_forms_active_sign_up" ).addClass("cont_forms_active_login");
	$('.cont_form_login').css("display", "block");
	$('.cont_form_sign_up').css("opacity", "0");

	setTimeout(function() {
		$('.cont_form_login').css("opacity", "1");
	}, 400);

	setTimeout(function() {
		$('.cont_form_sign_up').css("display", "none");
	}, 200);
}

function cambiar_sign_up(at) {
	document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
	document.querySelector('.cont_form_sign_up').style.display = "block";
	document.querySelector('.cont_form_login').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.opacity = "1";
	}, 100);

	setTimeout(function() {
		document.querySelector('.cont_form_login').style.display = "none";
	}, 400);

}

function ocultar_login_sign_up() {

	document.querySelector('.cont_forms').className = "cont_forms";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";
	document.querySelector('.cont_form_login').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.display = "none";
		document.querySelector('.cont_form_login').style.display = "none";
	}, 500);

}

function doneRegister(){
	setTimeout(function() {
		 cambiar_login()
	}, 400);
}
