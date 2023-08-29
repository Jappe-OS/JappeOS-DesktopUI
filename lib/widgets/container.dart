import 'package:flutter/material.dart';

Color darkBorder(Color input) {
  var percent = 15;
  var f = 1 - percent / 100;
  return Color.fromARGB(input.alpha, (input.red * f).round(), (input.green * f).round(), (input.blue * f).round());
}

BoxShadow shadow() {
  return BoxShadow(
    color: Colors.black.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 15,
    offset: Offset(0, 4),
  );
}

double bordersWidth() => 1.0;

BoxBorder borderInner(BuildContext ctx) {
  return Border.all(width: 1, color: Theme.of(ctx).colorScheme.outline.withOpacity(1));
}

BoxBorder borderOuter(Color background) {
  return Border.all(width: 1, color: darkBorder(background.withOpacity(1)), strokeAlign: BorderSide.strokeAlignOutside);
}
