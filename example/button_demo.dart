// 📁 example/button_demo.dart
import 'dart:async';
import 'dart:io';

import 'package:tui_dart/src/core/component.dart';
import 'package:tui_dart/src/widgets/toast.dart';
import 'package:tui_dart/tui_dart.dart';

class Button extends TuiComponent {
  final String label;
  final void Function()? onPressed;
  final int row;
  final int col;

  Button({
    required this.label,
    required this.row,
    required this.col,
    this.onPressed,
  }) {
    focusable = true;
  }

  @override
  void render() {
    stdout.write('\x1B[$row;${col}H');
    final styled = focused
        ? TextStyle("[$label]").bold().inverse().color("cyan").render()
        : TextStyle(" $label ").bold().color("gray").render();
    print(styled);
  }

  @override
  void handleInput(String input) {
    if ((input == '\n' || input == '\r') && focused) {
      onPressed?.call();
    }
  }

  void handleMouseClick(int x, int y) {
    if (y == row && x >= col && x <= col + label.length + 2) {
      onPressed?.call();
    }
  }
}

void clearScreen() => stdout.write('\x1B[2J\x1B[0;0H');
void hideCursor() => stdout.write('\x1B[?25l');
void showCursor() => stdout.write('\x1B[?25h');
void enableMouse() => stdout.write('\x1B[?1000h');
void disableMouse() => stdout.write('\x1B[?1000l');

void drawUI(Button button) {
  clearScreen();
  print(TextStyle("== Button Demo ==").bold().color("cyan").render());
  button.render();
  print(
      "\x1B[10;1H${TextStyle("Press Enter or click the button. Press 'q' to quit.").color("gray").render()}");
}

void main() {
  hideCursor();
  enableMouse();

  bool recentlyClicked = false;
  late Button button;

  button = Button(
    label: "Click Me",
    row: 5,
    col: 10,
    onPressed: () {
      if (recentlyClicked) return;
      recentlyClicked = true;

      Toast(
        message: "Button clicked!",
        type: ToastType.success,
      ).show();

      Future.delayed(Duration(seconds: 3), () {
        drawUI(button);
        recentlyClicked = false;
      });
    },
  );

  button.focused = true;
  drawUI(button);

  stdin.echoMode = false;
  stdin.lineMode = false;

  List<int> buffer = [];

  stdin.listen((event) {
    buffer.addAll(event);

    if (buffer.length >= 6 &&
        buffer[0] == 27 &&
        buffer[1] == 91 &&
        buffer[2] == 77) {
      final x = buffer[4] - 32;
      final y = buffer[5] - 32;
      buffer.clear();
      button.handleMouseClick(x, y);
      return;
    }

    final input = String.fromCharCodes(buffer);

    if (input == 'q') {
      disableMouse();
      showCursor();
      print("\nExited.");
      exit(0);
    }

    button.handleInput(input);
    buffer.clear();
  });
}
