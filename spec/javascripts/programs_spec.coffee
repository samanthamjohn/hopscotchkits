describe("Programs", ->
  describe("startEditor", ->
    beforeEach( ->
      window.tick = 1200
    )
    it("should run the specs after a 700ms timeout", ->
      jasmine.Clock.useMock()
      $("#jasmine_content").append("<div id='ide'><div id='editor'></div><form></form></div>")
      startEditor('window.foo=3')
      jasmine.Clock.tick(tick)
      editor.getSession().setValue('window.foo=4')
      expect(window.foo).toEqual(3)
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual(4)
    )

    it("should restart the timer if you type another character before that.", ->
      jasmine.Clock.useMock()
      $("#jasmine_content").append("<div id='ide'><div id='editor'></div><form></form></div>")
      startEditor('window.foo=3')
      jasmine.Clock.tick(tick)

      # change the value but don't wait the full time
      editor.getSession().setValue('window.foo=4')
      jasmine.Clock.tick(tick - 200)
      expect(window.foo).toEqual(3)

      # change the value and wait another 500ms
      editor.getSession().setValue('window.foo=5')
      jasmine.Clock.tick(tick - 200)
      expect(window.foo).toEqual(3)

      # 700ms after the last change
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual(5)
    )

    it("should not timeout if you change a number using the arrows", ->
      jasmine.Clock.useMock()
      startEditor("window.foo = 3")
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual(3)
      fakeRange = editor.getSelectionRange()
      fakeRange.end =
        column: 14
        row: 0
      fakeRange.start =
        column: 13
        row: 0
      spyOn(editor, 'getSelectionRange').andReturn(fakeRange)

      # make a change using the up arrow
      editor.commands.commands.upArrow.exec(editor)
      expect(window.foo).toEqual(4)

      editor.commands.commands.downArrow.exec(editor)
      expect(window.foo).toEqual(3)
    )

    it("should not timeout if you change a letter-number combo", ->
      jasmine.Clock.useMock()
      startEditor("window.foo = 'r3'")
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual('r3')
      fakeRange = editor.getSelectionRange()
      fakeRange.end =
        column: 16
        row: 0
      fakeRange.start =
        column: 13
        row: 0
      spyOn(editor, 'getSelectionRange').andReturn(fakeRange)

      # make a change using the up arrow
      editor.commands.commands.upArrow.exec(editor)
      expect(window.foo).toEqual('r4')

      # make a change using the down arrow
      editor.commands.commands.downArrow.exec(editor)
      expect(window.foo).toEqual('r3')
    )

    it("should not timeout if you press enter", ->
      jasmine.Clock.useMock()
      spyOn($.fn, "submit")
      startEditor("window.foo = 'r3'")
      jasmine.Clock.tick(tick)
      expect(window.foo).toEqual('r3')
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
    )
  )
)
