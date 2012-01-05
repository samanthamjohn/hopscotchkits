paper = Raphael(0, 0, 400, 400)
turn = "O"
text = paper.text(320, 320, "It's O's turn")
_.times(3, (i) -> (
  _.times(3, (j) -> (

    paper.rect(100*j, 100*i, 100, 100).attr(fill: "white").click(->

      paper.rect(100*j, 100*i, 100, 100).attr(fill: "white")

      paper.text(100*j+50,100*i+50,turn).attr('font-size': '100px')
      if turn == "O"
        turn = "X"
        text.attr("text", "It's X's turn")

      else
        turn = "O"
        text.attr("text", "It's O's turn")
    )
  ))
))

