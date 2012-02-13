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
    startEditor("")
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
