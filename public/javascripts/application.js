// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	 View.initialize.apply(View);
var $alertdiv = $('<div id = "alertmsg"/>');
           
            $alertdiv.bind('click', function() {
                $(this).slideUp(200);
            });
            $(document.body).append($alertdiv);
            $("#alertmsg").slideDown("slow"); 
            setTimeout(function() { $("#alertmsg").slideUp(200) }, 3000); 
			});
			
			
		 	var View = {
			  initialize: function() {
			    /* Buttons */


			    /* User menu */
			    $(this.userMenu.selector)
			      .click(this.userMenu.click);

			    $(document.body)
			      .click(this.userMenu.removeFocus);


			  },








			  userMenu: {
			    click: function() {
			      $(this).toggleClass("active");
			    },
			    removeFocus: function(evt) {
			      var $target = $(evt.target);
			      if(!$target.closest("#user_menu").length) {
			        $(View.userMenu.selector).removeClass("active");
			      }
			    },
			    selector: "#user_menu"
			  }
			};