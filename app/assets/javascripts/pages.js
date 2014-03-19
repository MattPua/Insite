
//Resizeable Circle for Company Profile Page
$(document).ready(function() {    

    // $('#circle').css("border-radius",)
    // $('#circle').width($('#circle').height());
    // $(window).resize(
    //     function(){                
    //     	$('#circle').height($(window).height()/4); 
    //         $('#circle').width($('#circle').height());

    //         var windowHeight = $(window).height()/12;
    //         $('#info_left, #info_right').css('margin-top',windowHeight);
    //     }
    // );
    // $(window).resize();

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
	format_date();
	});
	
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
// Show Interview 
$(document).ready(function(){
	var x = $('#interview_content #status #status_content');
	if (x!=null){
		var value = x.attr('val');
		if (value==1)
		{
			var txtNode=document.createTextNode("In Progress");
			document.getElementById("status_content").appendChild(txtNode);
		}
		else if (value==2)
		{
			var txtNode=document.createTextNode("Finished");
			document.getElementById("status_content").appendChild(txtNode);
		}
	}
});

// User edit page validation
$(document).ready(function(){
	$('.btn-submit').click(function(){
		var email_valid = email_validation();
		var name_valid = user_name_validation();
		var year_valid = graduation_year_validation();
		var faculty_valid = faculty_validation();
		var program_valid = program_validation();
	
		if (!email_valid || !name_valid || !year_valid || !faculty_valid || !program_valid){
			return false;
		}
		return true;
		
	});
});

// Debug Dump
$(document).ready(function(){
	$(document).keypress(function(event){
		if (event.which==113){
			$('.debug_dump').css("visibility","hidden");
		}
		else if (event.which==81){
			$('.debug_dump').css("visibility","show");
		}
		// console.log("handler:"+ event.which);
	    
	 });
});


// Used to format interview date value when editing interviews
$(document).ready(function(){
	var x = $('.datepicker');
	var y = x.val();
	if (y!=null || y!=''){
		var w = moment(y).format("M/D/YYYY");
		x.val(w);

	}
});

// Flash Messages 
// $(document).ready(function(){
// 	$(document).find("#flash_notice").css("width",500);
// });

$(document).ready(function(){
	 $('#flash_messages, #error_explanation').delay(2500).fadeOut('slow');
});
