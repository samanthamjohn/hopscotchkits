$ ->
  $("a#login, .already-reg a").click( (e) ->
    e.preventDefault()
    $("#nav").removeClass("register")
    $("#nav").toggleClass("login")
  )

  $("a#register").click((e) ->
    e.preventDefault()
    $("#nav").removeClass("login")
    $("#nav").toggleClass("register")
  )

  $("#login_form form").on("ajax:success", (xhr, data, status) ->
    $("#nav").removeClass("login")
    $("#nav").addClass("logged-in")
    $("#top_bar").addClass("logged-in")
    $("#logged_in span.name").html(data.name + "!")
    $("#logout span").html("Your name's not #{data.name}?")
  ).on("ajax:error", (xhr, data, status) ->
    console.log(data.responseText)
  )

  $("#register_form form").on("ajax:success", (xhr, data, status) ->
    $("#nav").removeClass("register")
    $("#nav").addClass("logged-in")
    $("#top_bar").addClass("logged-in")
    $("#logged_in span.name").html(data.name + "!")
    $("#logout span").html("Your name's not #{data.name}?")
  ).on("ajax:error", (xhr, data, status) ->
    console.log(data.responseText)
  )

