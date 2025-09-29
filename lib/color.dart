// Flutter imports:
import 'package:flutter/material.dart';

class ScoreBoardColor {
  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.blueGrey,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  final customColor1 = Colors.red.withAlpha(180);
  final customColor2 = Colors.blue.withAlpha(180);
  final customColor3 = Colors.green.withAlpha(180);
  final customColor4 = Colors.orange.withAlpha(180);
  final customColor5 = Colors.purple.withAlpha(180);

  final customColors = [
    Colors.red.withAlpha(180),
    Colors.blue.withAlpha(180),
    Colors.green.withAlpha(180),
    Colors.orange.withAlpha(180),
    Colors.purple.withAlpha(180),
  ];
}
