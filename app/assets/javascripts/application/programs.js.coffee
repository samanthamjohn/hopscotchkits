window.runSpec = ->
  CoffeeScript.eval('resetAssertions()')
  val = window.editor.getSession().getValue()
  try
    CoffeeScript.eval(val)
    spec = $(".spec").data("spec")
    CoffeeScript.eval(spec)
    CoffeeScript.eval("runAssertions()")
  catch error
    if error.type == "not_defined"
      errorHtml = "<div>Oh no! You have a syntax error: " + error.message + ". You may have forgotten to save the output of one of your function calls.</div>"
    else
      errorArray = error.message.split("line ")[1].split(":")
      line = errorArray[0]
      errorMessage = errorArray[1]
      errorHtml = '<div>Oh no! You have a syntax error on line ' + line + '. Check to make sure you capitalized everything correctly, don\'t have any extra spaces and aren\'t missing any punctuation marks ( " , ).</div>'
    $('.message').attr('class', 'message errored')
    $('.message .error .current-error').html(errorHtml)
  window.editor.focus()

window.makePaper = ->
  window._paper = Raphael(0,0,400,400)
  window._paper.rect(0,0,399,399).attr('fill', 'white')
  window._paper

$ ->
  if $("#stage").length > 0
    window.$frame = $(window.frames['stage'].document)
    Raphael.setWindow(window.frames["stage"])

  $("#ide form").bind("submit", ->
    val = window.editor.getSession().getValue()
    $("#ide input#program_code").val(val)
    if window._paper && _paper.canvas
      _paper.clear()
      _paper.remove()
    runSpec()
  )

  $("a#runthis").click( (e) ->
    e.preventDefault()
    val = window.editor.getSession().getValue()
    CoffeeScript.eval(val)
  )

  $("a.hint").click( (e) ->
    e.preventDefault()
    $("#hint").dialog(
      modal: true
      title: "Hints and Solutions"
    )
  )

  $("#progressbar").progressbar(
    value: $("#progressbar").data("progress")
  )
  $("input:submit, .button").button()

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

  $('#next_button').click( (e) -> 
    e.preventDefault()
    $("#next_steps form").submit()
  )

  $("#publish_it").click( (e) ->
    e.preventDefault()
    $("#publish_popup").dialog(
      modal: true
      title: "Share your work"
      open: (-> $("input.permalink").focus())
      class: "publish"
      width: "415px"
      height: 350
    )
  )

  $("input.permalink").click((e)-> $("input.permalink").select(); e.preventDefault())

  $(".solution-link").click((e) ->
    e.preventDefault()
    $(".solutions").toggle()
  )

  if $("#ide").length > 0
    code = $("#ide input#program_code").val()
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
