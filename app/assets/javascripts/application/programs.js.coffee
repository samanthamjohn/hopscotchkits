window.runSpec = (spec) ->
  CoffeeScript.eval('resetAssertions()')
  val = window.editor.getSession().getValue()
  try
    CoffeeScript.eval(val)
    CoffeeScript.eval(spec)
    CoffeeScript.eval("runAssertions()")
  catch error
    if error.type == "not_defined"
      errorHtml = "<div>Oh no! You have a syntax error: " + error.message + ". You may have forgotten to save the output of one of your function calls.</div>"
    else if error.type == "undefined_method"
      errorHtml = "<div>You are calling a method that doesn't exist! '" + error.arguments[0] + "' is either not the right method or you may have called it on the wrong variable.</div>"
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

$ ->
  if $("#stage").length > 0
    window.$frame = $(window.frames['stage'].document)
    Raphael.setWindow(window.frames["stage"])

  $("#ide form").bind("submit", ->
    val = window.editor.getSession().getValue()
    $("#ide input#program_code").val(val)
    $("#ide input#program_step_id").val(window.step.id)
    if window._paper && _paper.canvas
      _paper.clear()
      _paper.remove()
    runSpec(window.step.spec)
  )

  $('a.hint').on('click', (e) ->
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

  $('.next_button').button(disabled: true)
  $(window).on('click', '.next_button', (e) ->
    e.preventDefault()
    $.ajax(
      url: e.currentTarget.href
      dataType: "json"
      success: (data, status, xhr) ->
        template = $("script#preface_template").html()
        ideTemplate = $("script#ide_template").html()
        view = window.view(data)
        $(".preface").remove()
        $('.program.edit').prepend(Mustache.render(template, view))
        ideView = window.ideViewData(data)
        $("#next_steps").html(Mustache.render(ideTemplate, ideView))
        window.step = data
        $(".next_button").button(disabled: true)
        $(".last_button").button()
        $("#progressbar").progressbar(
          value: $("#progressbar").data("progress")
        )
    )
  )

  $("input.permalink").click((e)-> $("input.permalink").select(); e.preventDefault())

  $(document).on('click', ".solution-link", (e) ->
    e.preventDefault()
    $(".solutions").toggle()
  )

  if $("#runthis").length > 0
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
