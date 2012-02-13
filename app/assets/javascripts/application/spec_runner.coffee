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

window.resetAssertions = ->
  window.assertions = []

window.assert = (assertion, errorMessage) ->
  window.assertions.push([assertion,errorMessage])

window.runAssertions = ->
  window.failed = false
  _.each(window.assertions, ((assertionErrorMessage) ->
    assertion = _.first(assertionErrorMessage)
    errorMessage = _.last(assertionErrorMessage)
    if window.failed
      true
    else if (!assertion())
      window.failed = true
      errorHtml = $("<div>"+errorMessage+"</div>")
      $(".message").attr("class","message errored")
      $('.message:visible').hide('fade')
      $('.message .error .current-error').html(errorHtml)
      $('.message').show('bounce')
  ))
  unless window.failed
    window.showSuccess()
window.showSuccess = ->
  $('.message:visible').hide('fade')
  $(".message").attr("class", "message successful")
  $('.message').show('fold')
  $('.next_button').button({disabled: false})
  $('.last_button').button({disabled: false})
  if window.step.last
    programId = $('.program.edit').data('programId')
    window.location.href="/programs/#{programId}"

$ ->
  if $(".program.edit[data-step]").length > 0
    window.step = $(".program.edit").data('step')

