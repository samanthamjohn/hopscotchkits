(function() {

  describe("Programs", function() {
    return describe("startEditor", function() {
      return it("should run the specs after a 700ms timeout", function() {
        jasmine.Clock.useMock();
        $("#jasmine_content").append("<div id='ide'><div id='editor'></div><form></form></div>");
        startEditor('window.foo=3');
        expect(window.foo).toEqual(3);
        editor.getSession().setValue('window.foo=4');
        expect(window.foo).toEqual(3);
        return jasmine.Clock.tick(700);
      });
    });
  });

}).call(this);
