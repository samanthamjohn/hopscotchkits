(function() {

  window.startEditor = function(code) {
    var CoffeeScriptMode, val;
    window.editor = ace.edit("editor");
    window.editor.getSession().setValue(code);
    window.editor.getSession().setUseWrapMode(true);
    window.editor.setTheme("ace/theme/clouds");
    window.editor.getSession().setTabSize(2);
    $('#editor').css('fontSize', '16px');
    $('#editor').css('line-height', '21px');
    $(".ace_gutter-cell").css('fontSize', '16px');
    CoffeeScriptMode = require("ace/mode/coffee").Mode;
    window.editor.getSession().setMode(new CoffeeScriptMode());
    try {
      $frame.find('body svg').remove();
    } catch (_error) {}
    val = window.editor.getSession().getValue();
    CoffeeScript.eval(val);
    window.timeout = true;
    window.sendData = setTimeout((function() {
      Step.runSpecs();
      return $("#ide form").submit();
    }), 700);
    editor.getSession().on('change', function(e) {
      clearTimeout(sendData);
      if (timeout) {
        console.log('send data');
        return window.sendData = setTimeout((function() {
          console.log(Step);
          Step.runSpecs();
          $("#ide form").submit();
          return console.log('end timeout');
        }), 700);
      } else {
        window.timeout = true;
        Step.runSpecs();
        return window.sendData = setTimeout((function() {
          return $("#ide form").submit();
        }), 700);
      }
    });
    editor.commands.addCommand({
      name: 'upArrow',
      bindKey: {
        win: "Up",
        mac: "Up",
        sender: editor
      },
      exec: function(editor) {
        var newNumber, number, wRange, word, wordSplit;
        wRange = editor.getSelectionRange();
        word = editor.getSession().doc.getTextRange(wRange);
        if (word.match(/\d/)) {
          if (parseInt(word) || parseInt(word) === 0) {
            window.timeout = false;
            editor.getSession().replace(wRange, "" + (parseInt(word, 10) + 1));
            return editor.commands.commands.selectwordleft.exec(editor);
          } else {
            number = "";
            newNumber = "";
            wordSplit = word.split(/[a-zA-Z]/);
            if (wordSplit.length === 2) {
              _.each(wordSplit, function(w) {
                if (w.match(/\d/)) {
                  number = w;
                  return newNumber = parseInt(w, 10) + 1;
                }
              });
              word = _.map(word.split(number), function(w) {
                if (w.length === 0) w = newNumber;
                return w;
              }).join('');
              window.timeout = false;
              editor.getSession().replace(wRange, word);
              return editor.commands.commands.selectwordleft.exec(editor);
            } else {
              return editor.navigateUp(1);
            }
          }
        } else {
          return editor.navigateUp(1);
        }
      }
    });
    return editor.commands.addCommand({
      name: 'downArrow',
      bindKey: {
        win: "Down",
        mac: "Down",
        sender: editor
      },
      exec: function(editor) {
        var newNumber, number, wRange, word, wordSplit;
        wRange = editor.getSelectionRange();
        word = editor.getSession().doc.getTextRange(wRange);
        if (word.match(/\d/)) {
          if (parseInt(word) || parseInt(word) === 0) {
            editor.getSession().replace(wRange, "" + (parseInt(word, 10) - 1));
            return editor.commands.commands.selectwordleft.exec(editor);
          } else {
            number = "";
            newNumber = "";
            wordSplit = word.split(/[a-zA-Z]/);
            if (wordSplit.length === 2) {
              _.each(wordSplit, function(w) {
                if (w.match(/\d/)) {
                  number = w;
                  return newNumber = parseInt(w, 10) - 1;
                }
              });
              word = _.map(word.split(number), function(w) {
                if (w.length === 0) w = newNumber;
                return w;
              }).join('');
              editor.getSession().replace(wRange, word);
              return editor.commands.commands.selectwordleft.exec(editor);
            } else {
              return editor.navigateDown(1);
            }
          }
        } else {
          return editor.navigateDown(1);
        }
      }
    });
  };

  $(function() {
    var hoverState;
    if ($("body.programs.new").length > 0) {
      startEditor("");
      $("#runthis").click(function(e) {
        var val;
        val = window.editor.getSession().getValue();
        return CoffeeScript.eval(val);
      });
    }
    if ($("body.programs-root").length > 0) {
      $(".new-program-form img").click(function(e) {
        return $(e.target).parents().closest(".form").find(".blurb-hover form").submit();
      });
      hoverState = 'off';
      $(".new-program-form img").on('mouseenter', function(e) {
        if (hoverState === 'off') {
          return setTimeout((function() {
            var hover;
            hover = $(e.target).parents(".form").find('.blurb-hover');
            hover.show();
            return hoverState = 'on';
          }), 500);
        }
      });
      $('.form').on("mouseleave", function(e) {
        if (hoverState === 'on') {
          return setTimeout((function() {
            var hover;
            hover = $(e.target).parents(".form").find('.blurb-hover');
            hover.hide();
            return hoverState = "off";
          }), 500);
        }
      });
    }
    if ($("#stage").length > 0) {
      window.$frame = $(window.frames['stage'].document);
      Raphael.setWindow(window.frames["stage"]);
    }
    if ($("input:submit, .button").length > 0) $("input:submit, .button").button();
    if ($(".publish-button").length > 0) {
      $(".publish-button").button({
        icons: {
          secondary: 'ui-icon-extlink'
        }
      });
    }
    return $("input.permalink").click(function(e) {
      $("input.permalink").select();
      return e.preventDefault();
    });
  });

}).call(this);
