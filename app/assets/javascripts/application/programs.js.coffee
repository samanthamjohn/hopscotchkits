window.runSpec = (spec) ->
  CoffeeScript.eval('resetAssertions()')
  val = window.editor.getSession().getValue()
  try
    CoffeeScript.eval(val)
    CoffeeScript.eval(spec)
    CoffeeScript.eval("runAssertions()")
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
    $('.message').attr('class', 'message errored')
    $('.message:visible').hide('fade')
    $('.message .error .current-error').html(errorHtml)
    $('.message').show('bounce')
  window.editor.focus()

window.startEditor = (code) ->
  window.editor = ace.edit("editor")
  window.editor.getSession().setValue(code)
  window.editor.getSession().setUseWrapMode(true);
  window.editor.setTheme("ace/theme/clouds")
  window.editor.getSession().setTabSize(2)
  $('#editor').css('fontSize', '16px')
  $('#editor').css('line-height', '21px')
  $(".ace_gutter-cell").css('fontSize', '16px')
  CoffeeScriptMode = require("ace/mode/coffee").Mode
  window.editor.getSession().setMode(new CoffeeScriptMode())
  val = window.editor.getSession().getValue()
  CoffeeScript.eval(val)

$ ->
  if $("body.programs.new").length > 0
    window.startEditor("")
    $("#runthis").click((e) ->
      val = window.editor.getSession().getValue()
      CoffeeScript.eval(val)
    )

  if $("#stage").length > 0
    window.$frame = $(window.frames['stage'].document)
    Raphael.setWindow(window.frames["stage"])


  $(".trash-button").button(
    icons:
      primary: 'ui-icon-trash'
    text: false
  )

  $('.edit-button').button(
    icons:
      primary: 'ui-icon-pencil'
    text: false
  )

  $(".publish-button").button(
    icons:
      secondary: 'ui-icon-extlink'
  )

  $("input.permalink").click((e)-> $("input.permalink").select(); e.preventDefault())
