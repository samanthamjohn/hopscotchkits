#with loops
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
#no loops
paper = Raphael(0, 0, 400, 400)
turn = "O"
text = paper.text(320, 320, "It's O's turn")

drawRect = (x, y) -> (
  paper.rect(x, y, 100, 100).attr(fill: "white").click(->

    paper.rect(x, y, 100, 100).attr(fill: "white")
    paper.text(x + 50,y + 50,turn).attr('font-size': '100px')

    if turn == "O"
      turn = "X"
      text.attr("text", "It's X's turn")

    else
      turn = "O"
      text.attr("text", "It's O's turn")
  )
)
drawRect(0,0)
drawRect(100,0)
drawRect(200,0)
drawRect(0,100)
drawRect(100,100)
drawRect(200,100)
drawRect(0,200)
drawRect(100,200)
drawRect(200,200)


#unbind without redrawing rectangle
paper = Raphael(0, 0, 400, 400) 
turn = "O"
text = paper.text(320, 320, "It's O's turn")    

drawRect = (x, y) -> (
  rect = paper.rect(x, y, 100, 100).attr(fill: "white")
  func =  ->
    paper.text(x + 50,y + 50,turn).attr('font-size': '100px')
    if turn == "O"
      turn = "X"
      text.attr("text", "It's X's turn")
    else
      turn = "O"
      text.attr("text", "It's O's turn")
    rect.unclick(func)
  rect.click(func)
)
drawRect(0,0)
drawRect(100,0)
drawRect(200,0)
drawRect(0,100)
drawRect(100,100)
drawRect(200,100)
drawRect(0,200)
drawRect(100,200)
drawRect(200,200)


#extracted showTurn
paper = Raphael(0, 0, 400, 400) 
text = paper.text(320, 320, "") 
showTurn = (who) -> text.attr("text", "It's #{who}'s turn")

turn = "O"
showTurn(turn)

drawRect = (x, y) -> (
  rect = paper.rect(x, y, 100, 100).attr(fill: "white")
  func =  ->
    paper.text(x + 50,y + 50,turn).attr('font-size': '100px')
    if turn == "O"
      turn = "X"
    else
      turn = "O"
    showTurn(turn)
    rect.unclick(func)
  rect.click(func)
)
drawRect(0,0)
drawRect(100,0)
drawRect(200,0)
drawRect(0,100)
drawRect(100,100)
drawRect(200,100)
drawRect(0,200)
drawRect(100,200)
drawRect(200,200)


#really broken down
paper = ''
text = ''
turn = "O"

drawCanvas = -> 
  paper = Raphael(0, 0, 400, 400) 
  text = paper.text(320, 320, "")

toggleTurn = -> 
  if turn == "O"
    turn = "X"
  else
    turn = "O"

showTurn = (who) -> text.attr("text", "It's #{who}'s turn")

drawRect = (x, y) -> (
  rect = paper.rect(x, y, 100, 100).attr(fill: "white")
  func =  ->
    paper.text(x + 50,y + 50,turn).attr('font-size': '100px')
    toggleTurn()
    showTurn(turn)
    rect.unclick(func)
  rect.click(func)
)

drawCanvas()
showTurn(turn)
drawRect(0,0)
drawRect(100,0)
drawRect(200,0)
drawRect(0,100)
drawRect(100,100)
drawRect(200,100)
drawRect(0,200)
drawRect(100,200)
drawRect(200,200)
