(function() {

  window.resizePaper = function() {
    if (window._paper) {
      window._paper.setViewBox(0, 0, 400, 400, true);
      $("svg").attr('height', 433);
      return $("svg").attr('width', 433);
    }
  };

  $(function() {
    var programId;
    if ($("body.programs-show").length > 0) {
      programId = $("h1.edit").data("programId");
      return $('h1.edit').editable("/programs/" + programId + "/name");
    }
  });

}).call(this);
