paper = Raphael(0,0,400,400)

leftEar = paper.ellipse(150, 215, 40,80).attr('fill', 'saddlebrown')
leftEar.transform("R20")
rightEar = paper.ellipse(250, 215, 40,80).attr('fill', 'saddlebrown')
rightEar.transform("R-20")

face = paper.ellipse(200,200,60,80).attr('fill', 'saddlebrown')

leftEyeOuter = paper.ellipse(175, 175, 12,15).attr('fill', 'white')
leftEye = paper.circle(175, 170, 7).attr('fill', 'black')
rightEyeOuter = paper.ellipse(225, 175, 12,15).attr('fill', 'white')
rightEye = paper.circle(225, 170, 7).attr('fill', 'black')

nose = paper.ellipse(200, 273, 25,10).attr('fill', 'black')
