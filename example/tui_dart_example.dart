import 'package:tui_dart/tui_dart.dart';

void main() {
  print(TextStyle.green(TextStyle.bold("Welcome to Dart TUI!")));

  var table = TableRenderer();
  table.printTable([
    ["Name", "Age", "City"],
    ["Alice", "30", "New York"],
    ["Bob", "25", "San Francisco"],
    ["Charlie", "35", "London"],
  ]);

  var input = InputHandler();
  String name = input.prompt("Enter your name:");
  print("Hello, ${TextStyle.bold(name)}!");
}
