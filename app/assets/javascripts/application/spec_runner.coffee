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
  if $(".spec").data("last")
    $(".spec").data('last', false)
    $("#publish_it").click()

