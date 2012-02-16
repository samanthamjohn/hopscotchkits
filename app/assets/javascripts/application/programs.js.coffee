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
  if $("body.programs-root").length > 0
    $(".new-program-form img").click(->
      $(".blurb-hover form").submit()
    )
    hoverState = 'off'
    $(".new-program-form img").on('mouseenter', (e)->
      if (hoverState == 'off')
        setTimeout( (->
          hover = $(e.target).parents(".form").find('.blurb-hover')
          hover.show()
          hoverState = 'on'
        ), 500)
    )
    $('.form').on("mouseleave", (e) ->
      if hoverState == 'on'
        setTimeout( (->
          hover = $(e.target).parents(".form").find('.blurb-hover')
          hover.hide()
          hoverState = "off"
        ), 500)
    )

  if $("#stage").length > 0
    window.$frame = $(window.frames['stage'].document)
    Raphael.setWindow(window.frames["stage"])


  $("input:submit, .button").button()

  $(".publish-button").button(
    icons:
      secondary: 'ui-icon-extlink'
  )

  $("input.permalink").click((e)-> $("input.permalink").select(); e.preventDefault())
