// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/pages/display_page/display_page.dart';
import 'package:m_score_board/theme.dart';

class PreviewApp extends ConsumerWidget {
  const PreviewApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
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
                colorScheme: ScoreBoardTheme().colorScheme,
                fontFamily: "Tsunagi",
              ),
              home: DisplayPage(),
              // ignore: deprecated_member_use
              useInheritedMediaQuery: true,
            ),
      ),
    );
  }
}
