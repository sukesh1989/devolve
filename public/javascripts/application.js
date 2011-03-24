// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(function() {
 
      $("form").submit(function(){
        $(this).fadeOut(200, function(){
          $('#logoname1').fadeIn( 250, function(){
            $("#spinner").fadeIn(300);
         
        });
      });
    });


});