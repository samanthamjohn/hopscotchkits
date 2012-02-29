requirements = [
  { name: "add the paper to the page",
    spec: "$frame.find('svg').length > 0",
    step_id: 9,
    position: 1,
    success: "You just made an HTML canvas to draw on."
  },
  {
    position: 1,
    name: 'add an ellipse for the face',
    spec: '$frame.find("svg ellipse").length > 0',
    step_id: 10,
    success: "You just drew an ellipse for the face."
  },
  {
    position: 2,
    spec: '$frame.find("svg ellipse").first().attr("rx") == "60"',
    name: "make the width 60",
    step_id: 10,
    success: "the third number that you added to ellipse set the width"
  },
  {
    position: 3,
    spec: '$frame.find("svg ellipse").first().attr("ry") == "80"',
    name: "make the height 80",
    step_id: 10,
    success: "and the last number set the height."
  },
  {
    position: 1,
    step_id: 12,
    name: "set the face color to saddlebrown",
    spec: '_.find($frame.find("svg ellipse"),((e)-> $(e).attr("fill").match(/#/i)))',
    success: "try changing the fill color with <a href='http://www.w3schools.com/html/html_colornames.asp' target='_blank'>this!</a>"
  },
  {
    position: 1,
    step_id: 13,
    name: "add 2 new ellipses for the ears",
    spec: '$frame.find("svg ellipse").length > 2',
    success: "an ellipse is like a circle, only more stretched."
  },
  {
    position: 2,
    step_id: 13,
    name: "set the x-coordinate (first number in the ellipse method) to be different for the second ear.",
    spec: '$frame.find("svg ellipse[cx=150]").length != 2',
    success: "when both ears were on top of each other you couldn't tell them apart.'"
  },
  {
    position: 3,
    step_id: 13,
    name: "give ears x-radius (the third number in the ellipse method) of approximately 40",
    spec: '
      ellipses = 0
      _.each($frame.find("svg ellipse"), (ellipse)->
        if $(ellipse).attr("rx") > 35 && $(ellipse).attr("rx") < 45
          ellipses += 1
      )
      if ellipses < 2
        return false
      else
        return true
      ',
      success: "the x radius controls how wide the ellipse is."
  },
  {
    position: 4,
    step_id: 13,
    name: "give ears y-radius (the fourth number in the ellipse method) of approximately 80",
    spec: '
      ellipses = 0
      _.each($frame.find("svg ellipse"), (ellipse)->
        if $(ellipse).attr("ry") > 75 && $(ellipse).attr("ry") < 85
          ellipses += 1
      )
      if ellipses < 2
        return false
      else
        return true
      ',
    success: "the y radius controls how tall the ellipse is."
  },
  {
    position: 1,
    step_id: 14,
    name: "color both ears saddlebrown",
    spec: '
      brownEllipses = 0
      _.each($frame.find("svg ellipse"), (ellipse)->
        if $(ellipse).attr("fill").match(/#/i)
          brownEllipses += 1
      )
      if brownEllipses < 3
        return false
      else
        return true
    ',
    success: "again, here are the <a href='http://www.w3schools.com/html/html_colornames.asp' target='_blank'>colors</a>."
  },
  {
    position: 1,
    step_id: 15,
    name: "rotate both ears",
    spec: '
      rotatedEllipses = 0
      _.each($frame.find("svg ellipse"), (ellipse)->
        if $(ellipse).attr("transform")
          rotatedEllipses += 1
      )
      if rotatedEllipses < 2
        return false
      else
        return true
    ',
    success: "When you use \"R20\" you rotate the ear 20&deg; clockwise. \"R-20\" will rotate it counterclockwise."
  },
  {
    position: 1,
    step_id: 16,
    name: "make 2 eyes with pupils",
    spec: '
      eyes = 0
      pupils = $frame.find("svg circle").length
      _.each($frame.find("svg ellipse"), (ellipse)->
        if $(ellipse).attr("fill").match(/#/i)
          eyes += 1
      )
      if (eyes >= 5 && pupils == 2) || (pupils == 0 && eyes >= 7)
        return true
      else
        return false
    '
  },
  {
    position: 1,
    step_id: 17,
    name: "make a nose that is wider than it is long",
    spec: '
      nose = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if parseInt($(ellipse).attr("rx"), 10) > parseInt($(ellipse).attr("ry"), 10)
          nose = true
      )
      return nose
    '
  },
  {
    position: 3,
    step_id: 17,
    name: "center the nose",
    spec: '
      nose = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if parseInt($(ellipse).attr("rx"),10) > parseInt($(ellipse).attr("ry"), 10)
          x = parseInt($(ellipse).attr("cx"), 10)
          if x >= 180 && x <= 220
            nose = true
      )
      return nose
    '
  },
  {
    position: 4,
    step_id: 17,
    name: "put the nose at the bottom of the face",
    spec: '
      nose = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if parseInt($(ellipse).attr("rx"),10) > parseInt($(ellipse).attr("ry"), 10)
          y = parseInt($(ellipse).attr("cy"), 10)
          if y <= 280
            nose = true
      )
      if nose == true
        nose = false
        _.each($frame.find("svg ellipse"), (ellipse)->
          y = parseInt($(ellipse).attr("cy"), 10)
          if y >= 270
            nose = true
        )
        return nose
      else
        return false
    '
  },
  {
    position: 5,
    step_id: 17,
    name: 'give the nose a color',
    spec: '
      nose = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if parseInt($(ellipse).attr("rx"),10) > parseInt($(ellipse).attr("ry"), 10)
          if $(ellipse).attr("fill").match(/#/i)
            nose = true
      )
      return nose
    '
  }
]
requirements.each do |req|
  if existing_req = Requirement.where(step_id: req[:step_id], position: req[:position]).first
    existing_req.update_attributes(req)
  else
    Requirement.create!(req)
  end
end
