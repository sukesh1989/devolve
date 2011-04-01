/*   Copyright (c) 2010, Diaspora Inc.  This file is
*   licensed under the Affero General Public License version 3 or later.  See
*   the COPYRIGHT file.
*/
var View = {
  initialize: function() {
    /* Buttons */
  

    /* User menu */
    $(this.userMenu.selector)
      .click(this.userMenu.click);

    $(document.body)
      .click(this.userMenu.removeFocus)
      .click(this.reshareButton.removeFocus);


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

$(function() {
  /* Make sure this refers to View, not the document */
  View.initialize.apply(View);
});
