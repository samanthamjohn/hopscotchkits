describe("requirementModel", ->
  it("should pass if the spec returns true", ->
    requirement = new RequirementModel(
      spec: "$('#jasmine_content').length > 0"
    )
    expect(requirement.runSpec()).toEqual(true)
  )
  it("should fail if the spec returns false", ->
    requirement = new RequirementModel(
      spec: "$('.foo').length > 0"
    )
    expect(requirement.runSpec()).toEqual(false)
  )
)
