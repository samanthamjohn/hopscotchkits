(function() {

  window.RequirementView = Backbone.View.extend({
    render: function(status) {
      if (status === 'passed') {
        return $("#req_" + this.model.id).find('.unchecked').attr('class', 'checked');
      } else if (status === 'failed') {
        return $("#req_" + this.model.id).find('.checked').attr('class', 'unchecked');
      }
    }
  });

}).call(this);
