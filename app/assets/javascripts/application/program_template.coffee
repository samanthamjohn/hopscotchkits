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

  ideTemplate = $("script#ide_template").html()
  if ideTemplate
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
    programId = $(".program.edit").data('programId')
    $.ajax(
      url: "/programs/#{programId}/data"
      dataType: 'json'
      success: (data, status, xhr) ->
        step = data.step
        view = window.view(step)
        $(".preface").remove()
        $('.program.edit').prepend(Mustache.render(template, view))
        ideView = window.ideViewData(step)
        $("#next_steps").append(Mustache.render(ideTemplate, ideView))
        window.step = step
        $(".next_button").button(disabled: true)
        $(".last_button").button()
        $("#progressbar").progressbar(
          value: $('#progressbar').data('progress')
        )
        program = data.program
        window.editor = ace.edit("editor")
        window.editor.getSession().setValue(program.code)
        window.editor.getSession().setUseWrapMode(true);
        window.editor.setTheme("ace/theme/clouds")
        window.editor.getSession().setTabSize(2)
        $('#editor').css('fontSize', '16px')
        $('#editor').css('line-height', '21px')
        $(".ace_gutter-cell").css('fontSize', '16px')
        CoffeeScriptMode = require("ace/mode/coffee").Mode
        window.editor.getSession().setMode(new CoffeeScriptMode())
        val = window.editor.getSession().getValue()
        CoffeeScript.eval(val)
    )
