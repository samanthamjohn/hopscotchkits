(function() {

  describe("Programs", function() {
    return describe("startEditor", function() {
      beforeEach(function() {
        jasmine.Clock.useMock();
        $("#jasmine_content").append("<div id='ide'><div id='editor'></div><form></form></div>");
        return window.tick = 1200;
      });
      it("should run the specs after a 700ms timeout", function() {
        startEditor('window.foo=3');
        jasmine.Clock.tick(tick);
        expect(window.foo).toEqual(3);
        editor.getSession().setValue('window.foo=4');
        expect(window.foo).toEqual(3);
        jasmine.Clock.tick(tick);
        return expect(window.foo).toEqual(4);
      });
      it("should restart the timer if you type another character before that.", function() {
        startEditor('window.foo=3');
        jasmine.Clock.tick(tick);
        expect(window.foo).toEqual(3);
        editor.getSession().setValue('window.foo=4');
        jasmine.Clock.tick(tick - 200);
        expect(window.foo).toEqual(3);
        editor.getSession().setValue('window.foo=5');
        jasmine.Clock.tick(tick - 200);
        expect(window.foo).toEqual(3);
        jasmine.Clock.tick(tick);
        return expect(window.foo).toEqual(5);
      });
      it("should not timeout if you change a number using the arrows", function() {
        var fakeRange;
        startEditor('window.foo = 3');
        jasmine.Clock.tick(tick);
        expect(window.foo).toEqual(3);
        fakeRange = editor.getSelectionRange();
        fakeRange.end = {
          column: 14,
          row: 0
        };
        fakeRange.start = {
          column: 13,
          row: 0
        };
        spyOn(editor, 'getSelectionRange').andReturn(fakeRange);
        editor.commands.commands.downArrow.exec(editor);
        expect(window.foo).toEqual(2);
        editor.commands.commands.upArrow.exec(editor);
        return expect(window.foo).toEqual(3);
      });
      it("should not timeout if you change a letter-number combo", function() {
        var fakeRange;
        startEditor("window.foo = 'r3'");
        jasmine.Clock.tick(tick);
        expect(window.foo).toEqual('r3');
        fakeRange = editor.getSelectionRange();
        fakeRange.end = {
          column: 16,
          row: 0
        };
        fakeRange.start = {
          column: 14,
          row: 0
        };
        spyOn(editor, 'getSelectionRange').andReturn(fakeRange);
        editor.commands.commands.upArrow.exec(editor);
        expect(window.foo).toEqual('r4');
        editor.commands.commands.downArrow.exec(editor);
        return expect(window.foo).toEqual('r3');
      });
      return it("should not timeout if you press enter", function() {
        var fakeRange;
        spyOn($.fn, "submit");
        startEditor('window.foo=3');
        jasmine.Clock.tick(tick);
        expect(window.foo).toEqual(3);
        fakeRange = editor.getSelectionRange();
        fakeRange.end = {
          column: 16,
          row: 0
        };
        fakeRange.start = {
          column: 13,
          row: 0
        };
        spyOn(editor, 'getSelectionRange').andReturn(fakeRange);
        editor.getSession().setValue("window.foo='r4'");
        editor.commands.commands.saveNewLine.exec(editor);
        expect(window.foo).toEqual('r4');
        expect(editor.getSession().getValue()).toEqual("\nwindow.foo='r4'");
        expect($.fn.submit).toHaveBeenCalled();
        expect(editor.getSelection().selectionLead.row).toEqual(1);
        return expect(editor.getSelection().selectionLead.column).toEqual(0);
      });
    });
  });

}).call(this);
