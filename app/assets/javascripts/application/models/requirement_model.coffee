window.RequirementModel = Backbone.Model.extend(
  initialize: ->
    evalSpec = "window.spec =  (-> " + this.get('spec') + ")" 
    CoffeeScript.eval(evalSpec)
    this.set('spec', window.spec)
  runSpec: ->
    val = window.editor.getSession().getValue()
    try
      CoffeeScript.eval(val)
    catch error
      if error.type == "not_defined"
        errorHtml = "<div>Oh no! You have a syntax error: " + error.message + ". You may have forgotten to save the output of one of your function calls.</div>"
      else if error.type == "undefined_method"
        errorHtml = "<div>You are calling a method that doesn't exist! '" + error.arguments[0] + "' is either not the right method or you may have called it on the wrong variable.</div>"
      else
        errorArray = error.message.split("line ")[1].split(":")
        line = errorArray[0]
        errorMessage = errorArray[1]
        errorHtml = '<div>Oh no! You have a syntax error on line ' + line + '. Check to make sure you capitalized everything correctly, don\'t have any extra spaces and aren\'t missing any punctuation marks ( " , ).</div>'
      window.editor.focus()
    this.get('spec')()
)
