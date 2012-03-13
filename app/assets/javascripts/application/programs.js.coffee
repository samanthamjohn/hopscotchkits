window.colors = [
  "black"
  "navy"
  "darkblue"
  "mediumblue"
  "blue"
  "darkgreen"
  "green"
  "teal"
  "darkcyan"
  "deepskyblue"
  "darkturquoise"
  "mediumspringgreen"
  "lime"
  "springgreen"
  "aqua"
  "cyan"
  "midnightblue"
  "dodgerblue"
  "lightseagreen"
  "forestgreen"
  "seagreen"
  "darkslategray"
  "limegreen"
  "mediumseagreen"
  "turquoise"
  "royalblue"
  "steelblue"
  "darkslateblue"
  "mediumturquoise"
  "indigo "
  "darkolivegreen"
  "cadetblue"
  "cornflowerblue"
  "mediumaquamarine"
  "dimgray"
  "slateblue"
  "olivedrab"
  "slategray"
  "lightslategray"
  "mediumslateblue"
  "lawngreen"
  "chartreuse"
  "aquamarine"
  "maroon"
  "purple"
  "olive"
  "gray"
  "skyblue"
  "lightskyblue"
  "blueviolet"
  "darkred"
  "darkmagenta"
  "saddlebrown"
  "darkseagreen"
  "lightgreen"
  "mediumpurple"
  "darkviolet"
  "palegreen"
  "darkorchid"
  "yellowgreen"
  "sienna"
  "brown"
  "darkgray"
  "lightblue"
  "greenyellow"
  "paleturquoise"
  "lightsteelblue"
  "powderblue"
  "firebrick"
  "darkgoldenrod"
  "mediumorchid"
  "rosybrown"
  "darkkhaki"
  "silver"
  "mediumvioletred"
  "indianred "
  "peru"
  "chocolate"
  "tan"
  "lightgray"
  "palevioletred"
  "thistle"
  "orchid"
  "goldenrod"
  "crimson"
  "gainsboro"
  "plum"
  "burlywood"
  "lightcyan"
  "lavender"
  "darksalmon"
  "violet"
  "palegoldenrod"
  "lightcoral"
  "khaki"
  "aliceblue"
  "honeydew"
  "azure"
  "sandybrown"
  "wheat"
  "beige"
  "whitesmoke"
  "mintcream"
  "ghostwhite"
  "salmon"
  "antiquewhite"
  "linen"
  "lightgoldenrodyellow"
  "oldlace"
  "red"
  "fuchsia"
  "magenta"
  "deeppink"
  "orangered"
  "tomato"
  "hotpink"
  "coral"
  "darkorange"
  "lightsalmon"
  "orange"
  "lightpink"
  "pink"
  "gold"
  "peachpuff"
  "navajowhite"
  "moccasin"
  "bisque"
  "mistyrose"
  "blanchedalmond"
  "papayawhip"
  "lavenderblush"
  "seashell"
  "cornsilk"
  "lemonchiffon"
  "floralwhite"
  "snow"
  "yellow"
  "lightyellow"
  "ivory"
  "white"
]

executeCode = ->
  val = editor.getSession().getValue()
  CoffeeScript.eval(val)

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
      $("#ide form").submit()
    ), tick)
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
      colorIndex = _.indexOf(colors, word.toLowerCase())
      if colorIndex > 0
        newWord = colors[colorIndex - 1]
        editor.getSession().replace(wRange, "#{newWord}")
        editor.commands.commands.selectwordleft.exec(editor)
        executeCode()
      else if colorIndex == 0
        newWord = _.last(colors)
        editor.getSession().replace(wRange, "#{newWord}")
        editor.commands.commands.selectwordleft.exec(editor)
        executeCode()
      else if word.match(/\d/)
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
      colorIndex = _.indexOf(colors, word.toLowerCase())
      if word.toLowerCase() == _.last(colors)
        newWord = _.first(colors)
        editor.getSession().replace(wRange, "#{newWord}")
        editor.commands.commands.selectwordleft.exec(editor)
        executeCode()
      else if colorIndex >= 0
        newWord = colors[colorIndex + 1]
        editor.getSession().replace(wRange, "#{newWord}")
        editor.commands.commands.selectwordleft.exec(editor)
        executeCode()
      else if word.match(/\d/) 
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
