// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
var $alertdiv = $('<div id = "alertmsg"/>');
           
            $alertdiv.bind('click', function() {
                $(this).slideUp(200);
            });
            $(document.body).append($alertdiv);
            $("#alertmsg").slideDown("slow"); 
            setTimeout(function() { $("#alertmsg").slideUp(200) }, 3000); 
			});