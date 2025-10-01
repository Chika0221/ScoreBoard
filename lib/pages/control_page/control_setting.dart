// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/models/team.dart';
import 'package:m_score_board/scripts/firebase_scripts.dart';

class ControlSetting extends ConsumerWidget {
  const ControlSetting({
    super.key,
    required this.backButton,
    required this.display,
  });

  final void Function() backButton;
  final Display display;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border:
            (display.nowDisplay)
                ? Border.all(color: Colors.pinkAccent, width: 4)
                : null,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("設定-${display.title}"),
          leading: IconButton(
            onPressed: backButton,
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            if (display.id != 0)
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  await FirestoreScripts().deleteDisplay(display);
                  // 削除後はリストに戻る
                  backButton();
                },
                tooltip: "このスライドを削除",
              ),
            if (display.id != 0) SizedBox(width: 16),
            Switch(
              activeTrackColor: Colors.pinkAccent,
              value: (display.nowDisplay),
              onChanged: (value) {
                if (value) {
                  FirestoreScripts().changeDisplay(display.id);
                }
              },
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
