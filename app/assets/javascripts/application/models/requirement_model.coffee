window.RequirementModel = Backbone.Model.extend(
  initialize: ->
    evalSpec = "window.spec =  (-> " + this.get('spec') + ")" 
    CoffeeScript.eval(evalSpec)
    this.set('spec', window.spec)
    this.view = new RequirementView(model: this)
  runSpec: ->
    if this.get('spec')()
      this.view.render('passed')
      true
    else
      this.view.render('failed')
      false
)
