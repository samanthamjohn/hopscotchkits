$ ->
  $(window).load( ->
    _.each($(".iframe-container"), (el) ->
      data = $(el).data('iframe')
      $(el).append($("<iframe src=#{data.src} name=#{data.name} class='puppy'>"))
    )
  )
