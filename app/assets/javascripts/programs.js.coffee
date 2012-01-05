$ -> 
  $("#ide form").bind("ajax:success", -> 
    stageHtml = "<iframe src='"+$('form').attr('action')+"?test=true'></iframe>"
    $('#stage').html(stageHtml)
    window.editor.focus()
  )

  $("#ide form").bind("submit", ->
    $("#ide input#program_code").val(window.editor.getSession().getValue())
    window.editor.focus()
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
