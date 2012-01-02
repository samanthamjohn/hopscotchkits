$ -> 
  $("#ide form").bind("ajax:success", -> 
    stageHtml = "<iframe src='"+$('form').attr('action')+"'></iframe>"
    $('#stage').html(stageHtml)
  )

