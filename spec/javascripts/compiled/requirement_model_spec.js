(function() {

  describe("requirementModel", function() {
    it("should pass if the spec returns true", function() {
      var requirement;
      requirement = new RequirementModel({
        spec: "$('#jasmine_content').length > 0"
      });
      return expect(requirement.runSpec()).toEqual(true);
    });
    return it("should fail if the spec returns false", function() {
      var requirement;
      requirement = new RequirementModel({
        spec: "$('.foo').length > 0"
      });
      return expect(requirement.runSpec()).toEqual(false);
    });
  });

}).call(this);
