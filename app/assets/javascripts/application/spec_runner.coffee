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
      $('.message .error .current-error').html(errorHtml)
  ))
  unless window.failed
    window.showSuccess()
window.showSuccess = ->
  $(".message").attr("class", "message successful")
  if $(".spec").data("last")
    $(".spec").data('last', false)
    $("#publish_it").click()

