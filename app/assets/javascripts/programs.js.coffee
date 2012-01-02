$ -> 
  $("#ide form").bind("ajax:success", -> 
    stageHtml = "<iframe src='"+$('form').attr('action')+"?test=true'></iframe>"
    $('#stage').html(stageHtml)
  )

