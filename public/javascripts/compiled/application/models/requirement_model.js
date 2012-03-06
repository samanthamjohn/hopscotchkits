(function() {

  window.RequirementModel = Backbone.Model.extend({
    initialize: function() {
      var evalSpec;
      evalSpec = "window.spec =  (-> " + this.get('spec') + ")";
      CoffeeScript.eval(evalSpec);
      this.set('spec', window.spec);
      return this.view = new RequirementView({
        model: this
      });
    },
    runSpec: function() {
      if (this.get('spec')()) {
        this.view.render('passed');
        return true;
      } else {
        this.view.render('failed');
        return false;
      }
    }
  });

}).call(this);
