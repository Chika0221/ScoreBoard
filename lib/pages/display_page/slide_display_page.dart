// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';

class SlideDisplayPage extends HookConsumerWidget {
  const SlideDisplayPage({super.key, required this.display});

  final Display display;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body:
          Padding(
            padding: EdgeInsets.fromLTRB(64, 32, 64, 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(display.title, style: TextStyle(fontSize: 100)),
                SizedBox(height: 32),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.amber, width: 5),
                    ),
                    child: Center(
                      child:
                          (display.type == DisplayType.slideString)
                              ? Text(
                                display.description!,
                                style: TextStyle(fontSize: 80),
                              )
                              : Image.network(display.description!),
                    ),
                  ),
                ),
                // Row(
                //   children: [
                //     SizedBox(width: 48),
                //     Text(display.description!, style: TextStyle(fontSize: 60)),
                //   ],
                // ),
              ],
            ),
          ).animate().fade(),
    );
  }
}
