$(function() {
  $('.datepicker').datepicker();
});


// Validations for Interviews on Create Interview Page
$(document).ready(function(){
	// TODO: some animation for the step by step registration	
	var x =
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
	var dropdownDate= document.getElementById('interview_date_select');
	var dropdownType= document.getElementById('interview_type_select');
	if (dropdownDate!=null||dropdownType!=null)
	{
 		$('.interview_show').hide();
 		$('.status_1').show();
	}

	$('#interview_date_select').click(function(){
	 	interview_filter();
	});

	$('#interview_type_select').click(function(){
		interview_filter();
	});
});



// Show Interview 
$(document).ready(function(){
	var x = $('#status_content');
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
	if (y!=null && y!=''){
		 var w = moment(y).format("M/D/YYYY");
		 x.val(w);
	}
});
// Formatting Date on Main Page using Moment
$(document).ready(function(){
	var x =document.getElementsByClassName("upcoming-day");
	// var w = $('.upcoming-day');
	for (i=0; i<=2; i++){
	var y = x[i].getAttribute("date");
	x[i].innerHTML=moment(y).calendar();
	}
});
// Customizing format for moment calendar time
moment.lang('en', {
    calendar : {
        lastDay : '[Yesterday]',
        sameDay : '[Today]',
        nextDay : '[Tomorrow]',
        lastWeek : '[last] dddd',
        nextWeek : 'dddd',
        sameElse : 'L'
    }
});

$(document).ready(function(){
	 $('#flash_messages, #error_explanation').delay(2500).fadeOut('slow');
});


// Used to filter interviews on show interviews page
var interview_filter = function(){
		var dropdown_index_date = document.getElementById('interview_date_select').selectedIndex;
		var dropdown_index_type = document.getElementById('interview_type_select').selectedIndex;
		$('.interview_show').hide();	//hide all the interviews first
		$('.interview_show').removeClass("showType showDate");
		var type_child = document.getElementById('interview_type_select').childNodes[dropdown_index_type*2+1];
		var type = type_child.value		// Will return the type of interview i.e. PEY, Full Time, Summer
		var date_child = document.getElementById('interview_date_select').childNodes[dropdown_index_date*2+1];
		var date=date_child.value
		if (type=="alltype")
		{
			$(".interview_show").addClass("showType");
		}
		else{
			$("." + type).addClass("showType");			// Show only interviews that matched the select type value
		}
		if (date=="alldate")
		{
			$(".interview_show").addClass("showDate");
		}
		else{
			$(".status_"+date).addClass("showDate");
		}
		$('.showDate.showType').show();
		return true;
}

$(document).ready(function(){
	var x = $('.upcoming-interview');
	if (x!=null && x!='')
	{
		x = document.getElementById('upcoming-title').innerHTML = "Next Interview";
	}
});