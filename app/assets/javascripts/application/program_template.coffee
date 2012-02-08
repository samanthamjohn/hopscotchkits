$ ->
  template = $('script#preface_template').html()
  if template
    window.view = (step) ->
      step: step
      showTitle: () ->
        if step.bonus == true
          str = "Bonus: "
        else if step.freeplay
          str = "Freeplay Mode: "
        else
          str = "Step #{step.position}: "
        str
      progressText: () ->
        if step.last_step
          "Complete!"
        else
          numSteps = $(".program.edit").data("numSteps")
          "Step #{step.position} of #{numSteps}"
      progressPct: () ->
        if step.last_step
          100
        else
          numSteps = $(".program.edit").data("numSteps")
          step.position/numSteps * 100
      successShuffle: () ->
        _.shuffle(['Yay!', 'Boom!', "You're Right!", "Good Job", "Way to go!", "You did it!"])[0]
      errorShuffle: () ->
        _.shuffle(["Whoops!", "Oops!", "Sorry!", "Uh-oh!", "Oh Noes!", "Oh gosh!"])[0]
      nextStep: () ->
       if step.last_step || step.bonus == true || step.freeplay == true
          programId = $(".program.edit").data("programId")
          "<div class='controls'>" + 
            "<a href='/programs/#{programId}' class='button last_button'>"+
            "Next <span class='arrow'> &raquo;</span>" +
            "</a></div>"
        else if step.next_step_id
          programId = $(".program.edit").data("programId")
          "<div class='controls'>" + 
            "<a href='/programs/#{programId}/next_step' class='button next_button'>"+
            "Next <span class='arrow'> &raquo;</span>" +
            "</a></div>"
      image_tag: () ->
        if step.image_url
          "<img src='/assets/step_images/#{step.image_url}' alt=#{step.title}/>"

    step =  $(".program.edit").data('step')
    view = window.view(step)
    $('.program.edit').prepend(Mustache.render(template, view))
  ideViewTemplate = $("script#ide_template").html()
  if ideViewTemplate
    window.ideViewData = (step) ->
      step: step
      nextStep: ->
        if step.last_step || step.bonus == true || step.freeplay == true
          programId = $(".program.edit").data("programId")
          "<a href='/programs/#{programId}' class='button last_button'>"+
            "Next <span class='arrow'> &raquo;</span>" +
            "</a>"
        else if step.next_step_id
          programId = $(".program.edit").data("programId")
          "<a href='/programs/#{programId}/next_step' class='button next_button'>"+
            "Next <span class='arrow'> &raquo;</span>" +
            "</a>"
    window.step =  $(".program.edit").data('step')
    $("#next_steps").append(Mustache.render(ideViewTemplate, ideViewData(window.step)))

