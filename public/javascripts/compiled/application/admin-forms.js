(function() {

  $(function() {
    $("body .show").click(function(e) {
      var id;
      e.preventDefault();
      id = $(e.target).attr('id').split("_")[0];
      $("#" + id + "_form").show();
      return $("#" + id + "_show").hide();
    });
    $(".cancel").click(function(e) {
      var id;
      e.preventDefault();
      id = $(e.target).attr('id').split("_")[0];
      $("#" + id + "_form").hide();
      return $("#" + id + "_show").show();
    });
    $(".unfeature.simple_form").bind("ajax:success", function() {
      return $(this).parent().attr("class", 'unfeatured');
    });
    return $(".feature.simple_form").bind("ajax:success", function() {
      return $(this).parent().attr("class", 'featured');
    });
  });

}).call(this);
