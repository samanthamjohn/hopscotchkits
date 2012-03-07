describe("requirements", ->
  beforeEach( ->
    jasmine.Clock.useMock()
    $("#jasmine_content").append("<div id='ide'><div id='editor'></div><form></form></div>")
    startEditor('window.foo = 3')
  )

  describe("runSpecs", ->
    it("should create a success message if it is successful", ->
      $("#jasmine_content").append("<div class='progress'><div class='message'></div></div>")
      requirements = Step.requirements
      requirement = new RequirementModel(
        spec: 'true'
      )
      requirements.reset(requirement)
      Step.requirements.runSpecs()
      expect($(".progress .message").attr('class')).toMatch('successful')
    )

    it("should create a failure message otherwise", ->
      $("#jasmine_content").append("<div class='progress'><div class='successful message'></div></div>")
      requirements = Step.requirements
      requirement = new RequirementModel(
        spec: '$(".foo").length > 0'
      )
      requirements.reset(requirement)
      Step.requirements.runSpecs()
      expect($(".progress .message").attr('class')).not.toMatch('successful')
    )

    it("should clear the old canvas before running specs", ->
      $("#jasmine_content").append("<div class='progress'>" +
          "<div class='message'><div>" +
        "</div>"
      )
      window.editor.getSession().setValue('makeWorkspace()')
      requirements = Step.requirements
      requirement = new RequirementModel(
        spec: '$("svg").length > 0'
      )
      requirements.reset(requirement)
      requirements.runSpecs()
      expect($(".progress .message").attr('class')).toMatch('successful')

      window.editor.getSession().setValue('')
      requirements.runSpecs()
      expect($(".progress .message").attr('class')).not.toMatch('successful')
    )

    it("should clear the old canvas if the code fails to parse", ->
      window.editor.getSession().setValue('makeWorkspace()')
      requirements = Step.requirements
      requirement = new RequirementModel(
        spec: '$("svg").length > 0'
      )
      requirements.reset(requirement)
      requirements.runSpecs()
      expect($(".progress .message").attr('class')).toMatch('successful')

      window.editor.getSession().setValue('makeWorkspac()')
      requirements.runSpecs()
      expect($(".progress .message").attr('class')).not.toMatch('successful')
      expect($('svg').length).toEqual(0)
      $("svg").remove()
    )
  )
)
