window.Requirements = Backbone.Collection.extend(
  model: RequirementModel
  runSpecs: ->
    $('.syntax-error').remove()
    val = window.editor.getSession().getValue()
    old_paper = window._paper
    try
      CoffeeScript.eval(val)
      if old_paper && old_paper.canvas
        old_paper.clear()
        old_paper.remove()
      failedSpecs = this.reject( (requirement) ->
        requirement.runSpec()
      )
      if failedSpecs.length > 0
        $(".progress .message.successful").removeClass("successful")
      else
        $(".progress .message").addClass("successful")
        $('.next_button').button({disabled: false}) if $(".next_button").length > 0
        $('.last_button').button({disabled: false}) if $(".last_button").length > 0
    catch error
      $(".progress .message.successful").removeClass("successful")
      if old_paper && old_paper.canvas
        old_paper.clear()
        old_paper.remove()
      if error.type == "not_defined"
        errorHtml = "<div class='syntax-error'>Oh no! You have a syntax error: " + error.message + ". You may have forgotten to save the output of one of your function calls.</div>"
      else if error.type == "undefined_method"
        errorHtml = "<div class='syntax-error'>You are calling a method that doesn't exist! '" + error.arguments[0] + "' is either not the right method or you may have called it on the wrong variable.</div>"
      else if error.type="malformed regex"
        console.log("error in your requirements regex")
        console.log(error.arguments)
      else
        if error.message
          if error.message.split('line')[1]
            errorArray = error.message.split("line ")[1].split(":")
            line = errorArray[0]
            errorMessage = errorArray[1]
            errorHtml = '<div class="syntax-error">Oh no! You have a syntax error on line ' + line + '. Check to make sure you capitalized everything correctly, don\'t have any extra spaces and aren\'t missing any punctuation marks ( " , ).</div>'
          else
            console.log(error)
        else
          errorHtml = "<div class='syntax-error'>#{error}</div>"
          console.log(error)
      $("#stage").append(errorHtml)
    window.editor.focus()
)
