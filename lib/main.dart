// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:m_score_board/color.dart';
import 'package:m_score_board/control_page.dart';
import 'package:m_score_board/display_page.dart';
import 'package:m_score_board/select_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(colorScheme: ScoreBoardColors().colorScheme),
      initialRoute: AppRoute.select.path,
      routes: {
        AppRoute.select.path: (context) => const SelectPage(),
        AppRoute.display.path: (context) => const DisplayPage(),
        AppRoute.control.path: (context) => const ControlPage(),
      },
    );
  }
}

enum AppRoute {
  select("/"),
  display("/display"),
  control("/control");

  const AppRoute(this.path);
  final String path;
}
