$ ->
  $("a#login, .already-reg a").click( (e) ->
    e.preventDefault()
    $("#nav").removeClass("register")
    $("#register_form").removeClass('errors')
    $("#nav").toggleClass("login")
  )

  $("a#register").click((e) ->
    e.preventDefault()
    $("#nav").removeClass("login")
    $("#login_form").removeClass('errors')
    $("#nav").toggleClass("register")
  )

  $("#login_form form").on("ajax:success", (xhr, data, status) ->
    $("#nav").removeClass("login")
    $("#nav").addClass("logged-in")
    $("#top_bar").addClass("logged-in")
    $("#logged_in span.name").html(data.name + "!")
    $("#logout span").html("Your name's not #{data.name}?")
    $("#login_form").removeClass('errors')

    if $("script#preface_template").length > 0
      programId = $("script#preface_template").data('program-id')
      $.ajax(
        url: "/programs/#{programId}"
        dataType: 'json'
        type: "PUT"
        data: 
          id: programId
          program:
            user_id: data.id
      )

  ).on("ajax:error", (xhr, data, status) ->
    $("#login_form .errors").html(data.responseText)
    $("#login_form").addClass('errors')
  )

  $("#register_form form").on("ajax:success", (xhr, data, status) ->
    $("#nav").removeClass("register")
    $("#nav").addClass("logged-in")
    $("#top_bar").addClass("logged-in")
    $("#logged_in span.name").html(data.name + "!")
    $("#logout span").html("Your name's not #{data.name}?")
    $("#register_form").removeClass('errors')

    if $("script#preface_template").length > 0
      programId = $("script#preface_template").data('program-id')
      $.ajax(
        url: "/programs/#{programId}"
        dataType: 'json'
        type: "PUT"
        data: 
          id: programId
          program:
            user_id: data.id
      )
  ).on("ajax:error", (xhr, data, status) ->
    errors = JSON.parse(data.responseText)
    errorStr = _.map(errors, (e, i) ->
      if e instanceof Array
        e = e.join(', ')
      "#{i} #{e}."
    )
    $("#register_form .errors").html(errorStr.join('<br />'))
    $("#register_form").addClass('errors')
  )

