window.Requirements = Backbone.Collection.extend(
  model: RequirementModel
  runSpecs: ->
    $('.syntax-error').remove()
    val = window.editor.getSession().getValue()
    try
      if window._paper && _paper.canvas
        _paper.clear()
        _paper.remove()
      CoffeeScript.eval(val)
      failedSpecs = this.reject( (requirement) ->
        requirement.runSpec()
      )
      if failedSpecs.length > 0
        $(".progress .message.successful").removeClass("successful")
      else
        $(".progress .message").addClass("successful")
        $('.next_button').button({disabled: false})
        $('.last_button').button({disabled: false})
    catch error
      if error.type == "not_defined"
        errorHtml = "<div class='syntax-error'>Oh no! You have a syntax error: " + error.message + ". You may have forgotten to save the output of one of your function calls.</div>"
      else if error.type == "undefined_method"
        errorHtml = "<div class='syntax-error'>You are calling a method that doesn't exist! '" + error.arguments[0] + "' is either not the right method or you may have called it on the wrong variable.</div>"
      else
        errorArray = error.message.split("line ")[1].split(":")
        line = errorArray[0]
        errorMessage = errorArray[1]
        errorHtml = '<div class="syntax-error">Oh no! You have a syntax error on line ' + line + '. Check to make sure you capitalized everything correctly, don\'t have any extra spaces and aren\'t missing any punctuation marks ( " , ).</div>'
      $("#stage").append(errorHtml)
    window.editor.focus()
)
