$ ->
  kit = $("body.programs.new .new.program").data('kit')
  if kit
    $.ajax(
      url: "/kits/#{kit}/programs/new_form"
      success: (data) ->
        $(".new.program").append(data)
        $(".new.program input[type='submit']").button()
        $(".new.program a.show-new-program").click( (e) ->
          e.preventDefault()
          $(".existing-program").addClass('hidden')
          $(".new-program-form").removeClass('hidden')
        )
    )

