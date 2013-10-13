$(document).ready(function(){
	$("#worked_here").click(function(){
		$(this).css("display","none");
		$("#interviewed_here").css("display","none");
		$("#worked_form").toggle();
	});

	$("#interviewed_here").click(function(){
		$(this).css("display","none");
		$("#interviewed_form").toggle();
		$("#worked_here").css("display","none");
	});
});