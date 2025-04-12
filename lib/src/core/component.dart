abstract class TuiComponent {
  /// Whether the component can receive focus
  bool focusable = false;

  /// Whether the component is currently focused
  bool focused = false;

  /// Render the component to the terminal
  void render();

  /// Handle keyboard input
  void handleInput(String input) {}
}
