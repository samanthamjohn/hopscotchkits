window.makeWorkspace = ->
  window._paper = Raphael(0,0,400,400)
  window._paper.rect(0,0,399,399).attr(fill: 'white', stroke: undefined)
  window._paper.text(10, 105, "100")
  window._paper.text(10, 205, "200")
  window._paper.text(10, 305, "300")
  window._paper.text(110, 10, "100")
  window._paper.text(210, 10, "200")
  window._paper.text(310, 10, "300")

  window._paper.path(
      "M0,100L400,100"+
      "M0,200L400,200"+
      "M0,300L400,300"
    ).attr(stroke: 'darkgray')
  window._paper.path(
      "M100,0L100,400"+
      "M200,0L200,400"+
      "M300,0L300,400"
    ).attr(stroke: 'gray')

  window._paper.path(
      "M0,25L400,25"+
      "M0,50L400,50"+
      "M0,75L400,75"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M0,125L400,125"+
      "M0,150L400,150"+
      "M0,175L400,175"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M0,225L400,225"+
      "M0,250L400,250"+
      "M0,275L400,275"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M0,325L400,325"+
      "M0,350L400,350"+
      "M0,375L400,375"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M25,0L25,400"+
      "M50,0L50,400"+
      "M75,0L75,400"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M125,0L125,400"+
      "M150,0L150,400"+
      "M175,0L175,400"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M225,0L225,400"+
      "M250,0L250,400"+
      "M275,0L275,400"
    ).attr(stroke: 'lightgray')
  window._paper.path(
      "M325,0L325,400"+
      "M350,0L350,400"+
      "M375,0L375,400"
    ).attr(stroke: 'lightgray')
  window._paper
window.makePaper = window.makeWorkspace
window.reset = ->
  $frame.find("svg").remove()
  val = window.editor.getSession().getValue()
  CoffeeScript.eval(val)

