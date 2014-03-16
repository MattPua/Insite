
//Resizeable Circle for Company Profile Page
$(document).ready(function() {    
    $('#circle').width($('#circle').height());
    $(window).resize(
        function(){                
        	$('#circle').height($(window).height()/4); 
            $('#circle').width($('#circle').height());

            var windowHeight = $(window).height()/12;
            $('#info_left, #info_right').css('margin-top',windowHeight);
        }
    );
    $(window).resize();

});

$(function() {
  $('.datepicker').datepicker();
});


// Validations for Interviews on Create Interview Page
$(document).ready(function(){
	// TODO: some animation for the step by step registration	
	$('#btn-submit-interview').click(function(){
		/* field validation first */
		var company_valid = company_validation();
		var position_valid = position_validation();
		if (!company_valid || !position_valid){
			return false;
		}
	});
	format_date();
});

// Filtering for List interviews page
$(document).ready(function(){
	var dropdown= document.getElementById('interview_select');

	if (dropdown!=null)
	{
		var dropdown_index = document.getElementById('interview_select').selectedIndex;	
		if (dropdown_index==0)
		{
			$('.interview_show').hide();
			$('.status_1').show();
		}
		else if(dropdown_index==1)
		{
			$('.interview_show').hide();
			$('.status_2').show();
		}
		else
		{
			$('.interview_show').show();
		}
	}
	$('#interview_select').click(function(){
		if (dropdown!=null){
			dropdown_index = document.getElementById('interview_select').selectedIndex;
			if (dropdown_index==0)
			{
				$('.interview_show').hide();
				$('.status_1').show();
			}
			else if(dropdown_index==1)
			{
				$('.interview_show').hide();
				$('.status_2').show();
			}
			else
			{
				$('.interview_show').show();
			}
		}
		
		
	});
});
