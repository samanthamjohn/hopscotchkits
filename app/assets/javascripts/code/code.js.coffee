window.makeWorkspace = ->
  window._paper = Raphael(0,0,400,400)
  _paper.rect(0,0,400,400).attr('fill', 'white').attr("stroke-width", 0)
  _paper

window.makePaper = makeWorkspace

window.resizePaper = ->
  if (window._paper) && !($('body').data('fullsize'))
    window._paper.setViewBox(90,100,210,210,true)
    $("svg").attr('height', 181)
    $("svg").attr('width', 181)

