/* This is all the function used for user field vaidation */
var email_validation = function () {
	var x = $('#user_email').val();
	if (x==null || x==""){
		$('#user_email').parent().addClass('has-error');
		$('#user_email').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Email cannot be empty </div>');
		return false;
	}
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
		$('#user_email').parent().addClass('has-error');
		$('#user_email').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>   Email is invalid</div>');
		return false;
	}
	return true;
}

var password_validation = function(){
	var x = $('#user_password').val();
	var y = $('#user_password_confirmation').val();
	if (x==null || x==""){
		$('#user_password').parent().addClass('has-error');
		$('#user_password').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Password cannot be empty </div>');
		return false;
	}

	if (x.length < 8){
		$('#user_password').parent().addClass('has-error');
		$('#user_password').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Password is too short (minimum is 8 characters)</div>');
		return false;
	}

	if (y==null || y==""){
		$('#user_password_confirmation').parent().addClass('has-error');
		$('#user_password_confirmation').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Please enter your password again </div>');
		return false;
	}

	if(x !== y){
		$('#user_password').parent().addClass('has-error');
		$('#user_password_confirmation').parent().addClass('has-error');
		$('#user_password_confirmation').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>   Confirmation password does not match</div>');
		return false;
	}
	return true;
}

var terms_and_conditions_validation = function(){
	if (!$('#user_registerterms').is(':checked')){
		$('#user_registerterms').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>   Please agree to the terms and conditions</div>');
			$('.error-msg').delay(2500).fadeOut('slow');
		return false;
	}

	return true;
}

var user_name_validation = function() {
	var x = $('#user_name').val();
	if (x==null || x==""){
		$('#user_name').parent().addClass('has-error');
		$('#user_name').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Name cannot be empty </div>');
		$('.error-msg').delay(3000).fadeOut('slow');
		return false;
	}
	/* make sure the user at least have a first and last anme */
	var spcpos=x.indexOf(" ");
	var specialchartest = /^[A-Za-z0-9 ]{3,20}$/;
	if (spcpos<1 || spcpos+2>=x.length|| !specialchartest.test(x)){
		$('#user_name').parent().addClass('has-error');
		$('#user_name').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Name entered must be first and last name</div>');
		$('.error-msg').delay(3000).fadeOut('slow');
		return false;
	}
	return true;
}

var graduation_year_validation = function() {
	var x = $('#user_year').val();
	if (x==null || x==""){
		$('#user_year').parent().addClass('has-error');
		$('#user_year').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Graduation year cannot be empty</div>');
		$('.error-msg').delay(3000).fadeOut('slow');
		return false;
	}
	var yearint = parseInt(x);
	if (x<1990||x>2030){
		$('#user_year').parent().addClass('has-error');
		$('#user_year').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Please enter a valid graduating year</div>');
		$('.error-msg').delay(3000).fadeOut('slow');
		return false;
	}
	return true;
}

var faculty_validation = function() {
	var x = $('#user_faculty').val();
	if (x==null || x==""){
		$('#user_faculty').parent().addClass('has-error');
		$('#user_faculty').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Faculty cannot be empty</div>');
		$('.error-msg').delay(3000).fadeOut('slow');
		return false;
	}
	return true;

}
var program_validation = function() {
	var x = $('#user_program').val();
	if (x==null || x==""){
		$('#user_program').parent().addClass('has-error');
		$('#user_program').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Program cannot be empty</div>');
		$('.error-msg').delay(3000).fadeOut('slow');
		return false;
	}
	return true;
}

var company_validation = function(){
	var x = $('#interview_company_name').val();
	if (x==null || x==""){
		$('#interview_company_name').parent().addClass('has-error');
		$('#interview_company_name').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Company Name cannot be empty</div>');
		$('.error-msg').delay(3000).fadeOut('slow');
		return false;
	}
	return true;
}

var position_validation = function(){
	var x = $('#interview_position').val();
	if (x==null || x==""){
		$('#interview_position').parent().addClass('has-error');
		$('#interview_position').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Position cannot be empty</div>');
		$('.error-msg').delay(3000).fadeOut('slow');
		return false;

	}
	return true;
}

var format_date = function(){
	var date = $('#interview_date').val();
	if (x!=null){
		var x =moment(date).format("M/D/YYYY");
		//var x = moment(date).calendar();
		$('#interview_date').attr("value",x);
		return true;
	}
	return false;

}