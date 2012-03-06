(function() {

  window.ProgramView = Backbone.View.extend({
    render: function() {
      var ideTemplate, leftOffset, template;
      template = $('script#preface_template').html();
      $('.preface').html(Mustache.render(template, this));
      $("#progressbar").progressbar({
        value: $('#progressbar').data('progress')
      });
      ideTemplate = $("script#ide_template").html();
      $("#next_steps").html(Mustache.render(ideTemplate, this));
      $(".next_button").button({
        disabled: true
      });
      $(".last_button").button({
        disabled: true
      });
      $(".more-info").button({
        icons: {
          secondary: "ui-icon-triangle-1-s"
        }
      });
      $(".less-info").button({
        icons: {
          secondary: 'ui-icon-triangle-1-n'
        }
      });
      if ($("#runthis").length > 0) {
        leftOffset = $("#runthis").offset().left - 2;
        $("#runthis_copy").css("left", leftOffset);
        $(window).resize((function() {
          leftOffset = $("#runthis").offset().left;
          return $("#runthis_copy").css("left", leftOffset);
        }));
        return $("#runthis").waypoint((function() {
          return $("#runthis_copy").css({
            "display": "none"
          });
        }), {
          offset: 'bottom-in-view'
        });
      }
    },
    events: {
      "submit #ide form": "submitCode",
      "click a.hint": "showHint",
      "click .next_button": "refreshStep",
      "click .last_button": "submitCode",
      "click .solution-link": "toggleSolutions",
      "click .more-info": "showMoreInfo",
      "click .less-info": "showLessInfo"
    },
    showMoreInfo: function(e) {
      e.preventDefault();
      return $("#more_info").fadeIn('fast', function() {
        return $("#more_info_button").hide();
      });
    },
    showLessInfo: function(e) {
      e.preventDefault();
      return $("#more_info").fadeOut('fast', function() {
        return $("#more_info_button").show();
      });
    },
    toggleSolutions: function(e) {
      e.preventDefault();
      return $(".solutions").toggle();
    },
    refreshStep: function(e) {
      e.preventDefault();
      this.model.set('url', 'next_step');
      $("#ide form").submit();
      return this.model.fetch();
    },
    showHint: function(e) {
      e.preventDefault();
      return $("#hint").dialog({
        modal: true,
        title: "Hints and Solutions"
      });
    },
    submitCode: function() {
      var val;
      val = window.editor.getSession().getValue();
      $("#ide input#program_code").val(val);
      $("#ide input#program_step_id").val(this.model.get('id'));
      return this.model.runSpecs();
    },
    subTitle: function() {
      return this.model.get('title');
    },
    successMessage: function() {
      return this.model.get('success_message');
    },
    description: function() {
      return this.model.get('description');
    },
    hint: function() {
      return this.model.get('hint');
    },
    moreInfo: function() {
      var html;
      if (this.model.get('more_info') !== "<p></p>") {
        return html = "<div class='gradient'>" + "<div id='more_info_button'><a href='#' class='more-info'>more info</a></div id='more_info_button'>" + "<div id='more_info'>" + "<div class='text'>" + this.model.get('more_info') + "</div>" + "<a href='#' class='less-info'>less info</a>" + "</div>" + "</div>";
      } else {
        return html = "";
      }
    },
    solution: function() {
      return this.model.get('solution');
    },
    showTitle: function() {
      var str;
      if (this.model.get('bonus') === true) {
        str = "Bonus: ";
      } else if (this.model.get('freeplay')) {
        str = "Freeplay Mode: ";
      } else {
        str = "Step " + (this.model.get('position')) + ": ";
      }
      return str;
    },
    progressText: function() {
      var numSteps;
      if (this.model.get('freeplay')) {
        return "Complete!";
      } else {
        numSteps = $("script#preface_template").data("numSteps");
        return "Step " + (this.model.get('position')) + " of " + numSteps;
      }
    },
    progressPct: function() {
      var numSteps;
      if (this.model.get('last_step')) {
        return 100;
      } else {
        numSteps = $("script#preface_template").data("numSteps");
        return this.model.get('position') / numSteps * 100;
      }
    },
    requirements: function() {
      var reqs;
      reqs = this.model.requirements;
      return reqs.map(function(r) {
        return {
          name: r.get('name'),
          result: "unchecked",
          success: r.get('success'),
          id: r.id
        };
      });
    },
    programId: function() {
      return this.model.get('programId');
    },
    buttonClass: function() {
      if (this.model.get('last_step') || this.model.get('bonus') === true || this.model.get('freeplay') === true) {
        return "last_button";
      } else if (this.model.get('next_step_id')) {
        return "next_button";
      }
    },
    image_tag: function() {
      if (this.model.get('image_url')) {
        return "<img src='/assets/step_images/" + (this.model.get('image_url')) + "' alt=" + (this.model.get('.title')) + "/>";
      }
    }
  });

}).call(this);
