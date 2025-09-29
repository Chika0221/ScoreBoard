// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/team.dart';
import 'package:m_score_board/rank_card.dart';

class DisplayPage extends HookConsumerWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = "得点";

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) {
            return RankCard(team: Team(id: index, name: "", point: index * 3));
          }),
        ),
      ),
    );
  }
}
