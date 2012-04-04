$ ->
  $(window).load( ->
    _.each($(".iframe-container"), (el) ->
      data = $(el).data('iframe')
      $(el).append($("<iframe src=#{data.src} name=#{data.name} class='puppy'>"))
    )
  )

  $("#load_iframes").click( (e) ->
    e.preventDefault()
    _.each($(".admin-iframe-container"), (el) ->
      data = $(el).data('iframe')
      $(el).append($("<iframe src=#{data.src} name=#{data.name} class='puppy'>"))
    )
  )
