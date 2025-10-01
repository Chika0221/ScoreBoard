// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';

class SlideDisplayPage extends HookConsumerWidget {
  const SlideDisplayPage({super.key, required this.display});

  final Display display;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: 12,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(width: 16),
                Text(display.title, style: TextStyle(fontSize: 100)),
              ],
            ),
            SizedBox(height: 64),
            Row(
              children: [
                SizedBox(width: 48),
                Text(
                  display.description!,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            // Center(
            //   child: Text(
            //     display.description!,
            //     style: Theme.of(context).textTheme.headlineLarge,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
