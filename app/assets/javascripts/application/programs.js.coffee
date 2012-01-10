window.runSpec = ->
  val = window.editor.getSession().getValue()
  CoffeeScript.eval(val)
  spec = $(".spec").data("spec")
  CoffeeScript.eval('resetAssertions()')
  CoffeeScript.eval(spec)
  CoffeeScript.eval("runAssertions()")
  window.editor.focus()

window.makePaper = ->
  window._paper = Raphael(0,0,400,400)
  window._paper.rect(0,0,399,399).attr('fill', 'white')
  window._paper

$ ->
  window.$frame = $(window.frames['stage'].document)
  Raphael.setWindow(window.frames["stage"])

  $("#ide form").bind("submit", ->
    val = window.editor.getSession().getValue()
    $("#ide input#program_code").val(val)
    $frame.find('body').html('')
    runSpec()
  )

  $("a.hint").click( (e) ->
    e.preventDefault()
    $("#hint").dialog(
      modal: true
    )
  )

  $("#progressbar").progressbar(
    value: $("#progressbar").data("progress")
  )
  $("input:submit, .button").button()

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
    runSpec()
