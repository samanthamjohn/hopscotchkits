window.resizePaper = ->
  window._paper.setViewBox(0,0,400,400,true)
  $("svg").attr('height', $(window).height())
  $("svg").attr('width', $(window).height())

$ ->
  $(window).resize(->
    window.resizePaper()
  )
