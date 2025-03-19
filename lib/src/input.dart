import 'dart:io';

class InputHandler {
  String prompt(String message) {
    stdout.write('$message ');
    return stdin.readLineSync() ?? '';
  }
}
