window.View = Backbone.View.extend(
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
    $(".more-info").button(icons:
      secondary: "ui-icon-triangle-1-s"
    )
    $(".less-info").button(icons:
      secondary: 'ui-icon-triangle-1-n'
    )
    if $("#runthis").length > 0
      leftOffset = $("#runthis").offset().left - 40;
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
  refreshStep: (e) ->
    e.preventDefault()
    this.model.set('url', 'next_step')
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
    if window._paper && _paper.canvas
      _paper.clear()
      _paper.remove()
    this.model.runSpecs()
  subTitle: () ->
    this.model.get('title')
  successMessage: () ->
    this.model.get('success_message')
  description: () ->
    this.model.get('description')
  hint: () ->
    this.model.get('hint')
  moreInfo: () ->
    if this.model.get('more_info') != "<p></p>"
      html = "<div class='gradient'>" +
        "<div id='more_info_button'><a href='#' class='more-info'>more info</a></div id='more_info_button'>" +
        "<div id='more_info'>" +
          "<div class='text'>" + this.model.get('more_info') + "</div>" +
          "<a href='#' class='less-info'>less info</a>" +
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
    if this.model.get('last_step')
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
    if this.model.get('last_step') || this.model.get('bonus') == true || this.model.get('freeplay') == true
      "last_button"
    else if this.model.get('next_step_id')
      "next_button"
  image_tag: () ->
    if this.model.get('image_url')
      "<img src='/assets/step_images/#{this.model.get('image_url')}' alt=#{this.model.get('.title')}/>"
)

