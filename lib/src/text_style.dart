class TextStyle {
  static String bold(String text) => '\x1B[1m$text\x1B[0m';
  static String italic(String text) => '\x1B[3m$text\x1B[0m';
  static String underline(String text) => '\x1B[4m$text\x1B[0m';

  static String red(String text) => '\x1B[31m$text\x1B[0m';
  static String green(String text) => '\x1B[32m$text\x1B[0m';
  static String yellow(String text) => '\x1B[33m$text\x1B[0m';
  static String blue(String text) => '\x1B[34m$text\x1B[0m';
}
