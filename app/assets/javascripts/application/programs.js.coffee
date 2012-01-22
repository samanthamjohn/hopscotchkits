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
    $('.message:visible').hide('fade')
    $('.message .error .current-error').html(errorHtml)
    $('.message').show('bounce')
  window.editor.focus()

window.makeWorkspace = ->
  window._paper = Raphael(0,0,400,400)
  window._paper.rect(0,0,399,399).attr(fill: 'white', stroke: undefined)
  window._paper.text(10, 105, "100")
  window._paper.text(10, 205, "200")
  window._paper.text(10, 305, "300")
  window._paper.text(110, 10, "100")
  window._paper.text(210, 10, "200")
  window._paper.text(310, 10, "300")

  window._paper.path(
      "M0,100L400,100"+
      "M0,200L400,200"+
      "M0,300L400,300"
    ).attr(stroke: 'darkgray')
  window._paper.path(
      "M100,0L100,400"+
      "M200,0L200,400"+
      "M300,0L300,400"
    ).attr(stroke: 'gray')

  window._paper.path(
      "M0,25L400,25"+
      "M0,50L400,50"+
      "M0,75L400,75"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M0,125L400,125"+
      "M0,150L400,150"+
      "M0,175L400,175"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M0,225L400,225"+
      "M0,250L400,250"+
      "M0,275L400,275"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M0,325L400,325"+
      "M0,350L400,350"+
      "M0,375L400,375"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M25,0L25,400"+
      "M50,0L50,400"+
      "M75,0L75,400"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M125,0L125,400"+
      "M150,0L150,400"+
      "M175,0L175,400"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M225,0L225,400"+
      "M250,0L250,400"+
      "M275,0L275,400"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M325,0L325,400"+
      "M350,0L350,400"+
      "M375,0L375,400"
    ).attr(stroke: 'lightgray')
  window._paper
window.makePaper = window.makeWorkspace

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

  $('.next_button').click( (e) ->
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
      height: 415
    )
  )

  $("input.permalink").click((e)-> $("input.permalink").select(); e.preventDefault())

  $(".solution-link").click((e) ->
    e.preventDefault()
    $(".solutions").toggle()
  )

  leftOffset = $("#runthis").offset().left - 16;
  $("#runthis_copy").css("left", leftOffset)

  $(window).resize((->
    leftOffset = $("#runthis").offset().left;
    $("#runthis_copy").css("left", leftOffset)
  ))
  $("#runthis").waypoint( ( -> $("#runthis_copy").css(
    "display": "none"
    ) ),
    offset: 'bottom-in-view')

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
