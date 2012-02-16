$ ->
  $("body .show").click((e) ->
    e.preventDefault()
    id = $(e.target).attr('id').split("_")[0]
    $("#" + id + "_form").show()
    $("#" + id + "_show").hide()
  )
  $(".cancel").click((e) ->
    e.preventDefault()
    id = $(e.target).attr('id').split("_")[0]
    $("#" + id + "_form").hide()
    $("#" + id + "_show").show()
  )

  $(".unfeature.simple_form").bind("ajax:success", ->
    $(this).parent().attr("class", 'unfeatured')
  )

  $(".feature.simple_form").bind("ajax:success", ->
    $(this).parent().attr("class", 'featured')
  )

