requirements = [
  { name: "add the paper to the page",
    spec: "$frame.find('svg').length > 0",
    position: 1,
    success: "You just made an HTML canvas to draw on.",
    step: 1,
    kit: "quiz"
  },
  { name: "assign a variable to the paper",
    spec: 'editor.getSession().getValue().match(/\=/)',
    position: 1,
    step: 2,
    kit: "quiz"
  },
  { name: "set the background color",
    spec: '
    colored_rects = 0
    _.each($frame.find("svg rect"), (rect) ->
      if $(rect).attr("fill").match(/#/i) &&
      $(rect).attr("width") >= 399 && $(rect).attr("height") >= 399
        colored_rects += 1
    )
    if colored_rects > 1
      return true
    else
      return false
    ',
    position: 1,
    success: "Great, now you have a nice color in your background",
    step: 3,
    kit: "quiz"
  },
  {
    name: "add a question",
    step: 4,
    kit: "quiz",
    position: 1,
    spec: "
      $frame.find('svg text').length > 6
    "
  },
  {
    name: "add at least 3 answers",
    step: 5,
    kit: "quiz",
    position: 1,
    spec: "
      $frame.find('svg text').length > 9
    "
  },
  {
    step: 6,
    position: 1,
    kit: 'quiz',
    name: 'Add an alert to the page',
    spec: 'editor.getSession().getValue().match(/alert/)'
  },
  {
    step: 7,
    position: 1,
    kit: 'quiz',
    name: 'Add a click to one of the answers',
    spec: '
      editor.getSession().getValue().match(///
        answer\d.click\(*.+->*.+
        \r\n .+alert\(*.+\)
        [^]*\)
      ///)
    '
  },
  {
    step: 8,
    position: 1,
    kit: 'quiz',
    name: 'Add a new background to the click',
    spec: '
      editor.getSession().getValue().match(///
        answer\d.click\(*.+->*.+
        \r\n\s+alert\(*.+\)
        \r\n\s+.+paper.rect\(*.+\)
        [^]+attr*.+fill*.+\)
        [^]*\)
      ///)
    '
  },
  {
    step: 9,
    position: 1,
    kit: 'quiz',
    name: 'Add a new question on the click',
    spec: '
      editor.getSession().getValue().match(///
        answer\d.click\(*.+->*.+
        \r\n\s+alert\(*.+\)
        \r\n\s+.+paper.rect\(*.+\)[^]+attr*.+fill*.+\)*.+
        [^]+\r\n\s+.+paper.text\(*.+\)[^]*\)
      ///)
    '
  },
  {
    step: 9,
    position: 2,
    kit: 'quiz',
    name: 'Add at least 1 new answer on the click',
    spec: '
      editor.getSession().getValue().match(///
        answer\d.click\(*.+->*.+
        \r\n\s+alert\(*.+\)
        \r\n\s+.+paper.rect\(*.+\)[^]+attr*.+fill*.+\)*.+
        [^]+\r\n\s+.+paper.text
        [^]+\r\n\s+.+paper.text
        [^]*\)
      ///)
    '
  },
  {
    step: 10,
    position: 1,
    kit: 'quiz',
    name: 'Add a click to the correct answer',
    spec: '
      editor.getSession().getValue().match(///
        answer\d.click\(*.+->*.+
        [^]+paper.text\(*.+\)
        [^]+.click\(*.+->*.+
        \r\n\s+alert\(*.+\)*.+\)
        [^]*\)
      ///)
    '
  },
  { name: "add the paper to the page",
    spec: "$frame.find('svg').length > 0",
    step: 1,
    kit: "puppy",
    position: 1,
    success: "You just made an HTML canvas to draw on."
  },
  {
    position: 1,
    name: 'add an ellipse for the face',
    spec: '$frame.find("svg ellipse").length > 0',
    step: 2,
    kit: "puppy",
    success: "You just drew an ellipse for the face."
  },
  {
    position: 2,
    spec: '
      face = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if $(ellipse).attr("rx") == "60"
          face = true
      )
      return face
    ',
    name: "make the width 60",
    step: 2,
    kit: "puppy",
    success: "the third number that you added to ellipse set the width"
  },
  {
    position: 3,
    spec: '
      face = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if $(ellipse).attr("ry") == "80"
          face = true
      )
      return face
    ',
    name: "make the height 80",
    step: 2,
    kit: "puppy",
    success: "and the last number set the height."
  },
  {
    position: 1,
    step: 3,
    kit: 'puppy',
    name: "set the face color to saddlebrown",
    spec: '_.find($frame.find("svg ellipse"),((e)-> $(e).attr("fill").match(/#/i)))',
    success: "try changing the fill color with <a href='http://www.w3schools.com/html/html_colornames.asp' target='_blank'>this!</a>"
  },
  {
    position: 1,
    step: 4,
    kit: "puppy",
    name: "add 2 new ellipses for the ears",
    spec: '$frame.find("svg ellipse").length > 2',
    success: "an ellipse is like a circle, only more stretched."
  },
  {
    position: 2,
    step: 4,
    kit: "puppy",
    name: "make sure the x-coordinate (first number in the ellipse method) is different for each ear",
    spec: '$frame.find("svg ellipse[cx=150]").length != 2',
    success: "when both ears were on top of each other you couldn't tell them apart.'"
  },
  {
    position: 3,
    step: 4,
    kit: "puppy",
    name: "give both ears x-radius (the third number in the ellipse method) of approximately 40",
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
    step: 4,
    kit: "puppy",
    name: "give both ears y-radius (the fourth number in the ellipse method) of approximately 80",
    spec: '
      ellipses = 0
      _.each($frame.find("svg ellipse"), (ellipse)->
        if $(ellipse).attr("ry") > 75 && $(ellipse).attr("ry") < 85
          ellipses += 1
      )
      if ellipses < 3
        return false
      else
        return true
      ',
    success: "the y radius controls how tall the ellipse is."
  },
  {
    position: 1,
    name: "color both ears saddlebrown",
    step: 5,
    kit: "puppy",
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
    step: 6,
    kit: "puppy",
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
    step: 7,
    kit: "puppy",
    name: "make the outer left eye",
    spec: '
      eye = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if ($(ellipse).attr("fill").match(/#/i) &&
        $(ellipse).attr("cx") >= 170 && $(ellipse).attr("cx") <= 185 &&
        $(ellipse).attr("cy") >= 170 && $(ellipse).attr("cy") <= 185 &&
        $(ellipse).attr("rx") < 15 && $(ellipse).attr("ry") < 18)
          eye = true
      )
      return eye
    '
  },
  {
    position: 2,
    step: 7,
    kit: "puppy",
    name: "make the left pupil (smaller than 11px)",
    spec: '
      eye = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if ($(ellipse).attr("fill").match(/#/i) &&
        $(ellipse).attr("cx") >= 170 && $(ellipse).attr("cx") <= 185 &&
        $(ellipse).attr("cy") >= 165 && $(ellipse).attr("cy") <= 180 &&
        $(ellipse).attr("rx") < 11 && $(ellipse).attr("ry") < 11)
          eye = true
      )
      _.each($frame.find("svg circle"), (circle) ->
        if ($(circle).attr("fill").match(/#/i) &&
        $(circle).attr("cx") >= 170 && $(circle).attr("cx") <= 185 &&
        $(circle).attr("cy") >= 165 && $(circle).attr("cy") <= 180 &&
        $(circle).attr("r") < 11)
          eye = true
      )
      return eye
    '
  },
  {
    position: 3,
    step: 7,
    kit: "puppy",
    name: "make the outer right eye",
    spec: '
      eye = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if ($(ellipse).attr("fill").match(/#/i) &&
        $(ellipse).attr("cx") >= 220 && $(ellipse).attr("cx") <= 235 &&
        $(ellipse).attr("cy") >= 170 && $(ellipse).attr("cy") <= 185 &&
        $(ellipse).attr("rx") < 15 && $(ellipse).attr("ry") < 18)
          eye = true
      )
      return eye
    '
  },
  {
    position: 4,
    step: 7,
    kit: "puppy",
    name: "make the right pupil (smaller than 11px)",
    spec: '
      eye = false
      _.each($frame.find("svg ellipse"), (ellipse)->
        if ($(ellipse).attr("fill").match(/#/i) &&
        $(ellipse).attr("cx") >= 220 && $(ellipse).attr("cx") <= 235 &&
        $(ellipse).attr("cy") >= 165 && $(ellipse).attr("cy") <= 180 &&
        $(ellipse).attr("rx") < 11 && $(ellipse).attr("ry") < 11)
          eye = true
      )
      _.each($frame.find("svg circle"), (circle) ->
        if ($(circle).attr("fill").match(/#/i) &&
        $(circle).attr("cx") >= 220 && $(circle).attr("cx") <= 235 &&
        $(circle).attr("cy") >= 165 && $(circle).attr("cy") <= 180 &&
        $(circle).attr("r") < 11)
          eye = true
      )
      return eye
    '
  },
  {
    position: 1,
    step: 8,
    kit: "puppy",
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
    position: 2,
    step: 8,
    kit: "puppy",
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
    position: 3,
    step: 8,
    kit: "puppy",
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
    position: 4,
    step: 8,
    kit: "puppy",
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
  kit = Kit.find_by_slug(req.delete(:kit))
  step = Step.where(kit_id: kit.id).where(position: req.delete(:step)).first
  req[:step_id] = step.id

  if existing_req = Requirement.where(step_id: req[:step_id], position: req[:position]).first
    existing_req.update_attributes(req)
  else
    Requirement.create!(req)
  end
end
