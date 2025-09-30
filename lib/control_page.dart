// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';

// Project imports:
import 'package:m_score_board/color.dart';
import 'package:m_score_board/display_page.dart';
import 'package:m_score_board/scripts/firebase_scripts.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    final backColor = Color(0xFF141218);

    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text("コントローラー"),
        centerTitle: true,
        backgroundColor: backColor,
        foregroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.8,
            child: DevicePreview(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              isToolbarVisible: true,
              defaultDevice: Devices.windows.laptop.copyWith(
                screenSize: Size(1920, 1080),
                frameSize: Size(1920, 1080),
              ),
              builder:
                  (context) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    themeMode: ThemeMode.light,
                    theme: ThemeData(
                      colorScheme: ScoreBoardColor().colorScheme,
                    ),
                    home: DisplayPage(),
                    // ignore: deprecated_member_use
                    useInheritedMediaQuery: true,
                  ),
            ),
          ),
          // Expanded(child: Container(color: Color(0xFF141218))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton.tonal(
                onPressed: () async {
                  await FirestoreScripts().addPoint("0", 10);
                },
                child: Text("0"),
              ),
              FilledButton.tonal(
                onPressed: () {
                  FirestoreScripts().addPoint("1", 10);
                },
                child: Text("1"),
              ),
              FilledButton.tonal(
                onPressed: () {
                  FirestoreScripts().addPoint("2", 10);
                },
                child: Text("2"),
              ),
              FilledButton.tonal(
                onPressed: () {
                  FirestoreScripts().addPoint("3", 10);
                },
                child: Text("3"),
              ),
              FilledButton.tonal(
                onPressed: () {
                  FirestoreScripts().addPoint("4", 10);
                },
                child: Text("4"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
