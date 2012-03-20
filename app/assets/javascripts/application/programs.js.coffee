window.colors = [
  "maroon"
  "darkred"
  "red"
  "lightpink"
  "crimson"
  "palevioletred"
  "hotpink"
  "deeppink"
  "mediumvioletred"
  "purple"
  "darkmagenta"
  "orchid"
  "thistle"
  "plum"
  "violet"
  "fuchsia"
  "magenta"
  "mediumorchid"
  "darkviolet"
  "darkorchid"
  "blueviolet"
  "indigo"
  "mediumpurple"
  "slateblue"
  "mediumslateblue"
  "darkblue"
  "mediumblue"
  "blue"
  "navy"
  "midnightblue"
  "darkslateblue"
  "royalblue"
  "cornflowerblue"
  "lightsteelblue"
  "aliceblue"
  "ghostwhite"
  "lavender"
  "dodgerblue"
  "steelblue"
  "deepskyblue"
  "slategray"
  "lightslategray"
  "lightskyblue"
  "skyblue"
  "lightblue"
  "teal"
  "darkcyan"
  "darkturquoise"
  "aqua"
  "mediumturquoise"
  "cadetblue"
  "paleturquoise"
  "lightcyan"
  "azure"
  "lightseagreen"
  "turquoise"
  "powderblue"
  "darkslategray"
  "aquamarine"
  "mediumspringgreen"
  "mediumaquamarine"
  "springgreen"
  "mediumseagreen"
  "seagreen"
  "limegreen"
  "darkgreen"
  "green"
  "lime"
  "forestgreen"
  "darkseagreen"
  "lightgreen"
  "palegreen"
  "mintcream"
  "honeydew"
  "chartreuse"
  "lawngreen"
  "olivedrab"
  "darkolivegreen"
  "yellowgreen"
  "greenyellow"
  "beige"
  "linen"
  "lightgoldenrodyellow"
  "olive"
  "yellow"
  "lightyellow"
  "ivory"
  "darkkhaki"
  "khaki"
  "palegoldenrod"
  "wheat"
  "gold"
  "lemonchiffon"
  "papayawhip"
  "darkgoldenrod"
  "goldenrod"
  "antiquewhite"
  "cornsilk"
  "oldlace"
  "moccasin"
  "navajowhite"
  "orange"
  "bisque"
  "tan"
  "darkorange"
  "burlywood"
  "saddlebrown"
  "sandybrown"
  "blanchedalmond"
  "lavenderblush"
  "seashell"
  "floralwhite"
  "snow"
  "peru"
  "peachpuff"
  "chocolate"
  "sienna"
  "lightsalmon"
  "coral"
  "darksalmon"
  "mistyrose"
  "orangered"
  "salmon"
  "tomato"
  "rosybrown"
  "pink"
  "indianred"
  "lightcoral"
  "brown"
  "firebrick"
  "black"
  "dimgray"
  "gray"
  "darkgray"
  "silver"
  "lightgrey"
  "gainsboro"
  "whitesmoke"
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
      $("#controls form").submit()
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
      $('#controls form').submit()
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
  if $("body.programs-my").length > 0
    $(".new-program-form img").click( (e) ->
      $(e.target).parents().closest(".form").find(".blurb-hover form").submit()
    )
    $(".new-program-form img").on('mouseenter', (e)->
      li = $(e.target).parents("li")
      hoverState = li.data("hover")
      if (hoverState == 'off')
        setTimeout( (->
          hover = $(li).find('.blurb-hover')
          hover.show()
          $(li).data('hover', "on")
        ), 200)
    )
    $('.form').on("mouseleave", (e) ->
      li = $(e.target).parents('li')
      hoverState = $(li).data("hover")
      if hoverState == 'on'
        setTimeout( (->
          hover = $(li).find('.blurb-hover')
          hover.hide()
          $(li).data('hover', "off")
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
