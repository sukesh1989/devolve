$(document).ready(function() {
   
      $("form").submit(function(){
	
        $("#html_new").fadeOut(200, function(){
          $('#logoname1').fadeIn( 250, function(){
            $("#spinner").fadeIn(300);
         
        });
      });
    });


});

