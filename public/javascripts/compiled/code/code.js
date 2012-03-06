(function() {

  window.makeWorkspace = function() {
    window._paper = Raphael(0, 0, 400, 400);
    _paper.rect(0, 0, 400, 400).attr('fill', 'white').attr("stroke-width", 0);
    return _paper;
  };

  window.makePaper = makeWorkspace;

  window.resizePaper = function() {
    if (window._paper && !($('body').data('fullsize'))) {
      window._paper.setViewBox(90, 100, 210, 210, true);
      $("svg").attr('height', 181);
      return $("svg").attr('width', 181);
    }
  };

}).call(this);
