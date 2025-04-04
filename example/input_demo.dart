import 'dart:io';

import 'package:tui_dart/tui_dart.dart';

void main() {
  final inputField = InputField(
    label: "Your email",
    type: "email",
    onSubmit: (value) {
      stdin.lineMode = true;
      stdin.echoMode = true;

      // Clear screen
      stdout.write('\x1B[2J\x1B[0;0H');
      print("\n📬 Email submitted: $value\n");
      exit(0);
    },
  );

  inputField.start();
}

/// Terminal-based input component with basic validation
class InputField {
  final String label;
  final String type; // e.g. "text", "email"
  final void Function(String) onSubmit;

  String _text = '';
  String? _errorMessage;
  final bool _isFocused = true;

  InputField({
    required this.label,
    required this.onSubmit,
    this.type = 'text',
  });

  void start() {
    stdin.echoMode = false;
    stdin.lineMode = false;

    _render();

    stdin.listen((List<int> charCodes) {
      final code = charCodes[0];

      if (code == 13 || code == 10) {
        if (type == "email" && !_isValidEmail(_text)) {
          _errorMessage = "❌ Invalid email format. Please try again.";
        } else {
          _errorMessage = null;
          onSubmit(_text);
        }
      } else if (code == 127 || code == 8) {
        // Backspace
        if (_text.isNotEmpty) {
          _text = _text.substring(0, _text.length - 1);
        }
      } else if (code == 113) {
        // 'q' to quit
        stdin.lineMode = true;
        stdin.echoMode = true;
        print("\nExited.");
        exit(0);
      } else {
        // Regular character
        _text += String.fromCharCode(code);
      }

      _render();
    });
  }

  bool _isValidEmail(String input) {
    final emailRegex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w{2,}$");
    return emailRegex.hasMatch(input);
  }

  void _render() {
    // Clear screen
    stdout.write('\x1B[2J\x1B[0;0H');

    print(
        TextStyle("~== Input Component Demo ==~").bold().color("cyan").render());
    print("");

    final labelText = TextStyle("$label: ").bold().render();
    final displayText = _text.isEmpty ? "_" : _text;
    final inputText = _isFocused
        ? TextStyle(displayText).underline().color("yellow").render()
        : TextStyle(displayText).render();

    print("$labelText$inputText");

    if (_errorMessage != null) {
      print(TextStyle(_errorMessage!).color("bright_red").bold().render());
    }

    print("\nPress Enter to submit, or 'q' to quit.");
  }
}
