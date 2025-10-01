// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/pages/display_page/rank_card.dart';

class RankDisplayPage extends HookConsumerWidget {
  const RankDisplayPage({super.key, required this.display});

  final Display display;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(display.title), centerTitle: true),
      body: StreamBuilder(
        stream: display.teams,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final teams = snapshot.data;

            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(teams!.length, (index) {
                  return RankCard(team: teams[index]);
                }),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("チーム取得エラー"));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
