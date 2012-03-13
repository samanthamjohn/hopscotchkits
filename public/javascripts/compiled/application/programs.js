(function() {
  var executeCode;

  window.colors = ["black", "navy", "darkblue", "mediumblue", "blue", "darkgreen", "green", "teal", "darkcyan", "deepskyblue", "darkturquoise", "mediumspringgreen", "lime", "springgreen", "aqua", "cyan", "midnightblue", "dodgerblue", "lightseagreen", "forestgreen", "seagreen", "darkslategray", "darkslategrey", "limegreen", "mediumseagreen", "turquoise", "royalblue", "steelblue", "darkslateblue", "mediumturquoise", "indigo ", "darkolivegreen", "cadetblue", "cornflowerblue", "mediumaquamarine", "dimgray", "dimgrey", "slateblue", "olivedrab", "slategray", "slategrey", "lightslategray", "lightslategrey", "mediumslateblue", "lawngreen", "chartreuse", "aquamarine", "maroon", "purple", "olive", "gray", "grey", "skyblue", "lightskyblue", "blueviolet", "darkred", "darkmagenta", "saddlebrown", "darkseagreen", "lightgreen", "mediumpurple", "darkviolet", "palegreen", "darkorchid", "yellowgreen", "sienna", "brown", "darkgray", "darkgrey", "lightblue", "greenyellow", "paleturquoise", "lightsteelblue", "powderblue", "firebrick", "darkgoldenrod", "mediumorchid", "rosybrown", "darkkhaki", "silver", "mediumvioletred", "indianred ", "peru", "chocolate", "tan", "lightgray", "lightgrey", "palevioletred", "thistle", "orchid", "goldenrod", "crimson", "gainsboro", "plum", "burlywood", "lightcyan", "lavender", "darksalmon", "violet", "palegoldenrod", "lightcoral", "khaki", "aliceblue", "honeydew", "azure", "sandybrown", "wheat", "beige", "whitesmoke", "mintcream", "ghostwhite", "salmon", "antiquewhite", "linen", "lightgoldenrodyellow", "oldlace", "red", "fuchsia", "magenta", "deeppink", "orangered", "tomato", "hotpink", "coral", "darkorange", "lightsalmon", "orange", "lightpink", "pink", "gold", "peachpuff", "navajowhite", "moccasin", "bisque", "mistyrose", "blanchedalmond", "papayawhip", "lavenderblush", "seashell", "cornsilk", "lemonchiffon", "floralwhite", "snow", "yellow", "lightyellow", "ivory", "white"];

  executeCode = function() {
    var val;
    val = editor.getSession().getValue();
    return CoffeeScript.eval(val);
  };

  window.startEditor = function(code) {
    var CoffeeScriptMode, tick;
    window.editor = ace.edit("editor");
    window.editor.getSession().setValue(code);
    window.editor.getSession().setUseWrapMode(true);
    window.editor.setTheme("ace/theme/clouds");
    window.editor.getSession().setTabSize(2);
    tick = 1200;
    $('#editor').css('fontSize', '16px');
    $('#editor').css('line-height', '21px');
    $(".ace_gutter-cell").css('fontSize', '16px');
    CoffeeScriptMode = require("ace/mode/coffee").Mode;
    window.editor.getSession().setMode(new CoffeeScriptMode());
    try {
      $frame.find('body svg').remove();
    } catch (_error) {}
    window.specTimer = setTimeout((function() {
      return executeCode();
    }), tick);
    editor.getSession().on('change', function(e) {
      clearTimeout(specTimer);
      return window.specTimer = setTimeout((function() {
        Step.runSpecs();
        return $("#ide form").submit();
      }), tick);
    });
    editor.commands.addCommand({
      name: 'saveNewLine',
      bindKey: {
        win: "Enter",
        mac: "Return",
        sender: editor
      },
      exec: function(editor) {
        editor.insert("\n");
        clearTimeout(specTimer);
        Step.runSpecs();
        return $('#ide form').submit();
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
        var colorIndex, newNumber, newWord, number, wRange, word, wordSplit;
        wRange = editor.getSelectionRange();
        word = editor.getSession().doc.getTextRange(wRange);
        colorIndex = _.indexOf(colors, word.toLowerCase());
        if (colorIndex > 0) {
          newWord = colors[colorIndex - 1];
          editor.getSession().replace(wRange, "" + newWord);
          editor.commands.commands.selectwordleft.exec(editor);
          return executeCode();
        } else if (colorIndex === 0) {
          newWord = _.last(colors);
          editor.getSession().replace(wRange, "" + newWord);
          editor.commands.commands.selectwordleft.exec(editor);
          return executeCode();
        } else if (word.match(/\d/)) {
          if (parseInt(word) || parseInt(word) === 0) {
            editor.getSession().replace(wRange, "" + (parseInt(word, 10) + 1));
            editor.commands.commands.selectwordleft.exec(editor);
            return executeCode();
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
              editor.getSession().replace(wRange, word);
              editor.commands.commands.selectwordleft.exec(editor);
              return executeCode();
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
        var colorIndex, newNumber, newWord, number, wRange, word, wordSplit;
        wRange = editor.getSelectionRange();
        word = editor.getSession().doc.getTextRange(wRange);
        colorIndex = _.indexOf(colors, word.toLowerCase());
        if (word.toLowerCase() === _.last(colors)) {
          newWord = _.first(colors);
          editor.getSession().replace(wRange, "" + newWord);
          editor.commands.commands.selectwordleft.exec(editor);
          return executeCode();
        } else if (colorIndex >= 0) {
          newWord = colors[colorIndex + 1];
          editor.getSession().replace(wRange, "" + newWord);
          editor.commands.commands.selectwordleft.exec(editor);
          return executeCode();
        } else if (word.match(/\d/)) {
          if (parseInt(word) || parseInt(word) === 0) {
            editor.getSession().replace(wRange, "" + (parseInt(word, 10) - 1));
            editor.commands.commands.selectwordleft.exec(editor);
            return executeCode();
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
              editor.commands.commands.selectwordleft.exec(editor);
              return executeCode();
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
