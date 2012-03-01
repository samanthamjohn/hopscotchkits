steps = [
  {"id"=>5,
  "kit_id"=>2,
  "description"=>"To start out, we will need to create an svg. An svg is commonly used by programmers creating online games. ",
  "success_message"=>"good job! you've made your canvas. Now let's put something on it!",
  "position"=>1,
  "created_at"=>"Mon, 02 Jan 2012 23:58:19 UTC +00:00",
  "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
  "title"=>"Let's start at the very beginning, a very good place to start.",
  "hint"=>"Try using Raphael, an excellent drawing library for javascript on the web. \r\n\r\nTo create a Raphael paper (or svg) Raphael(0,0,300,300)",
  "solution"=>nil,
  "image_url"=>nil,
  "bonus"=>false,
  "freeplay"=>false,
  "more_info"=>nil},
  {"id"=>6,
    "kit_id"=>2,
    "description"=>"For your tic-tac-toe game, you'll need to create boxes where someone can click to play their turn. Let's create the first box!",
    "success_message"=>"Wonderful, you made the first box!",
    "position"=>2,
    "created_at"=>"Mon, 02 Jan 2012 23:58:19 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>nil,
    "hint"=>nil,
    "solution"=>nil,
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>7,
    "kit_id"=>2,
    "description"=>"This is great. Now we need 9 boxes. See if you can create them in a clever way. ",
    "success_message"=>"woohoo! 9 rectangles. wowza",
    "position"=>3,
    "created_at"=>"Tue, 03 Jan 2012 23:58:18 UTC +00:00",
    "updated_at"=>"Tue, 03 Jan 2012 23:58:18 UTC +00:00",
    "title"=>nil,
    "hint"=>nil,
    "solution"=>nil,
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>8,
    "kit_id"=>2,
    "description"=>"Now make sure they are not on top of each other. ",
    "success_message"=>"Woohoo, all the rectangles are in the right spot!",
    "position"=>4,
    "created_at"=>"Wed, 04 Jan 2012 04:07:51 UTC +00:00",
    "updated_at"=>"Wed, 04 Jan 2012 04:26:35 UTC +00:00",
    "title"=>nil,
    "hint"=>nil,
    "solution"=>nil,
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>9,
    "kit_id"=>3,
    "description"=>"Before we can draw a puppy, we need something to draw it on.  Type this: \r\n\r\n<code>makeWorkspace() </code>\r\n\r\ninto the code editor below, then hit \"Run This\".\r\n",
    "success_message"=>"You just made an HTML canvas. That's the latest fancy thing your browser can do- using a canvas lets you draw on a website!",
    "position"=>1,
    "created_at"=>"Thu, 05 Jan 2012 22:15:35 UTC +00:00",
    "updated_at"=>"Fri, 17 Feb 2012 21:01:42 UTC +00:00",
    "title"=>"The drawing board",
    "hint"=>"Make sure you copied it exactly, the code is case sensitive (\"case sensitive\" means it matters whether it is upper case or lower case).",
    "solution"=>"makeWorkspace()",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>"<code>makeWorkspace()</code> will create the paper to draw your puppy on. We added ruler marks to help you draw but they will go away for the final product."},
  {"id"=>10,
    "kit_id"=>3,
    "description"=>"To draw the face, we'll use an oval, also called an ellipse. \r\n\r\nBut first we need to save what you just made to a variable (like a nickname, so we can tell it to do stuff later).  Let's call it \"paper.\"\r\n\r\nGo back to line 1 and change it to say: \r\n\r\n<code>paper = makeWorkspace()</code>\r\n\r\nNow that you gave it a name, the computer will know what you're talking about when you want to call a method on it.  \r\n\r\nLet's call the <code> .ellipse </code> method on your new \"paper\". Go to line 2 and type:\r\n\r\n<code>paper.ellipse(200, 200, 60, 80)</code>\r\n",
    "success_message"=>"You just drew an ellipse on the page. An ellipse is like a circle but more stretched out. Remember- you wrote <code>paper.ellipse</code> with four numbers. The first two numbers were x and y. The second two were width and height. If you made width and height the same you would have a circle! ",
    "position"=>2,
    "created_at"=>"Thu, 05 Jan 2012 22:39:34 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"Puppy Face",
    "hint"=>"Make sure you've typed all of your code exactly as above and kept all the capitalizations and symbols the same.  ",
    "solution"=>"paper = makeWorkspace()\r\npaper.ellipse(200,200,60,80)",
    "image_url"=>"step2.png",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>"Go to line 2 and type:\r\n\r\n<code>paper.ellipse(200, 200, 60, 80)</code>\r\n"},
  {"id"=>12,
    "kit_id"=>3,
    "description"=>"Now we want to make the puppy's face brown. \r\n\r\nRemember how you saved your workspace as \"<code>paper</code>\"?\r\n\r\nNow you need to name your ellipse something.  How about\"<code>face</code>\"?  Change your second line to:\r\n\r\n<code> face = paper.ellipse(200,200,60,80) </code>\r\n\r\n\r\nNow we can set the color. We can use face.attr (short for <span style=\"font-style:italic\">attribute</span>) to set the color. \r\n\r\n<code>face.attr(\"fill\", \"saddlebrown\")</code>\r\n",
    "success_message"=>"You added color to the puppy's face by setting the <code>fill</code> attribute (that's what it means when you type <code>attr</code>) of it's face. We used saddlebrown but you can try other colors as well if you like. (try <a href=\"http://www.w3schools.com/html/html_colornames.asp\" target=\"_blank\">this!</a>)",
    "position"=>3,
    "created_at"=>"Fri, 06 Jan 2012 00:39:08 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"Adding Some Color",
    "hint"=>"Go back to line 2 and assign the variable <code>face</code> to <code>paper.ellipse(200,200,60,80)</code> by typing <code>face = </code> in front of it.  ",
    "solution"=>"paper = makeWorkspace()\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>13,
    "kit_id"=>3,
    "description"=>"Our puppy needs ears. Let's make 2 ellipses on the side of the head. \r\n\r\nHere's the code for the left ear.  Try the right one on your own.\r\n\r\n<code>paper.ellipse(150,215,40,80)</code>\r\n\r\nRemember: the ellipse parameters are: \r\n<code>paper.ellipse(<span style=\"color:Green \">\r\nx coordinate, \r\ny coordinate</span>, <span style=\"color:royalblue\">\r\nwidth, \r\nheight</blue>)</code>",
    "success_message"=>"you've added 2 new ellipses to your page for the ears. Are you getting the hang of the ellipse method? Again- the first two numbers are x and y (you can see them in the grid). The last two are width and height to give the ellipse size and stretch it out.",
    "position"=>4,
    "created_at"=>"Fri, 06 Jan 2012 00:48:29 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"Do your ears hang low?",
    "hint"=>"<code>rightEar=paper.ellipse(250,215,40,80)</code>\r\n",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\n\r\nrightEar=paper.ellipse(250,215,40,80)\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")",
    "image_url"=>"step4.jpg",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>14,
    "kit_id"=>3,
    "description"=>"Let's make the ears brown, the same shade as the face. Do you remember how to do this? \r\n\r\nMake sure the ears are *behind* the head, we don't want the backs of the ears sticking over the face.  Try experimenting by moving the lines of code into a different order to make this work.     ",
    "success_message"=>"You have set the <code>fill</code> attribute of each ear. Before they were clear, now they are colored in! Try customizing your puppy with different colors. (<a href=\"http://www.w3schools.com/html/html_colornames.asp\" target=\"_blank\">color chart</a>).",
    "position"=>5,
    "created_at"=>"Fri, 06 Jan 2012 15:41:50 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"Jazz up the ears",
    "hint"=>"The computer reads the code you've written from the top down, so to move the ears behind the head, you need to draw them first, before the face.  \r\n\r\nCut and paste the lines of code for \"rightEar\" and \"leftEar\" and move them above the code for \"face\".  ",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")\r\n",
    "image_url"=>"step5.png",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>15,
    "kit_id"=>3,
    "description"=>"The ears look a little droopy- let's try to rotate them. \r\n\r\n<code> .ellipse </code> has a method called <code> .transform </code> where you can rotate the object.  The syntax is \"R\" followed by the number of degrees.  \r\n\r\nTry \r\n\r\n<code>rightEar.transform(\"R90\")</code>. \r\n\r\nNow adjust the angle so that it looks like the picture. \r\n",
    "success_message"=>"You successfully used <code>transform</code>. When you use \"R20\" you rotated the ear 20&deg; clockwise. When you use \"R-20\" you will rotate it 20&deg; counter-clockwise. Pretty cool huh?",
    "position"=>6,
    "created_at"=>"Fri, 06 Jan 2012 15:46:21 UTC +00:00",
    "updated_at"=>"Fri, 17 Feb 2012 21:18:30 UTC +00:00",
    "title"=>"Perk up the ears",
    "hint"=>"For the left ear try <code>leftEar.transform(\"R-80\")</code>, see if you can adjust that negative angle to match the picture. ",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nleftEar.transform(\"R20\")\r\nrightEar.transform(\"R-20\")\r\n\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")\r\n",
    "image_url"=>"step6.png",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>16,
    "kit_id"=>3,
    "description"=>"Our puppy needs eyes. Let's make a white ellipse for the eye with a black circle in the middle for the pupil. Try to make it look like the picture. \r\n\r\nYou can make a circle either by creating an ellipse with equal width and height or calling the circle method that only takes a radius. ",
    "success_message"=>"Hopefully that additional practice using <code>ellipse</code> and <code>circle</code> have made you an expert. There's just one more thing to add and then you can let your creativity flow. ",
    "position"=>7,
    "created_at"=>"Fri, 06 Jan 2012 16:15:57 UTC +00:00",
    "updated_at"=>"Fri, 17 Feb 2012 21:20:24 UTC +00:00",
    "title"=>"Puppy eyes",
    "hint"=>"Try this for the left eye, see if you can mirror it on the right. \r\n\r\n<code>\r\nleftEyeOuter = paper.ellipse(175, 175, 12,15)\r\nleftEye = paper.circle(175, 170, 7)\r\n</code>",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nleftEar.transform(\"R20\")\r\nrightEar.transform(\"R-20\")\r\n\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")\r\n\r\n\r\nleftEyeOuter = paper.ellipse(175, 175, 12,15).attr(\"fill\", \"white\")\r\nleftEye = paper.circle(175, 170, 7).attr(\"fill\", \"black\")\r\nrightEyeOuter = paper.ellipse(225, 175, 12,15).attr(\"fill\", \"white\")\r\nrightEye = paper.circle(225, 170, 7).attr(\"fill\", \"black\")",
    "image_url"=>"step7.png",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>17,
    "kit_id"=>3,
    "description"=>"The last thing we need is a nose. \r\n\r\nLet's make a black, oblong oval at the end of the face. ",
    "success_message"=>"Your puppy is complete- now click Next to see your very own website with for your puppy. You can give her a name, share with your friends and even come back and keep coding to make your puppy even better. ",
    "position"=>8,
    "created_at"=>"Fri, 06 Jan 2012 16:19:59 UTC +00:00",
    "updated_at"=>"Fri, 17 Feb 2012 21:22:23 UTC +00:00",
    "title"=>"The nose knows",
    "hint"=>"Try making the width (3rd parameter) bigger than the height (4th parameter). ",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nleftEar.transform(\"R20\")\r\nrightEar.transform(\"R-20\")\r\n\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")\r\n\r\n\r\nleftEyeOuter = paper.ellipse(175, 175, 12,15).attr(\"fill\", \"white\")\r\nleftEye = paper.circle(175, 170, 7).attr(\"fill\", \"black\")\r\nrightEyeOuter = paper.ellipse(225, 175, 12,15).attr(\"fill\", \"white\")\r\nrightEye = paper.circle(225, 170, 7).attr(\"fill\", \"black\")\r\n\r\nnose = paper.ellipse(200, 273, 25,10).attr(\"fill\", \"black\")\r\n",
    "image_url"=>"step8.png",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>18,
    "kit_id"=>4,
    "description"=>"Now we need to make our dog a nice shade of brown. We want to set the oval's \"fill\" attribute to \"saddlebrown\". We change attributes of the ellipse with the \"attr\" method.\r\n\r\n<code>face.attr(\"fill\", \"saddlebrown\")</code>\r\n\r\nyou will want to assign the \"face\" variable to your ellipse so that you can call attr.",
    "success_message"=>"Look at that vicious dawg! ",
    "position"=>3,
    "created_at"=>"Fri, 06 Jan 2012 00:39:08 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"Adding Some Color",
    "hint"=>"Try typing in the code block and make sure you've assigned face to the ellipse. ",
    "solution"=>"paper = makeWorkspace()\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")",
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>19,
    "kit_id"=>4,
    "description"=>"Our puppy needs ears. Let's make 2 ellipses on the side of the head. See if you can put the ears behind the head. ",
    "success_message"=>"Woof! You hear that? your dog did. ",
    "position"=>4,
    "created_at"=>"Fri, 06 Jan 2012 00:48:29 UTC +00:00",
    "updated_at"=>"Fri, 06 Jan 2012 00:54:32 UTC +00:00",
    "title"=>"Do your ears hang low?",
    "hint"=>"Try making ellipses just a little smaller than the head and offset on the center coordinate (that's the first argument). ",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")",
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>20,
    "kit_id"=>4,
    "description"=>"First, let's make the ears brown, the same shade as the face. Do you remember how to do this? \r\n\r\nMake sure the ears are *behind* the head, we don't want the backs of the ears sticking over the face. Try experimenting with moving the code around, maybe if you make the ears before the face they will be float behind it. ",
    "success_message"=>"Brown ears! Awesome!",
    "position"=>5,
    "created_at"=>"Fri, 06 Jan 2012 15:41:50 UTC +00:00",
    "updated_at"=>"Fri, 06 Jan 2012 16:12:46 UTC +00:00",
    "title"=>"Jazz up the ears",
    "hint"=>"Try using the .attr(\"fill\", \"saddlebrown\") method on each of the ears. ",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")\r\n",
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>21,
    "kit_id"=>4,
    "description"=>"The ears look a little droopy- let's try to rotate them. \r\n\r\nA paper ellipse has a method called \"transform\" where you can pass in a string showing how you want to transform the object. If you pass in \"R\" for rotate followed by the number of degrees you want to rotate you can make the ears rotate around their center. \r\n\r\nTry rightEar.transform(\"R90\"). Now adjust the angle so that it looks like the picture. \r\n\r\nTry it with a negative angle for the left ear. ",
    "success_message"=>"Looking good dawg. ",
    "position"=>6,
    "created_at"=>"Fri, 06 Jan 2012 15:46:21 UTC +00:00",
    "updated_at"=>"Fri, 06 Jan 2012 16:12:08 UTC +00:00",
    "title"=>"Perk up the ears",
    "hint"=>"For the left ear try leftEar.transform(\"R-80\"), see if you can adjust that negative angle to match the picture. ",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nleftEar.transform(\"R20\")\r\nrightEar.transform(\"R-20\")\r\n\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")\r\n",
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>22,
    "kit_id"=>4,
    "description"=>"Our puppy needs eyes. Let's make a white ellipse for the eye with a black circle in the middle for the pupil. Try to make it look like the picture. \r\n\r\nYou can make a circle either by creating an ellipse with equal width and height or calling the circle method that only takes a radius. ",
    "success_message"=>"I'm lookin' at you! ",
    "position"=>7,
    "created_at"=>"Fri, 06 Jan 2012 16:15:57 UTC +00:00",
    "updated_at"=>"Fri, 06 Jan 2012 16:15:57 UTC +00:00",
    "title"=>"Puppy eyes",
    "hint"=>"Try this for the left eye, see if you can mirror it on the right. \r\n\r\n\r\nleftEyeOuter = paper.ellipse(175, 175, 12,15)\r\nleftEye = paper.circle(175, 170, 7)",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nleftEar.transform(\"R20\")\r\nrightEar.transform(\"R-20\")\r\n\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")\r\n\r\n\r\nleftEyeOuter = paper.ellipse(175, 175, 12,15).attr(\"fill\", \"white\")\r\nleftEye = paper.circle(175, 170, 7).attr(\"fill\", \"black\")\r\nrightEyeOuter = paper.ellipse(225, 175, 12,15).attr(\"fill\", \"white\")\r\nrightEye = paper.circle(225, 170, 7).attr(\"fill\", \"black\")",
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>23,
    "kit_id"=>4,
    "description"=>"The last thing we need is a nose. \r\n\r\nLet's make a black, oblong oval at the end of the face. ",
    "success_message"=>"Woohoo! You made a puppy face!! ",
    "position"=>8,
    "created_at"=>"Fri, 06 Jan 2012 16:19:59 UTC +00:00",
    "updated_at"=>"Thu, 12 Jan 2012 17:27:48 UTC +00:00",
    "title"=>"The nose knows",
    "hint"=>"Try making the width (3rd parameter) bigger than the height (1st parameter). ",
    "solution"=>"paper = makeWorkspace()\r\n\r\nleftEar=paper.ellipse(150,215,40,80)\r\nleftEar.attr(\"fill\", \"saddleBrown\")\r\nrightEar=paper.ellipse(250,215,40,80)\r\nrightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\nleftEar.transform(\"R20\")\r\nrightEar.transform(\"R-20\")\r\n\r\n\r\nface = paper.ellipse(200,200,60,80)\r\nface.attr(\"fill\", \"saddlebrown\")\r\n\r\n\r\nleftEyeOuter = paper.ellipse(175, 175, 12,15).attr(\"fill\", \"white\")\r\nleftEye = paper.circle(175, 170, 7).attr(\"fill\", \"black\")\r\nrightEyeOuter = paper.ellipse(225, 175, 12,15).attr(\"fill\", \"white\")\r\nrightEye = paper.circle(225, 170, 7).attr(\"fill\", \"black\")\r\n\r\nnose = paper.ellipse(200, 273, 25,10).attr(\"fill\", \"black\")\r\n",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>24,
    "kit_id"=>4,
    "description"=>"Before we can draw a puppy, we need a piece of paper. To get your paper, type this: \r\n\r\n<code>makeWorkspace() </code>\r\n\r\ninto the editor",
    "success_message"=>"Woohoo! Now you're ready to start drawing.",
    "position"=>1,
    "created_at"=>"Thu, 05 Jan 2012 22:15:35 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"The drawing board",
    "hint"=>"Make sure you copied it exactly, the code is case sensitive (\"case sensitive\" means it matters whether it is upper case or lower case).",
    "solution"=>"makeWorkspace()",
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>25,
    "kit_id"=>4,
    "description"=>"The first thing we will draw is the face. We will use a long oval &emdash; also known as an <a href=\"http://www.merriam-webster.com/dictionary/ellipse\">ellipse</a>. \r\n\r\nYour paper has a method called ellipse but in order to use it we need a reference to the paper object. To do this we will set a variable. We set variables like so:\r\n\r\n<code>x = 1</code>\r\n\r\nNow the variable called <code>x</code> has the value 1. Try setting a variable called <code>paper</code> to the value of <code>makeWorkspace()</code>. Once you've done that it would be a good time to click run it to see if you have that bit correct. Did it work? OK, now we need to draw our ellipse on the paper. Ellipses look like this:\r\n\r\n<code>paper.ellipse(center-horizontal, center-vertical, width, height)</code>\r\n\r\nwhere center-horizontal is the oval's position left to right on the paper, center-vertical is the oval's position top to bottom, and width and height control the size of the oval.\r\n\r\nLet\'s make an oval in the center of our paper, at center-vertical 200, center-horizontal 200, and with a width of 60 and a height of 80",
    "success_message"=>"Great work. Our puppy has a head. He\"ll need that.",
    "position"=>2,
    "created_at"=>"Thu, 05 Jan 2012 22:39:34 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"Puppy Face",
    "hint"=>"This would make an ellipse at 100 left, 100 down, and with a width of 40 and a height of 60:\r\n\r\npaper = makeWorkspace()\r\npaper.ellipse(100, 100, 40, 60)\r\n\r\nHow can we make an ellipse at 200 left, 200 down, and with a width of 60 and a height of 80?",
    "solution"=>"paper = makeWorkspace()\r\nface=paper.ellipse(200,200,60,80)",
    "image_url"=>nil,
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>26,
    "kit_id"=>5,
    "description"=>"We're going to start with the puppy from the previous kit. \r\n\r\nLet's save time and copy our code from last time: \r\n<code>\r\n\r\npaper = makeWorkspace()\r\n\r\n  leftEar=paper.ellipse(150,215,40,80)\r\n  leftEar.attr(\"fill\", \"saddleBrown\")\r\n  rightEar=paper.ellipse(250,215,40,80)\r\n  rightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\n  leftEar.transform(\"R20\")\r\n  rightEar.transform(\"R-20\")\r\n\r\n  face = paper.ellipse(200,200,60,80)\r\n  face.attr(\"fill\", \"saddlebrown\")\r\n\r\n  leftEyeOuter = paper.ellipse(175, 175, 12,15).attr(\"fill\", \"white\")\r\n  leftEye = paper.ellipse(175, 170, 7, 7).attr(\"fill\", \"black\")\r\n  rightEyeOuter = paper.ellipse(225, 175, 12,15).attr(\"fill\", \"white\")\r\n  rightEye = paper.ellipse(225, 170, 7, 7).attr(\"fill\", \"black\")\r\n\r\n  nose = paper.ellipse(200, 273, 25,10).attr(\"fill\", \"black\")\r\n\r\n</code>",
    "success_message"=>"Woohoo! Cute dog. ",
    "position"=>1,
    "created_at"=>"Tue, 10 Jan 2012 02:04:33 UTC +00:00",
    "updated_at"=>"Tue, 10 Jan 2012 02:17:31 UTC +00:00",
    "title"=>"Draw the puppy",
    "hint"=>"We've put drawPuppy into a function. ",
    "solution"=>"\r\npaper = makeWorkspace()\r\n\r\n  leftEar=paper.ellipse(150,215,40,80)\r\n  leftEar.attr(\"fill\", \"saddleBrown\")\r\n  rightEar=paper.ellipse(250,215,40,80)\r\n  rightEar.attr(\"fill\", \"saddleBrown\")\r\n\r\n  leftEar.transform(\"R20\")\r\n  rightEar.transform(\"R-20\")\r\n\r\n  face = paper.ellipse(200,200,60,80)\r\n  face.attr(\"fill\", \"saddlebrown\")\r\n\r\n  leftEyeOuter = paper.ellipse(175, 175, 12,15).attr(\"fill\", \"white\")\r\n  leftEye = paper.ellipse(175, 170, 7, 7).attr(\"fill\", \"black\")\r\n  rightEyeOuter = paper.ellipse(225, 175, 12,15).attr(\"fill\", \"white\")\r\n  rightEye = paper.ellipse(225, 170, 7, 7).attr(\"fill\", \"black\")\r\n\r\n  nose = paper.ellipse(200, 273, 25,10).attr(\"fill\", \"black\")",
    "image_url"=>"step8.png",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>27,
    "kit_id"=>3,
    "description"=>"Welcome to freeplay mode. \r\n\r\nYou can make your puppy do anything you want here. \r\n\r\nSome ideas of drawing methods you can use are: \r\n\r\n<code>paper.rect(center-x, center-y, width, height)</code>\r\n\r\n<code>paper.text(center-x, center-y, text)</code>\r\n\r\nYou can check <a href=\"http://raphaeljs.com/reference.html\" target=\"_blank\">Raphael JS</a>, our drawing library for more info on these and many other methods. \r\n\r\nFor a list of colors we recommend this <a href=\"http://www.w3schools.com/html/html_colornames.asp\" target=\"_blank\"> color names table</a>. \r\n\r\nHappy  coding!",
    "success_message"=>"",
    "position"=>9,
    "created_at"=>"Fri, 13 Jan 2012 03:43:16 UTC +00:00",
    "updated_at"=>"Fri, 13 Jan 2012 16:34:10 UTC +00:00",
    "title"=>"Let your creativity flow",
    "hint"=>"No hints- just follow your heart!",
    "solution"=>"",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>true,
    "more_info"=>nil},
  {"id"=>28,
    "kit_id"=>7,
    "description"=>"If you were to write out a quiz, the first thing you'd need is a piece of paper to write it on.  Same thing with our computer quiz--you need the equivalent of a piece of paper.  \r\n\r\nSo the first set of instructions we need to give to the computer will make the paper for the quiz. \r\nSo first type this:\r\n\r\n<code>makeWorkspace()</code>\r\n\r\nand then hit \"run this\". ",
    "success_message"=>"What you've made by typing \"makeWorkspace()\" is an html canvas element.  It's the digital version of laying down a sheet of paper to begin writing on.",
    "position"=>1,
    "created_at"=>"Wed, 15 Feb 2012 14:56:56 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"Creating the workspace",
    "hint"=>"Make sure you copied it exactly, when you're writing code it matters whether each letter is upper case or lower case. \r\n",
    "solution"=>"makeWorkspace()",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>29,
    "kit_id"=>7,
    "description"=>"We're going to give the workspace a nickname: \"paper\". This is so that we can tell it what to do later. This is common in programming – you'll use a nickname so that you can talk to a piece of code later on in your program. \r\n\r\nSo now go back to line 1 and change it to:\r\n\r\n<code>paper = makeWorkspace()</code>",
    "success_message"=>"What you've done is created a variable called \"paper\". A variable is what computer programmers call these nicknames. ",
    "position"=>2,
    "created_at"=>"Wed, 15 Feb 2012 15:01:45 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 22:23:18 UTC +00:00",
    "title"=>"Creating a variable",
    "hint"=>"You don\"t need to call your workspace paper- you can use any nickname you like. Naming it paper will just make it easier for you to follow along the instructions later since we will call it paper.",
    "solution"=>"paper = makeWorkspace()",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>nil},
  {"id"=>30,
    "kit_id"=>7,
    "description"=>"The way we will change the background color is to place a colored rectangle over the grid. In the program we are using you can't actually change the color of the background so the next best thing to do is put something on top of it. It's like putting a tablecloth over your table. \r\n\r\nTo make a rectangle, type:\r\n\r\n<code>background = paper.rect(0,0,400,400)</code>\r\n\r\nThen: \r\n\r\n<code>background.attr(\"fill\", \"royalblue\")</code>\r\n\r\nWe gave the rectangle the nickname \"background\" because we still wanted to talk to it. ",
    "success_message"=>"Great, you made a background rectangle and filled it in with royal blue. \r\n\r\nIf you want to change the color now try one of <a href='http://w3schools.com/html/html_colornames.asp' target=\"_blank\">these</a>.",
    "position"=>3,
    "created_at"=>"Wed, 15 Feb 2012 20:47:26 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 19:54:47 UTC +00:00",
    "title"=>"Background Color",
    "hint"=>"",
    "solution"=>"paper = makeWorkspace()\r\nbackground = paper.rect(0,0,400,400)\r\nbackground.attr('fill', 'royalblue')",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>"You'll also notice that we used paper again, that nickname allowed us to add things to the paper. We'll continue to use that as we build up our game. \r\n\r\nThe first line of code creates a square. The x,y coordinates were set by the first 2 numbers used by the rectangle. The height and width were set by the last 2 numbers.\r\n\r\nLastly, we added the color by setting the 'fill' attribute of the background. "},
  {"id"=>31,
    "kit_id"=>7,
    "description"=>"So to make a quiz we will need to start with a question. \r\n\r\nJust like we drew a rectangle before, now we can do some writing. \r\n\r\nTry:\r\n<code>question=paper.text(200,50,\"How cold is it today?\")</code>\r\n\r\nThe first 2 numbers are the x and y coordinates. Try changing them around to move your question around the paper.\r\n",
    "success_message"=>"Now you have a question, but it's not very interesting. Why don't you try changing it to something you come up with? ",
    "position"=>4,
    "created_at"=>"Wed, 29 Feb 2012 20:13:01 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 20:13:01 UTC +00:00",
    "title"=>"That is the question",
    "hint"=>"",
    "solution"=>"paper = makeWorkspace() \r\nbackground = paper.rect(0,0,400,400) \r\nbackground.attr('fill', 'royalblue')\r\n\r\nquestion = paper.text(200, 50, \"How cold is it today?\")",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>"If you want we can also change around the colors and fonts a bit by using \"attr\".\r\n\r\nTry this:\r\n\r\n<code>question.attr(\"fill\" : 'white', 'font-family' : 'Helvetica', 'font-size' : 20) </code>\r\n\r\nYou can adjust the fill color, font-family and font-size to change the look. \r\n  "},
  {"id"=>32,
    "kit_id"=>7,
    "description"=>"Now let's come up with some answers to choose from. \r\n\r\nHere's one to start you off: \r\n\r\n<code> answer1 = paper.text(200, 80, \"a little nippy out there\") </code>\r\n\r\nCreate at least 3 possible answers to your question. ",
    "success_message"=>"Awesome! Now there are some answers to choose from. ",
    "position"=>5,
    "created_at"=>"Wed, 29 Feb 2012 20:32:30 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 20:34:24 UTC +00:00",
    "title"=>"I have an answer",
    "hint"=>"You will need to figure out the right placement of answers. The second number is the vertical placement. Try moving your answers up and down. ",
    "solution"=>"paper = makeWorkspace()\r\nbg = paper.rect(0,0,400, 400)\r\nbg.attr('fill', 'yellow')\r\nquestion = paper.text(200, 50, \"How cold is it today?\")\r\n\r\nanswer1 = paper.text(200, 80, \"a little nippy out there\") \r\nanswer2 = paper.text(200, 120, \"spring-like\") \r\nanswer3 = paper.text(200, 160, \"watch out for global warming\") ",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>""},
  {"id"=>33,
    "kit_id"=>7,
    "description"=>"Here's something new: <code>alert</code>.\r\n\r\nAlert is built into your browser. It will open a popup window with whatever words you put inside the parentheses. Let's try it out- type: \r\n\r\n<code>alert(\"Woohoo I'm a popup!\")</code>",
    "success_message"=>"Try running your code again- every time you click \"run this\" the popup comes up again.",
    "position"=>6,
    "created_at"=>"Wed, 29 Feb 2012 20:39:00 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 23:20:31 UTC +00:00",
    "title"=>"ALERT! ALERT!",
    "hint"=>"Make sure you have quotes around your words, it won't work otherwise. ",
    "solution"=>"paper = makeWorkspace()\r\nbg = paper.rect(0,0,400, 400)\r\nbg.attr('fill', 'yellow')\r\nquestion = paper.text(200, 50, \"How cold is it today?\")\r\n\r\nanswer1 = paper.text(200, 80, \"a little nippy out there\") \r\nanswer2 = paper.text(200, 120, \"spring-like\") \r\nanswer3 = paper.text(200, 160, \"watch out for global warming\") \r\n\r\nalert('Woohoo! I am an alert.')",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>""},
  {"id"=>34,
    "kit_id"=>7,
    "description"=>"There's one more thing we have to learn before we can finish the quiz. \r\n\r\nErase the line with the alert from the last step. That popup will get annoying! \r\n\r\nNow type: \r\n<code>\r\ncorrectAnswer = ->\r\n &nbsp;&nbsp;alert(\"Correct!\")\r\n</code>\r\n\r\nTry running the code- nothing should happen, your alert is gone!\r\n\r\nNow add:\r\n<code> correctAnswer() </code>\r\n\r\nWhen you click 'run this' your alert should be back. \r\n\r\n",
    "success_message"=>"You didn't know it, but you've been using functions all along. Everytime you type a word followed by parentheses you are using a function that someone else wrote for you. ",
    "position"=>7,
    "created_at"=>"Wed, 29 Feb 2012 22:47:42 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 23:22:33 UTC +00:00",
    "title"=>"Function",
    "hint"=>"Make sure your indentation is correct (that's the number of spaces at the start of each line). You want to press the tab key at the beginning of the second line.",
    "solution"=>"paper = makeWorkspace()\r\nbg = paper.rect(0,0,400, 400)\r\nbg.attr('fill', 'yellow')\r\nquestion = paper.text(200, 50, \"How cold is it today?\")\r\n\r\nanswer1 = paper.text(200, 80, \"a little nippy out there\") \r\nanswer2 = paper.text(200, 120, \"spring-like\") \r\nanswer3 = paper.text(200, 160, \"watch out for global warming\")\r\n \r\ncorrectAnswer = ->\r\n  alert(\"Correct!\")\r\n\r\ncorrectAnswer()",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>"You just wrote your first function named correctAnswer!\r\n\r\nA function is a way to of saving code that you want to use later, It's similar to the way we nicknamed our paper by using a variable when we wanted to talk to it later. \r\n\r\nIn this case, we don't want to show an alert when we open the page, we want show it only after you have clicked the correct answer. In the next step we'll find out where we want to use the function. "},
  {"id"=>35,
    "kit_id"=>7,
    "description"=>"Now that we have our code saved in a function, we are ready to use it. \r\n\r\nErase the line <code> correctAnswer() </code>\r\n\r\nThe whole point of writing the function was to save it for later so we don't want to jump the gun by using it to early! \r\n\r\nNow your text actually has a function of its own called click. \r\nTry:\r\n\r\n<code>answer3.click(correctAnswer)</code>\r\n",
    "success_message"=>"Amazing! Now try clicking on the correct answer. \r\n",
    "position"=>8,
    "created_at"=>"Wed, 29 Feb 2012 22:50:14 UTC +00:00",
    "updated_at"=>"Wed, 29 Feb 2012 23:21:22 UTC +00:00",
    "title"=>"Bringing it all together",
    "hint"=>"answer3 may not be the correct answer- make sure you use the actual name of the answer you've chosen. ",
    "solution"=>"paper = makeWorkspace()\r\nbg = paper.rect(0,0,400, 400)\r\nbg.attr('fill', 'yellow')\r\nquestion = paper.text(200, 50, \"How cold is it today?\")\r\n\r\nanswer1 = paper.text(200, 80, \"a little nippy out there\") \r\nanswer2 = paper.text(200, 120, \"spring-like\") \r\nanswer3 = paper.text(200, 160, \"watch out for global warming\") \r\n\r\ncorrectAnswer = ->\r\n  alert(\"Correct!\")\r\n\r\nanswer3.click(correctAnswer)",
    "image_url"=>"",
    "bonus"=>false,
    "freeplay"=>false,
    "more_info"=>"Click works by taking the name of a function. Then, when a user clicks on it, the code in the function will be run. \r\n\r\nSo to recap- you created a function called correctAnswer() so that your code could be used later. Now, you've told the answer to use that function whenever someone clicks on it. \r\n\r\nRun your code and try it out!"}
]

steps.each do |step|
  if existing_step = Step.where(kit_id: step["kit_id"]).where(position: step["position"]).first
    existing_step.update_attributes(step)
  else
    new_step = Step.new(step)
    new_step.id = step["id"]
    new_step.save
  end
end
