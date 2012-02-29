window.RequirementView = Backbone.View.extend(
  render: (status)->
    if status == 'passed'
      $("#req_#{this.model.id}").find('.unchecked').attr('class', 'checked')
    else if status == 'failed'
      $("#req_#{this.model.id}").find('.checked').attr('class', 'unchecked')

)
