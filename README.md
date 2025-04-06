# Dart TUI Framework 🖥️  

A **terminal UI framework for Dart** focused on building interactive, styled, and composable CLI applications — with native support for keyboard interaction, styling, and layout.

**Current Focus**: Composable text styling (Phase 1)  
**Goal**: Build a reusable TUI widget system with layout, input, navigation, and state management.

---

## ✨ Current Features

- ✅ **Composable API**: Chain methods like `.bold().color().underline()`
- ✅ **Named Colors**: `black`, `red`, `bright_blue`, etc. (16 predefined)
- ✅ **RGB Support**: True color for foreground and background
- ✅ **Validation**: Errors for invalid color names or RGB values
- ✅ **ANSI Escape Codes**: Unix/macOS/Linux terminal support
- ✅ **Checklist**: Interactive selection with keyboard
- ✅ **InputField**: Email/text input with validation

> 📂 See `example/` folder for demos of checklist, input, and text styling.

---

## 📍 Roadmap (GSoC 2025 + Beyond)

### 🧱 Core Widget System (GSoC Milestones)

| Feature                     | Status        | Description                                         |
|-----------------------------|---------------|-----------------------------------------------------|
| Text Styling                | ✅ Demo Ready | Chained styling methods                             |
| InputField                  | ✅ Demo Ready | Accepts user input with validation                  |
| Checklist Component         | ✅ Demo Ready | Selectable items with spacebar/enter                |
| Button                      | 🟡 Planned    | Pressable button with `onPressed` callback          |
| Focus Manager               | 🔜 Planned    | Navigate between widgets (tab/arrow keys)           |
| Layout Engine               | 🟡 Started    | Row, Column, Box components                         |
| Reactive State Management   | 🔜 Planned    | Lightweight internal state (TuiState<T>)            |
| Terminal Rendering Utils    | ✅ Complete   | Cursor hiding, screen clear, input buffer           |
| Cross-Platform Support      | 🔜 Planned    | Windows/ANSICON support                             |
| Testing & Docs              | 🟡 Started    | Unit tests and full markdown documentation          |

---

## 🔮 Post-GSoC Plans

### 🔌 Widgets & Components

- [ ] RadioGroup
- [ ] Select/Dropdown Menu
- [ ] Table (with headers and rows)
- [ ] Spinner, Progress bar
- [ ] Tabs and navigation
- [ ] Toast notifications
- [ ] Modal overlays & confirmation prompts

### 📐 Layouts & Theming

- [ ] Box widget (padding, title, borders)
- [ ] Row / Column nesting
- [ ] Grid layout
- [ ] Global theme manager (`TuiTheme`)
- [ ] Text alignment & spacing control

### ⚙️ Advanced UX

- [ ] View switching with animation
- [ ] Focus traversal between interactive components
- [ ] Scrollable containers
- [ ] Mouse support
- [ ] Keyboard shortcut remapping

### 📚 Developer Tools

- [ ] API Docs (dartdoc)
- [ ] Live examples (`dart run example/`)
- [ ] CLI template generator (`tui create`)
- [ ] Custom widget error messages
- [ ] Contribution guide & issue templates

---

## 📦 Release Goals

- [ ] Publish to [pub.dev](https://pub.dev)
- [ ] Semantic versioning (`v0.1.0` → `v1.0.0`)
- [ ] Community contributions and long-term maintenance

---

## 🎯 Vision

To provide Dart developers with a fully composable, themeable, and developer-friendly terminal UI framework that enables building beautiful and responsive CLI applications with ease.

---

> _Stay tuned for releases and updates in the [`example/`] folder._

---

## 📝 Flutter GSoC Idea Reference

> *"Dart is already used to create GUI applications through Flutter. A package that makes TUI development easier... would increase Dart’s adoption in CLI/DevOps tools. Expected outcome: A pub.dev package with terminal primitives (text styling, inputs, checkboxes, layouts) that integrates with Dart’s state management libraries."*

---
