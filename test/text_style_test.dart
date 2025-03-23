// test/text_style_test.dart
import 'package:test/test.dart';
import 'package:tui_dart/tui_dart.dart';

void main() {
  group('TextColors Validation', () {
    
    test('valid color names return correct code', () {
      expect(TextColors.getForegroundColorCode('blue'), '4');
      expect(TextColors.getForegroundColorCode('bright_green'), '10');
    });

    test('invalid color names throw ArgumentError', () {
      expect(
          () => TextColors.getForegroundColorCode('pink'), throwsArgumentError);
    });

    test('RGB validation rejects out-of-range values', () {
      expect(() => TextColors.rgbColor(300, 0, 0), throwsArgumentError);
      expect(() => TextColors.rgbBackgroundColor(-1, 255, 100),
          throwsArgumentError);
    });

    test('isValidColor checks color existence', () {
      expect(TextColors.isValidColor('cyan'), isTrue);
      expect(TextColors.isValidColor('invalid'), isFalse);
    });
  });

  group('TextStyle Validation', () {
    test('empty text throws ArgumentError', () {
      expect(() => TextStyle(''), throwsArgumentError);
    });

    test('invalid color names propagate errors', () {
      expect(() => TextStyle('Test').color('invalid'), throwsArgumentError);
    });

    test('invalid RGB values propagate errors', () {
      expect(() => TextStyle('Test').colorRGB(256, 0, 0), throwsArgumentError);
    });
  });

  group('TextStyle Rendering', () {
    test('plain text has no ANSI codes', () {
      expect(TextStyle('Hello').render(), 'Hello');
    });

    test('combined styles generate correct sequence', () {
      final text = TextStyle('Demo')
          .bold()
          .color('red')
          .backgroundColorRGB(255, 255, 255)
          .render();
      expect(text, '\x1b[1;38;5;1;48;2;255;255;255mDemo\x1b[0m');
    });

    test('styles are always reset', () {
      final text = TextStyle('Test').bold().render();
      expect(text, startsWith('\x1b[1m'));
      expect(text, endsWith('\x1b[0m'));
    });
  });
}
