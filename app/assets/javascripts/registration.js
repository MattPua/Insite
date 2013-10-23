
$(document).ready(function(){
	// TODO: some animation for the step by step registration	
	$('#btn-next').click(function(){
		/* field validation first */
		var x = $('#user_email').val();
		if (x==null || x==""){
			$('#user_email').parent().addClass('has-error');
			$('#user_email').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Email cannot be empty </div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}
		var atpos=x.indexOf("@");
		var dotpos=x.lastIndexOf(".");
		if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
 		{
  			$('#user_email').parent().addClass('has-error');
  			$('#user_email').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>   Email is invalid</div>');
  			return false;
  		}
		
		x = $('#user_password').val();
		var y = $('#user_password_confirmation').val();
		if (x==null || x==""){
			$('#user_password').parent().addClass('has-error');
			$('#user_password').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Password cannot be empty </div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}

		if (x.length < 8){
			$('#user_password').parent().addClass('has-error');
			$('#user_password').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Password is too short (minimum is 8 characters)</div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}

		if (y==null || y==""){
			$('#user_password_confirmation').parent().addClass('has-error');
			$('#user_password_confirmation').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Please enter your password again </div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}

		if(x !== y){
			$('#user_password').parent().addClass('has-error');
			$('#user_password_confirmation').parent().addClass('has-error');
			$('#user_password_confirmation').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>   Confirmation password does not match</div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}

		if (!$('#user_registerterms').is(':checked')){
			$('#user_registerterms').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>   Please agree to the terms and conditions</div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}

		$('#registration-1').hide();
		$('#btn-next').hide();
		$('table#steps > tbody > tr:first-child > td:first-child > div.circle').css('background-color','white');
		$('table#steps > tbody > tr:nth-child(2) > td:first-child > div.circle').css('background-color','#faa732');
		$('#registration-2').show();
		$('#btn-previous').show();
		$('#btn-submit').show();

	});

	

	$('#btn-previous').click(function(){
		$('#registration-2').hide();
		$('#btn-previous').hide();
		$('#btn-submit').hide();
		$('#registration-1').show();
		$('#btn-next').show();
		
	})

	$('#btn-submit').click(function(){
		/* field validation first */
		var x = $('#user_name').val();
		if (x==null || x==""){
			$('#user_name').parent().addClass('has-error');
			$('#user_name').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Name cannot be empty </div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}
		/* make sure the user at least have a first and last anme */
		var spcpos=x.indexOf(" ");
		var specialchartest = /^[A-Za-z0-9 ]{3,20}$/;
		if (spcpos<1 || spcpos+2>=x.length|| !specialchartest.test(x)){
			$('#user_name').parent().addClass('has-error');
			$('#user_name').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Name entered must be first and last name</div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}

		/* make sure the user at least have a first and last anme */
		x = $('#user_year').val();
		if (x==null || x==""){
			$('#user_year').parent().addClass('has-error');
			$('#user_year').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Graduation year cannot be empty</div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}
		var yearint = parseInt(x);
		if (x<2000||x>2020){
			$('#user_year').parent().addClass('has-error');
			$('#user_year').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Please enter a valid graduating year</div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}
		/* make sure the user at least have a first and last anme */
		x = $('#user_faculty').val();
		if (x==null || x==""){
			$('#user_faculty').parent().addClass('has-error');
			$('#user_faculty').before( '<div class=\"error-msg\"><span class=\"glyphicon glyphicon-warning-sign\"></span>  Faculty cannot be empty</div>');
			$('.error-msg').delay(3000).fadeOut();
  			return false;
		}

	})
});