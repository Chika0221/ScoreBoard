// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/color.dart';
import 'package:m_score_board/models/team.dart';

class RankCard extends HookConsumerWidget {
  const RankCard({super.key, required this.team});

  final Team team;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.18,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ScoreBoardColor().customColors[team.id],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox.square(
            dimension: MediaQuery.of(context).size.width * 0.18 - 32,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Center(
                child: Text(
                  team.point.toString(),
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(fontSize: 100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
