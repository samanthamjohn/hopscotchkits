window.resizePaper = ->
  if (window._paper)
    window._paper.setViewBox(0,0,400,400,true)
    $("svg").attr('height', 433)
    $("svg").attr('width', 433)

$ ->
  if $("body.programs-show").length > 0
    programId = $("h1.edit").data("programId")
    $('h1.edit').editable("/programs/#{programId}/name");

