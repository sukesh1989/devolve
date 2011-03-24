// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready( function(){
   $("form").submit(function(){
     $("#html_new").fadeOut(200, function(){
       $('#logoname1').fadeIn({
         'margin-top': '+=80'
       }, 250, function(){
         $("#spinner").fadeIn(300);
       });
     });
   });
 });
