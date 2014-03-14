
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
