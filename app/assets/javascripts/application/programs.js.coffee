executeCode = ->
  val = editor.getSession().getValue()
  CoffeeScript.eval(val)

window.aceAutocomplete = ->
  left = $(".ace_cursor").offset().left
  top = $(".ace_cursor").offset().top
  input = "
    <input style='position:absolute; 
    top:#{top}px; left:#{left}px!important; opacity:0;
      z-index:999' value=''
      id='autocomplete_input'>
    </input>
    "
  window.input = true
  $(input).appendTo('body').focus()
  $("#autocomplete_input").autocomplete(
    source: ["#ffffff", "#000000"]
    minLength: 0
    search: (e, ui) ->
      console.log(e)
      console.log(ui)
      debugger
      key = e.originalEvent.keyCode
      if key == 8
        editor.commands.commands.backspace.exec(editor)
      else if key == 39
        editor.focus()
        $("#autocomplete_input").remove()
      else
        s = _.last($("#autocomplete_input").attr('value'))
        window.editor.insert(s)
    select: (e, ui) ->
      editor.focus()
      editor.commands.commands.selectwordleft.exec(editor)
      editor.commands.commands.del.exec(editor)
      editor.commands.commands.backspace.exec(editor)
      window.editor.insert(ui.item.value)
      $("#autocomplete_input").remove()
  )

window.startEditor = (code) ->
  window.editor = ace.edit("editor")
  window.editor.getSession().setValue(code)
  window.editor.getSession().setUseWrapMode(true);
  window.editor.setTheme("ace/theme/clouds")
  window.editor.getSession().setTabSize(2)
  tick = 1200
  $('#editor').css('fontSize', '16px')
  $('#editor').css('line-height', '21px')
  $(".ace_gutter-cell").css('fontSize', '16px')
  CoffeeScriptMode = require("ace/mode/coffee").Mode
  window.editor.getSession().setMode(new CoffeeScriptMode())
  try
    $frame.find('body svg').remove()
  window.specTimer = setTimeout((-> 
    executeCode()
  ), tick)
  editor.getSession().on('change', (e) ->
    clearTimeout(specTimer)
    window.specTimer = setTimeout((-> 
      Step.runSpecs()
      if e.data.text && e.data.text.match(/\r/)
        $("#ide form").submit()
    ), tick)
  )

  editor.commands.addCommand(
    name: 'addAutocomplete'
    bindKey:
      win: "#"
      mac: "#"
      sender: editor
    exec: (editor) ->
      editor.insert("#")
      aceAutocomplete()
  )

  editor.commands.addCommand(
    name: 'saveNewLine'
    bindKey:
      win: "Enter"
      mac: "Return"
      sender: editor
    exec: (editor) ->
      editor.insert("\n")
      clearTimeout(specTimer)
      Step.runSpecs()
      $('#ide form').submit()
  )

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
          executeCode()
        else
          number = ""
          newNumber = ""
          wordSplit = word.split(/[a-zA-Z]/)
          if wordSplit.length == 2
            _.each(wordSplit, (w) ->
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
            executeCode()
          else
            editor.navigateUp(1)
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
          executeCode()
        else
          number = ""
          newNumber = ""
          wordSplit = word.split(/[a-zA-Z]/)
          if wordSplit.length == 2
            _.each(wordSplit, (w) ->
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
            executeCode()
          else
            editor.navigateDown(1)
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


  $("input:submit, .button").button() if $("input:submit, .button").length > 0

  if $(".publish-button").length > 0
    $(".publish-button").button(
      icons:
        secondary: 'ui-icon-extlink'
    )

  $("input.permalink").click((e)-> $("input.permalink").select(); e.preventDefault())
