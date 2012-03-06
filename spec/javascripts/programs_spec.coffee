describe("Programs", ->
  describe("startEditor", ->
    it("should run the specs after a 700ms timeout", ->
      jasmine.Clock.useMock()
      $("#jasmine_content").append("<div id='ide'><div id='editor'></div><form></form></div>")
      # data = {"step":{"id":31,"kit_id":7,"description":"<p>So to make a quiz we will need to start with a question. </p>\n\n<p>Just like we drew a rectangle before, now we can do some writing. </p>\n\n<p>Try:\n<br /><code>question=paper.text(200,50,\"How cold is it today?\")</code></p>\n\n<p>The first 2 numbers are the x and y coordinates. Try changing them around to move your question around the paper.</p>\n\n<p>If you want we can also change around the colors and fonts a bit by using \"attr\".</p>\n\n<p>Try this:</p>\n\n<p><code>question.attr(\"fill\" : 'white', 'font-family' : 'Helvetica', 'font-size' : 20) </code></p>\n\n<p>You can adjust the fill color, font-family and font-size to change the look. \n<br />  </p>","spec":"","success_message":"<p>Now you have a question, but it's not very interesting. Why don't you try changing it to something you come up with? </p>","position":4,"created_at":"2012-02-29T20:13:01Z","updated_at":"2012-03-01T20:59:38Z","title":"That is the question","hint":"<p></p>","solution":"<p>paper = makeWorkspace() \n<br />background = paper.rect(0,0,400,400) \n<br />background.attr('fill', 'royalblue')</p>\n\n<p>question = paper.text(200, 50, \"How cold is it today?\")</p>","image_url":"","bonus":false,"freeplay":false,"more_info":"<p></p>","next_step_id":32,"last_step":false,"requirements":[{"id":53,"name":"add a question","spec":"\n      $frame.find('svg text').length > 6\n    ","step_id":31,"position":1,"created_at":"2012-02-29T23:54:40Z","updated_at":"2012-02-29T23:54:40Z","success":null}]},"program":{"code":"paper = makeWorkspace()\r\nbackground = paper.rect(0,0,385,400)\r\nbackground.attr('fill', 'royalblue')","created_at":"2012-03-03T01:40:30Z","featured":false,"id":703,"kit_id":7,"name":"Sam's Quiz Game","progress":null,"step_id":31,"updated_at":"2012-03-05T22:36:30Z","user_id":630}}
      # # window.Step = new ProgramModel(data)
      startEditor('window.foo=3')
      expect(window.foo).toEqual(3)
      editor.getSession().setValue('window.foo=4')
      expect(window.foo).toEqual(3)
      # # spyOn(Step, "runSpecs")
      jasmine.Clock.tick(700)
      # # expect(window.foo).toEqual(4)
    )
  )
)
