window.resizePaper = ->
  window._paper.setViewBox(0,0,400,400,true)
  $("svg").attr('height', 433)
  $("svg").attr('width', 433)

$ ->
  if $("body.program.show").length > 0
    hoverOut = (timeout) -> window.setTimeout((-> $(".advert").animate(
      right: "-373px"
      , 500
    )), timeout)
    hoverOut(2000)

    $('.advert').hover(( -> $('.advert').animate(
        right: "0px"
        , 500
        )), (-> hoverOut(500)) )
