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
      $("#message").attr("class","error")
      $('#message #error').html(errorHtml)
  ))
  unless window.failed
    window.showSuccess()
window.showSuccess = ->
  $("#message").attr("class", "success")

