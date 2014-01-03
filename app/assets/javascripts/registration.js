
$(document).ready(function(){
	// TODO: some animation for the step by step registration	
	$('#btn-next').click(function(){
		/* field validation first */
		var email_valid = email_validation();
		var passsword_valid = password_validation();
		var agree_valid = terms_and_conditions_validation();
		if (!email_valid || !passsword_valid || !agree_valid){
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
		user_name_validation();
		graduation_year_validation();
		faculty_validation();
	})
});