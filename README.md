# Dart TUI Framework  

A **Terminal User Interface (TUI) framework for Dart**, designed to bring structured UI components to the terminal. This project is inspired by existing TUI frameworks in Golang (Charm) and Python (Textual), but aims to provide a **Dart-native solution**.  

## 🚀 Progress So Far  

I have implemented the following features:  

- ✅ **Table Renderer**: Displays structured tables with borders in the terminal.  
- ✅ **User Input Handling**: Captures and processes user input.  
- ✅ **Text Styling Utilities**: Allows text formatting and color options (WIP).  

### **Example Table Rendering**  

I built a simple table renderer that prints structured tables in the terminal.  

#### **Code Sample:**  

```dart
import 'package:dart_tui/dart_tui.dart';

void main() {
  TableRenderer table = TableRenderer();
  table.printTable([
    ["Name", "Age", "City"],
    ["Alice", "30", "New York"],
    ["Bob", "25", "San Francisco"],
    ["Charlie", "35", "London"]
  ]);
}
