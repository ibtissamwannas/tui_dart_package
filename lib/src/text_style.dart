// text_style.dart
import 'package:tui_dart/tui_dart.dart';


class TextStyle {
  final String _text;
  final List<String> _styles = [];

  TextStyle(this._text) {
    if (_text.isEmpty) throw ArgumentError('Text cannot be empty');
  }

  // --- Style Methods ---
  TextStyle bold() => _addStyle('1');
  TextStyle italic() => _addStyle('3');
  TextStyle underline() => _addStyle('4');
  TextStyle strikethrough() => _addStyle('9');
  TextStyle inverse() => _addStyle('7');

  // --- Color Methods ---
  TextStyle color(String colorName) {
    final colorCode = TextColors.getForegroundColorCode(colorName);
    return _addStyle('38;5;$colorCode');
  }

  TextStyle colorRGB(int r, int g, int b) {
    return _addStyle(TextColors.rgbColor(r, g, b));
  }

  TextStyle backgroundColorRGB(int r, int g, int b) {
    return _addStyle(TextColors.rgbBackgroundColor(r, g, b));
  }

  // --- Rendering ---
  String render() {
    if (_styles.isEmpty) return _text;
    return '\x1b[${_styles.join(';')}m$_text\x1b[0m';
  }

  // --- Helpers ---
  TextStyle _addStyle(String code) {
    _styles.add(code);
    return this;
  }
}