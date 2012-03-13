describe("Programs", ->
  describe("startEditor", ->
    beforeEach( ->
      jasmine.Clock.useMock()
      $("#jasmine_content").append("<div id='ide'><div id='editor'></div><form></form></div>")
      window.tick = 1200
    )

    it("should not execute the specs on start", ->
      spyOn(Step, 'runSpecs')
      startEditor('window.foo = 3')
      jasmine.Clock.tick(tick)
      expect(Step.runSpecs).not.toHaveBeenCalled()
      expect(foo).toEqual(3)
    )

    it("should run the specs after a 700ms timeout", ->
      spyOn(Step, 'runSpecs').andCallThrough()
      spyOn($.fn, "submit")
      startEditor('window.foo=3')
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual(3)

      editor.getSession().setValue('window.foo=4')
      expect(window.foo).toEqual(3)
      expect($.fn.submit).not.toHaveBeenCalled()

      jasmine.Clock.tick(tick)
      expect($.fn.submit).toHaveBeenCalled()
      expect(window.foo).toEqual(4)
      expect(Step.runSpecs).toHaveBeenCalled()
      expect(Step.runSpecs.callCount).toEqual(1)
    )

    it("should restart the timer if you type another character before that.", ->
      spyOn(Step, 'runSpecs').andCallThrough()
      startEditor('window.foo=3')
      spyOn($.fn, "submit")
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual(3)

      # change the value but don't wait the full time
      editor.getSession().setValue('window.foo=4')
      jasmine.Clock.tick(tick - 200)
      expect(window.foo).toEqual(3)
      expect($.fn.submit).not.toHaveBeenCalled()

      # change the value and wait another 500ms
      editor.getSession().setValue('window.foo=5')
      jasmine.Clock.tick(tick - 200)
      expect(window.foo).toEqual(3)
      expect($.fn.submit).not.toHaveBeenCalled()

      # 700ms after the last change
      jasmine.Clock.tick(tick)

      expect($.fn.submit).toHaveBeenCalled()
      expect(window.foo).toEqual(5)
      expect(Step.runSpecs).toHaveBeenCalled()
      expect(Step.runSpecs.callCount).toEqual(1)
    )

    it("should not timeout if you change a number using the arrows", ->
      spyOn(Step, 'runSpecs').andCallThrough()
      startEditor('window.foo = 3')
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual(3)
      spyOn($.fn, "submit")

      fakeRange = editor.getSelectionRange()
      fakeRange.end =
        column: 14
        row: 0
      fakeRange.start =
        column: 13
        row: 0
      spyOn(editor, 'getSelectionRange').andReturn(fakeRange)

      editor.commands.commands.downArrow.exec(editor)
      expect(window.foo).toEqual(2)

      editor.commands.commands.upArrow.exec(editor)
      expect(window.foo).toEqual(3)

      expect($.fn.submit).not.toHaveBeenCalled()
      jasmine.Clock.tick(tick)
      expect($.fn.submit).toHaveBeenCalled()
      expect(Step.runSpecs).toHaveBeenCalled()
      expect(Step.runSpecs.callCount).toEqual(1)
    )

    it("should not timeout if you change a letter-number combo", ->
      spyOn(Step, 'runSpecs').andCallThrough()
      startEditor("window.foo = 'r3'")
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual('r3')
      spyOn($.fn, "submit")

      fakeRange = editor.getSelectionRange()
      fakeRange.end =
        column: 16
        row: 0
      fakeRange.start =
        column: 14
        row: 0
      spyOn(editor, 'getSelectionRange').andReturn(fakeRange)

      # make a change using the up arrow
      editor.commands.commands.upArrow.exec(editor)
      expect(window.foo).toEqual('r4')
      expect($.fn.submit).not.toHaveBeenCalled()

      # make a change using the down arrow
      editor.commands.commands.downArrow.exec(editor)
      expect(window.foo).toEqual('r3')
      expect($.fn.submit).not.toHaveBeenCalled()

      jasmine.Clock.tick(tick)
      expect(Step.runSpecs).toHaveBeenCalled()
      expect(Step.runSpecs.callCount).toEqual(1)
      expect($.fn.submit).toHaveBeenCalled()
    )

    it("should not timeout if you press enter", ->
      spyOn(Step, 'runSpecs').andCallThrough()
      spyOn($.fn, "submit")
      startEditor('window.foo=3')
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual(3)

      fakeRange = editor.getSelectionRange()
      fakeRange.end =
        column: 16
        row: 0
      fakeRange.start =
        column: 13
        row: 0
      spyOn(editor, 'getSelectionRange').andReturn(fakeRange)

      editor.getSession().setValue("window.foo='r4'")
      editor.commands.commands.saveNewLine.exec(editor)
      expect(window.foo).toEqual('r4')
      expect(editor.getSession().getValue()).toEqual("\nwindow.foo='r4'")
      expect($.fn.submit).toHaveBeenCalled()
      expect(editor.getSelection().selectionLead.row).toEqual(1)
      expect(editor.getSelection().selectionLead.column).toEqual(0)

      jasmine.Clock.tick(tick)
      expect(Step.runSpecs).toHaveBeenCalled()
      expect(Step.runSpecs.callCount).toEqual(1)
    )
  )
)
