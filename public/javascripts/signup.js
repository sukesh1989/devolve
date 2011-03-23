$(document).ready(function() {

	$("input[id='user_password']").passwordValidate();
       // Setting up the suggestion box
       $("#user_password").inputTip({
           // Text displayed when the input passes the validation
           goodText: "OK!",
           // Text displayed when the input doesn't pass the validation
           badText: "Too short!",
           // Text displayed as a tip when the input field is focused
           tipText: "8 characters or more('Be Tricky')",
           
           validateText: function(inputValue, callback) {
               // Checking if the input field contains text.
               if (inputValue.length > 8) callback(1);
               else callback(0);
           },
           // True if the validation should be performed on every key/up event (false by default)
           validateInRealTime: false
       });

       // Setting up the suggestion box
       $("#user_email").inputTip({
           // Text displayed when the input passes the validation
           goodText: "Nice email!",
           // Text displayed when the input doesn't pass the validation
           badText: "Ouch, it doesn't look like an email!",
           // Text displayed as a tip when the input field is focused
           tipText: "we'll send you a confirmation",
           /* Function called to validate the input. It should fire "callback" with the following parameters
           *  First parameter:
           *  - 0: validation failed
           *  - 1: validation succeeded
           *  - 2: show the tip text
           * Second parameter: optional text to display instead of the standard text */
           validateText: function(inputValue, callback) {
           // Checking if the input field contains text.

               var emailRegexp = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
               if (emailRegexp.test(inputValue)) callback(1);
               else callback(0);
           },
           // True if the validation should be performed on every key/up event (false by default)
           validateInRealTime: false
       });
	$("#user_password_confirmation").inputTip({
          // Text displayed when the input passes the validation
   
	           // Text displayed when the input passes the validation
	           goodText: "OK!",
	           // Text displayed when the input doesn't pass the validation
	           badText: "Too short!",
	           // Text displayed as a tip when the input field is focused
	           tipText: "Enter Password again",

	           validateText: function(inputValue, callback) {
	               // Checking if the input field contains text.
	               if (inputValue.length > 8) callback(1);
	               else callback(0);
	           },
          // True if the validation should be performed on every key/up event (false by default)
          validateInRealTime: false
      });
  });



  




	
//
//passwordstrength.js

/* Intelligent Web NameSpace */ 
var IW = IW || {}; 
 
/** 
 * Password validator logic 
 */ 
(function(IW) { 
 
    var secondsInADay = 86400; 
 
    function PasswordValidator() { 
    } 
 
    PasswordValidator.prototype.passwordLifeTimeInDays = 365; 
 
    /** 
     * An estimate of how many attempts could be made per second to guess a password 
     */ 
    PasswordValidator.prototype.passwordAttemptsPerSecond = 500; 
 
    /** 
     * An array of regular expressions to match against the password. Each is associated 
     * with the number of unique characters that each expression can match. 
     * @param password 
     */ 
    PasswordValidator.prototype.expressions = [ 
        { 
            regex : /[A-Z]+/, 
            uniqueChars : 26 
        }, 
        { 
            regex : /[a-z]+/, 
            uniqueChars : 26 
        }, 
        { 
            regex : /[0-9]+/, 
            uniqueChars : 10 
        }, 
        { 
            regex : /[!\?.;,\\@$£#*()%~<>{}\[\]]+/, 
            uniqueChars : 17 
        } 
    ]; 
 
    /** 
     * Checks the supplied password 
     * @param {String} password 
     * @return The predicted lifetime of the password, as a percentage of the defined password lifetime. 
     */ 
    PasswordValidator.prototype.checkPassword = function(password) { 
 
        var 
                expressions = this.expressions, 
                i, 
                l = expressions.length, 
                expression, 
                possibilitiesPerLetterInPassword = 0; 
 
        for (i = 0; i < l; i++) { 
 
            expression = expressions[i]; 
 
            if (expression.regex.exec(password)) { 
                possibilitiesPerLetterInPassword += expression.uniqueChars; 
            } 
 
        } 
 
        var 
                totalCombinations = Math.pow(possibilitiesPerLetterInPassword, password.length), 
            // how long, on average, it would take to crack this (@ 200 attempts per second) 
                crackTime = ((totalCombinations / this.passwordAttemptsPerSecond) / 2) / secondsInADay, 
            // how close is the time to the projected time? 
                percentage = crackTime / this.passwordLifeTimeInDays; 
 
        return Math.min(Math.max(password.length * 5, percentage * 100), 100); 
 
    }; 
 
    IW.PasswordValidator = new PasswordValidator(); 
 
})(IW); 
 
/** 
 * jQuery plugin which allows you to add password validation to any 
 * form element. 
 */ 
(function(IW, jQuery) { 
 
    function updatePassword() { 
 	
        var 
                percentage = IW.PasswordValidator.checkPassword(this.val()), 
                progressBar = this.parent().find(".passwordStrengthBar div"); 
 
        progressBar 
                .removeClass("strong medium weak useless") 
                .stop() 
                .animate({"width": percentage + "%"}); 
 
        if (percentage > 90) { 
            progressBar.addClass("strong"); 
check="strong";
        } else if (percentage > 50) { 
            progressBar.addClass("medium");


        } else if (percentage > 10) { 
            progressBar.addClass("weak"); 

        } else { 
            progressBar.addClass("useless"); 

        } 
    } 
 
    jQuery.fn.passwordValidate = function() { 
 
        this 
                .bind('keyup', jQuery.proxy(updatePassword, this)) 
                .after("<div class='passwordStrengthBar'>" + 
                "<div></div>" + 
                "</div>"); 
 
        updatePassword.apply(this); 
 
        return this; // for chaining 
 
    } 
 
})(IW, jQuery); 
 
/* Have all the password elements on the page validate */ 

