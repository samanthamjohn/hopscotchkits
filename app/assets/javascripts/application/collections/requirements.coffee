window.Requirements = Backbone.Collection.extend(
  model: RequirementModel
  runSpecs: ->
    this.each( (requirement) ->
      return unless requirement.runSpec()
    )
    $('.next_button').button({disabled: false})
    $('.last_button').button({disabled: false})
)
