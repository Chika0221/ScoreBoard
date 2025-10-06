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
            final teams = snapshot.data!;

            final rank = List.filled(5, 4);

            final sortedTeams = List.of(teams)
              ..sort((a, b) => b.point.compareTo(a.point));

            // Assign ranks based on the sorted order, handling ties
            for (int i = 0; i < sortedTeams.length; i++) {
              if (i > 0 && sortedTeams[i].point == sortedTeams[i - 1].point) {
                // Same score as the previous team, so same rank
                rank[sortedTeams[i].id] = rank[sortedTeams[i - 1].id];
              } else {
                // Different score, rank is the current position (i + 1)
                rank[sortedTeams[i].id] = i + 1;
              }
            }

            return SizedBox.expand(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(teams.length, (index) {
                  return RankCard(team: teams[index], rank: rank[index]);
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
