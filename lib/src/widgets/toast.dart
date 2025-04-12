import 'dart:async';
import 'dart:io';

import 'package:tui_dart/src/core/component.dart';

import '../text_style.dart';

enum ToastType { info, success, error, warning }

class Toast extends TuiComponent {
  final String message;
  final ToastType type;
  final Duration duration;

  Toast({
    required this.message,
    this.type = ToastType.info,
    this.duration = const Duration(seconds: 3),
  });

  void show() {
    render();

    Timer(duration, () {
      stdout.write('\x1B[1A'); // Move up one line
      stdout.write('\x1B[2K'); // Clear line
    });
  }

  @override
  void render() {
    final label = switch (type) {
      ToastType.success => "[SUCCESS]",
      ToastType.error => "[ERROR]",
      ToastType.warning => "[WARNING]",
      ToastType.info => "[INFO]",
    };

    final color = switch (type) {
      ToastType.success => "green",
      ToastType.error => "bright_red",
      ToastType.warning => "yellow",
      ToastType.info => "cyan",
    };

    final text = TextStyle("$label $message").bold().color(color).render();
    print(text);
  }
}
