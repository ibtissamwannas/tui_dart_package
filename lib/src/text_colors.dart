// text_colors.dart

class TextColors {
  static const Map<String, int> _foregroundColorMap = {
    'black': 0,
    'red': 1,
    'green': 2,
    'yellow': 3,
    'blue': 4,
    'magenta': 5,
    'cyan': 6,
    'white': 7,
    'gray': 8,
    'bright_red': 9,
    'bright_green': 10,
    'bright_yellow': 11,
    'bright_blue': 12,
    'bright_magenta': 13,
    'bright_cyan': 14,
    'bright_white': 15,
  };

  /// Returns ANSI code for valid named colors. Throws for invalid names.
  static String getForegroundColorCode(String colorName) {
    if (!_foregroundColorMap.containsKey(colorName)) {
      throw ArgumentError('Invalid color name: "$colorName". '
          'Valid options: ${_foregroundColorMap.keys.join(', ')}');
    }
    return _foregroundColorMap[colorName].toString();
  }

  /// Validates RGB values (0-255) and returns ANSI code.
  static String rgbColor(int r, int g, int b) {
    _validateRGB(r, g, b);
    return '38;2;$r;$g;$b';
  }

  /// Validates RGB values (0-255) and returns background ANSI code.
  static String rgbBackgroundColor(int r, int g, int b) {
    _validateRGB(r, g, b);
    return '48;2;$r;$g;$b';
  }

  /// Validates RGB ranges (0-255).
  static void _validateRGB(int r, int g, int b) {
    if (r < 0 || r > 255 || g < 0 || g > 255 || b < 0 || b > 255) {
      throw ArgumentError('RGB values must be between 0 and 255. Got: ($r, $g, $b)');
    }
  }

  /// Checks if a color name is valid.
  static bool isValidColor(String colorName) => _foregroundColorMap.containsKey(colorName);
}