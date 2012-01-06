window.failed = false
window.assertions = []
window.assert = (assertion, errorMessage) ->
  window.assertions.push([assertion,errorMessage])
window.runAssertions = ->
  _.each(window.assertions, ((assertionErrorMessage) ->
    assertion = _.first(assertionErrorMessage)
    errorMessage = _.last(assertionErrorMessage)
    if window.failed
      true
    else if (!assertion())
      window.failed = true
      errorHtml = $("<div>"+errorMessage+"</div>")
      parent.$("#message").attr("class","error")
      parent.$('#message #error').html(errorHtml)
  ))
  unless window.failed
    window.showSuccess()
window.showSuccess = ->
  parent.$("#message").attr("class", "success")

