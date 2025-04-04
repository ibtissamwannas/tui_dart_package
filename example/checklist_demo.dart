import 'dart:io';

import 'package:tui_dart/tui_dart.dart';

void main() {
  final checklist = InteractiveChecklist(
    title: "My Interactive Tasks",
    items: [
      ChecklistItem(label: "Write GSoC proposal"),
      ChecklistItem(label: "Style checklist items"),
      ChecklistItem(label: "Demo keyboard navigation"),
    ],
  );

  checklist.start();
}

/// InteractiveChecklist handles rendering and input
class InteractiveChecklist {
  final String title;
  final List<ChecklistItem> items;
  int selectedIndex = 0;

  InteractiveChecklist({required this.title, required this.items});

  void start() {
    stdin.echoMode = false;
    stdin.lineMode = false;

    render();

    List<int> buffer = [];

    stdin.listen((List<int> charCodes) {
      buffer.addAll(charCodes);

      // Handle arrow keys (Up and Down)
      if (buffer.length >= 3 && buffer[0] == 27 && buffer[1] == 91) {
        final arrowKey = buffer[2];

        if (arrowKey == 65) {
          // Up arrow
          if (selectedIndex > 0) selectedIndex--;
        } else if (arrowKey == 66) {
          // Down arrow
          if (selectedIndex < items.length - 1) selectedIndex++;
        }

        buffer.clear();
        render();
        return;
      }

      // Handle other keys
      final char = String.fromCharCode(buffer[0]);

      if (char == ' ' || char == '\n') {
        items[selectedIndex].checked = !items[selectedIndex].checked;
      } else if (char == 's') {
        submit();
      } else if (char == 'q') {
        stdin.lineMode = true;
        stdin.echoMode = true;
        print("\nExited.");
        exit(0);
      }

      buffer.clear();
      render();
    });
  }

  void submit() {
    stdin.lineMode = true;
    stdin.echoMode = true;

    final selectedItems = items.where((item) => item.checked).toList();

    if (selectedItems.isEmpty) {
      print("⚠️  Nothing selected.");
    } else {
      print("\n✅ You selected the following items:\n");
      for (var item in selectedItems) {
        print("- ${item.label}");
      }
    }

    print("\nThank you! 👋");
    exit(0);
  }

  void render() {
    // Clear the screen
    stdout.write('\x1B[2J\x1B[0;0H');

    print(TextStyle("~== $title ==~").bold().color("cyan").render());
    print("");

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final isSelected = i == selectedIndex;

      final checkbox = item.checked
          ? TextStyle("[x]").bold().color("green").render()
          : TextStyle("[ ]").bold().color("yellow").render();

      final label = item.checked
          ? TextStyle(item.label).color("gray").strikethrough().render()
          : TextStyle(item.label).render();

      final prefix =
          isSelected ? TextStyle(">").bold().color("cyan").render() : " ";

      print(" $prefix $checkbox $label");
    }

    print(
        "\nUse ↑/↓ to move, space/enter to toggle, 's' to submit, 'q' to quit.");
  }
}

/// A single checklist item
class ChecklistItem {
  final String label;
  bool checked;

  ChecklistItem({required this.label, this.checked = false});
}
