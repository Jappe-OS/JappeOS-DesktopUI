import 'dart:ui';

Color darkBorder(Color input) {
  var percent = 15;
  var f = 1 - percent / 100;
  return Color.fromARGB(input.alpha, (input.red * f).round(), (input.green * f).round(), (input.blue * f).round());
}
