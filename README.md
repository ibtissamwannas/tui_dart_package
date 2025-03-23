# Dart TUI Framework 🖥️  

**A terminal UI framework for Dart**, inspired by [**lipgloss**](https://github.com/charmbracelet/lipgloss) (Go) and [**textual**](https://github.com/Textualize/textual) (Python).  
**Current Focus**: Composable text styling (Phase 1).  
**Future Goal**: Full TUI components (inputs, checkboxes, layouts) with state management.  

---

## ✨ Current Features (Text Styling)  
✅ **Composable API**: Chain methods like `.bold().color().underline()`.  
✅ **Named Colors**: `black`, `red`, `bright_blue`, etc. (16 predefined).  
✅ **RGB Support**: True color for foreground and background.  
✅ **Validation**: Errors for invalid color names or RGB values.  
✅ **ANSI Escape Codes**: Unix/macOS/Linux terminal support.  

---

## 🚀 Future Plans (Aligned with Flutter Team’s Vision)  
This project expands on the [**Flutter Team’s GSoC Idea**](https://github.com/dart-lang/sdk/blob/main/docs/gsoc/Dart-GSoC-2025-Project-Ideas.md) to bring TUI development to Dart.  

### **Planned Features**  
| Feature                | Status     |  
|------------------------|------------|  
| Text Styling           | **In Progress**  |  
| Input Components       | Planned 📅 |  
| Checkboxes/Tables      | Planned 📅 |  
| Terminal Layouts       | Planned 📅 |  
| State Management       | Planned 📅 |  
| Windows Compatibility  | Planned 📅 |  

### **Flutter Team’s Original Idea**  
> *"Dart is already used to create GUI applications through Flutter. A package that makes TUI development easier (like Go’s `charm` or Python’s `textual`) would increase Dart’s adoption in CLI/DevOps tools. Expected outcome: A pub.dev package with terminal primitives (text styling, inputs, checkboxes, layouts) that integrates with Dart’s state management libraries."*

---
