paper = Raphael(0, 0, 300, 300)
turn = "O"
_.times(3, (i) -> (
  _.times(3, (j) -> (
    paper.rect(100*j, 100*i, 100, 100).attr(fill: "#B7F1DB").click(->
      paper.rect(100*j, 100*i, 100, 100).attr(fill: "#B7F1DB")
      paper.text(100*j+50,100*i+50,turn).attr('font-size': '100px')
      if turn == "O"
        turn = "X"
      else
        turn = "O"
    )
  ))
))

