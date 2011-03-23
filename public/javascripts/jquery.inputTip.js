jQuery.fn.inputTip = function(options) {

    var defaults = {
        tipId: "inputTipContainer",
        tipSelectedClass: "selected",
        goodText: "Ok",
        badText: "Bad",
        tipText: "Tip",
        checkingText: "Checking...",
        validateText: null,
        validateInRealTime: true
    };
    var options = $.extend(defaults, options);

    var inputTipContainer = $("<div class=\"" + defaults.tipId + "\"></div>");

    var currentHelper = new jQuery.inputTipHelper(defaults, inputTipContainer);

    $("body").append(inputTipContainer);
    return this.each(function() {
        $(this).focus(function() {
            $(this).addClass("selected").addClass("straightRightCorner");
            var thisRef = $(this);
            var thisOffset = $(this).offset();
            inputTipContainer.show().css("left", (thisOffset.left + thisRef.outerWidth()) + "px").css("top", (thisOffset.top) + "px");
            currentHelper.SetTipContainerText(2);
        }).blur(function() {
            $(this).removeClass("selected");
            defaults.validateText($(this).val(), function(status, response) {
                currentHelper.SetTipContainerText(status, response);
            });
        });
        if (defaults.validateInRealTime) {
            $(this).keyup(function() {
                if (defaults.validateInRealTime) {
                    defaults.validateText($(this).val(), function(status, response) {
                        currentHelper.SetTipContainerText(status, response);
                    });
                }
            });
        }
    });
}
jQuery.inputTipHelper = function(Settings, TipContainer) {
    this.init(Settings, TipContainer);
}
jQuery.inputTipHelper.prototype = {
    Settings: null,
    TipContainer: null,

    init: function(Settings, TipContainer) {
        this.TipContainer = TipContainer;
        this.Settings = Settings;
    },

    SetTipContainerText: function(type, newForcedText) {
        this.TipContainer.removeClass("badInputTipContainer")
        this.TipContainer.removeClass("goodInputTipContainer");
        var newText;
        switch (type) {
            // Bad                            
            case 0:
                {
                    this.TipContainer.addClass("badInputTipContainer");
                    newText = this.Settings.badText;
                }
                break;
            // Good                            
            case 1:
                {
                    this.TipContainer.addClass("goodInputTipContainer");
                    newText = this.Settings.goodText;
                }
                break;
            // Tip                            
            case 2:
                {
                    newText = this.Settings.tipText;
                }
                break;
        }
        if (newForcedText) newText = newForcedText;
        this.TipContainer.html(newText);
    }
}