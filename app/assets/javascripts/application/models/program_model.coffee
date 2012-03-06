window.ProgramModel = Backbone.Model.extend(
  initialize: ->
    this.fetch()
    this.view = new ProgramView (
      model: this
      el: $("body")
    )
  fetch: ->
    template = $('script#preface_template')
    if template.length > 0
      programId = $("script#preface_template").data('programId')
      $.ajax(
        url: "/programs/#{programId}/#{this.get('url')}"
        dataType: 'json'
        success: (data, status, xhr) =>
          this.attributes = data.step
          this.set("programId", programId)
          this.requirements.reset(data.step.requirements)
          this.view.render()
          if data.program.code
            code = data.program.code
          else
            code = ""
          startEditor(code)
      )
  requirements: new Requirements()
  runSpecs: ->
    this.requirements.runSpecs()
)
$ ->
  if $('script#preface_template').data('step')
    window.Step = new ProgramModel(url: "data?step=#{$('script#preface_template').data('step')}")
  else
    window.Step = new ProgramModel(url: 'data')
