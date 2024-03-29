window.ProgramView = Backbone.View.extend(
  render: ->
    template = $('script#preface_template').html()
    $('.preface').html(Mustache.render(template, this))
    $("#progressbar").progressbar(
      value: $('#progressbar').data('progress')
    )
    ideTemplate = $("script#ide_template").html()
    $("#next_steps").html(Mustache.render(ideTemplate, this))
    $(".next_button").button(disabled: true)
    $(".last_button").button(disabled: true)
    $(".publish-button").button(disabled: false)
    $(".previous_button").button(disabled: false)
    if $("#runthis").length > 0
      leftOffset = $("#runthis").offset().left - 2;
      $("#runthis_copy").css("left", leftOffset)

      $(window).resize((->
        leftOffset = $("#runthis").offset().left;
        $("#runthis_copy").css("left", leftOffset)
      ))
      $("#runthis").waypoint( ( -> $("#runthis_copy").css(
        "display": "none"
        ) ),
        offset: 'bottom-in-view')
  events:
    "submit #ide form" : "submitCode"
    "click a.hint" : "showHint"
    "click .next_button" : "refreshStep"
    "click .last_button" : "submitCodeAndShow"
    "click .previous_button" : "previousStep"
    "click .publish-button" : "submitCodeAndShow"
    "click .solution-link" : "toggleSolutions"
    "click .more-info"  : "showMoreInfo"
    "click .less-info"  : "showLessInfo"
  showMoreInfo: (e) ->
    e.preventDefault()
    $("#more_info").fadeIn('fast', ->
      $("#more_info_button").hide()
    )
  showLessInfo: (e) ->
    e.preventDefault()
    $("#more_info").fadeOut('fast', ->
      $("#more_info_button").show()
    )
  toggleSolutions: (e) ->
    e.preventDefault()
    $(".solutions").toggle()
  previousStep: (e) ->
    e.preventDefault()
    this.model.set('url', 'previous_step')
    this.model.fetch()
  refreshStep: (e) ->
    e.preventDefault()
    this.model.set('url', 'next_step')
    $("#ide form").submit()
    this.model.fetch()
  showHint: (e) ->
    e.preventDefault()
    $("#hint").dialog(
      modal: true
      title: "Hints and Solutions"
    )
  submitCode: ->
    val = window.editor.getSession().getValue()
    $("#ide input#program_code").val(val)
    $("#ide input#program_step_id").val(this.model.get('id'))
    this.model.runSpecs()
  submitCodeAndShow: (e) ->
    e.preventDefault()
    $("#ide form").submit()
    window.location.href = window.location.href.split('/edit')[0]
  subTitle: () ->
    this.model.get('title')
  successHeader: ->
     _.shuffle(['Yay!', 'Boom!', "You're Right!", "Good Job", "Way to go!", "You did it!"])[0]
  successMessage: () ->
    this.model.get('success_message')
  description: () ->
    this.model.get('description')
  hint: () ->
    this.model.get('hint')
  moreInfo: () ->
    if this.model.get('more_info') != "<p></p>"
      html = "<div class='gradient'>" +
        "<div id='more_info_button'><a href='#' class='more-info'>more info<span></span></a></div>" +
        "<div id='more_info'>" +
          "<div class='text'>" + this.model.get('more_info') + "</div>" +
          "<a href='#' class='less-info'><span></span>less info</a>" +
        "</div>" +
      "</div>"
    else
      html = ""
  solution: () ->
    this.model.get('solution')
  showTitle: () ->
    if this.model.get('bonus') == true
      str = "Bonus: "
    else if this.model.get('freeplay')
      str = "Freeplay Mode: "
    else
      str = "Step #{this.model.get('position')}: "
    str
  progressText: () ->
    if this.model.get('freeplay')
      "Complete!"
    else
      numSteps = $("script#preface_template").data("numSteps")
      "Step #{this.model.get('position')} of #{numSteps}"
  progressPct: () ->
    if this.model.get('last_step')
      100
    else
      numSteps = $("script#preface_template").data("numSteps")
      this.model.get('position')/numSteps * 100
  requirements: () ->
    reqs = this.model.requirements
    reqs.map( (r) -> 
      name: r.get('name')
      result: "unchecked"
      success: r.get('success')
      id: r.id
    )
  programId: ->
    this.model.get('programId')
  buttonClass: ->
    if this.model.get('bonus') == true || this.model.get('freeplay') == true
      "publish-button"
    else if this.model.get('last_step') 
      "last_button"
    else if this.model.get('next_step_id')
      "next_button"
  backButtonClass: ->
    if this.model.get('bonus') == true || this.model.get('freeplay') == true || this.model.get('position') == 1
      "hidden"
    else
      "previous_button"
  image_tag: () ->
    if this.model.get('image_url')
      "<img src='/assets/step_images/#{this.model.get('image_url')}' alt=#{this.model.get('.title')}/>"
)

