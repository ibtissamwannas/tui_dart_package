import 'package:tui_dart/tui_dart.dart';

void main() {
  try {
    // Basic text styling
    final hello = TextStyle("Hello, Dart TUI!").bold().color("yellow").render();
    print(hello);

    // RGB foreground and background
    final rgbDemo = TextStyle("RGB Text")
        .colorRGB(255, 100, 50)
        .backgroundColorRGB(0, 200, 150)
        .underline()
        .render();
    print(rgbDemo);

    // Combined styles
    final warning = TextStyle("WARNING")
        .bold()
        .color("bright_red")
        .inverse() // Swaps foreground/background
        .render();
    print(warning);

    // Invalid color example (uncomment to test error)
    // final invalid = TextStyle("Oops").color("pink").render();
  } on ArgumentError catch (e) {
    print("Error: ${e.message}");
  }
}
