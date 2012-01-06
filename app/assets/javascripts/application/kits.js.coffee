$ ->
  $(".cancel-link").click( (e) ->
    e.preventDefault()
    id = $(e.target).attr('id')
    $("#edit_" + id).addClass("hidden")
    $("#show_" + id).removeClass("hidden")
  )
  $(".edit-link").click( (e) ->
    e.preventDefault()
    id = $(e.target).attr('id')
    $("#edit_" + id).removeClass("hidden")
    $("#show_" + id).addClass("hidden")
  )
