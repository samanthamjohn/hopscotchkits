$ ->
  $(".show").click((e) ->
    e.preventDefault()
    id = $(e.target).attr('id').split("_")[0]
    console.log(id)
    $("#" + id + "_form").show()
    $("#" + id + "_show").hide()
  )
  $(".cancel").click((e) ->
    e.preventDefault()
    id = $(e.target).attr('id').split("_")[0]
    $("#" + id + "_form").hide()
    $("#" + id + "_show").show()
  )

