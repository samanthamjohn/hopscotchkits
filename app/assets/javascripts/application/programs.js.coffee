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
  try
    $frame.find('body svg').remove()
  val = window.editor.getSession().getValue()
  CoffeeScript.eval(val)
  editor.getSession().on('change', (e) ->
    Step.runSpecs()
    if e.data.text && e.data.text.match(/\r/)
      $("#ide form").submit()
  );

  editor.commands.addCommand(
    name: 'upArrow'
    bindKey:
      win: "Up"
      mac: "Up"
      sender: editor
    exec: (editor) ->
      wRange = editor.getSelectionRange()
      word = editor.getSession().doc.getTextRange(wRange)
      if word.match(/\d/)
        if parseInt(word) || parseInt(word) == 0
          editor.getSession().replace(wRange, "#{(parseInt(word, 10) + 1)}")
          editor.commands.commands.selectwordleft.exec(editor)
        else
          number = ""
          newNumber = ""
          _.each(word.split(/[a-zA-Z]/), (w) ->
            if w.match(/\d/)
              number = w
              newNumber = parseInt(w, 10) + 1
          )
          word = _.map(word.split(number), (w) ->
            if (w.length == 0) 
              w = newNumber
            w
          ).join('')
          editor.getSession().replace(wRange, word)
          editor.commands.commands.selectwordleft.exec(editor)
      else
        editor.navigateUp(1);
  )
  editor.commands.addCommand(
    name: 'downArrow'
    bindKey:
      win: "Down"
      mac: "Down"
      sender: editor
    exec: (editor) ->
      wRange = editor.getSelectionRange()
      word = editor.getSession().doc.getTextRange(wRange)
      if word.match(/\d/) 
        if parseInt(word) || parseInt(word) == 0
          editor.getSession().replace(wRange, "#{(parseInt(word, 10) - 1)}")
          editor.commands.commands.selectwordleft.exec(editor)
        else
          number = ""
          newNumber = ""
          _.each(word.split(/[a-zA-Z]/), (w) ->
            if w.match(/\d/)
              number = w
              newNumber = parseInt(w, 10) - 1
          )
          word = _.map(word.split(number), (w) ->
            if (w.length == 0) 
              w = newNumber
            w
          ).join('')
          editor.getSession().replace(wRange, word)
          editor.commands.commands.selectwordleft.exec(editor)
      else
        editor.navigateDown(1);
  )
$ ->
  if $("body.programs.new").length > 0
    startEditor("")
    $("#runthis").click((e) ->
      val = window.editor.getSession().getValue()
      CoffeeScript.eval(val)
    )
  if $("body.programs-root").length > 0
    $(".new-program-form img").click( (e) ->
      $(e.target).parents().closest(".form").find(".blurb-hover form").submit()
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
