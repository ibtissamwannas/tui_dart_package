import 'dart:io';

class TableRenderer {
  void printTable(List<List<String>> data) {
    if (data.isEmpty) return;

    // Calculate max width for each column
    List<int> columnWidths = List.generate(
      data[0].length,
      (i) => data.map((row) => row[i].length).reduce((a, b) => a > b ? a : b),
    );

    // Function to print a separator line
    void printSeparator() {
      stdout.write("+");
      for (var width in columnWidths) {
        stdout.write("${"-" * (width + 2)}+");
      }
      stdout.writeln();
    }

    // Print table with borders
    printSeparator();
    for (var i = 0; i < data.length; i++) {
      stdout.write("|");
      for (int j = 0; j < data[i].length; j++) {
        stdout.write(" ${data[i][j].padRight(columnWidths[j])} |");
      }
      stdout.writeln();
      if (i == 0) printSeparator(); // Print header separator
    }
    printSeparator();
  }
}
