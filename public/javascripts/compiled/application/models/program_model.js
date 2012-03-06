(function() {

  window.ProgramModel = Backbone.Model.extend({
    initialize: function() {
      this.fetch();
      return this.view = new ProgramView({
        model: this,
        el: $("body")
      });
    },
    fetch: function() {
      var programId, template,
        _this = this;
      template = $('script#preface_template');
      if (template.length > 0) {
        programId = $("script#preface_template").data('programId');
        return $.ajax({
          url: "/programs/" + programId + "/" + (this.get('url')),
          dataType: 'json',
          success: function(data, status, xhr) {
            var code;
            _this.attributes = data.step;
            _this.set("programId", programId);
            _this.requirements.reset(data.step.requirements);
            _this.view.render();
            if (data.program.code) {
              code = data.program.code;
            } else {
              code = "";
            }
            return startEditor(code);
          }
        });
      }
    },
    requirements: new Requirements(),
    runSpecs: function() {
      return this.requirements.runSpecs();
    }
  });

  $(function() {
    if ($('script#preface_template').data('step')) {
      return window.Step = new ProgramModel({
        url: "data?step=" + ($('script#preface_template').data('step'))
      });
    } else {
      return window.Step = new ProgramModel({
        url: 'data'
      });
    }
  });

}).call(this);
