// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/color.dart';
import 'package:m_score_board/control_page.dart';
import 'package:m_score_board/display_page.dart';
import 'package:m_score_board/firebase_options.dart';
import 'package:m_score_board/select_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final providerScope = ProviderScope(child: MyApp());
  runApp(providerScope);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ScoreBoardColor().colorScheme,
        fontFamily: "Tsunagi",
      ),
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
