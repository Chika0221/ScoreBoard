// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/team.dart';
import 'package:m_score_board/theme.dart';

class RankCard extends HookConsumerWidget {
  const RankCard({super.key, required this.team, required this.rank});

  final Team team;
  final int rank;

  double _calculatePodiumHeight(BuildContext context) {
    const baseHeight = 0.3;
    final screenHeight = MediaQuery.of(context).size.height;

    // ポイントが0より大きく、ランクが1位から3位までの場合に表彰台を表示
    if (team.point > 0 && rank > 0 && rank < 4) {
      return screenHeight * baseHeight / rank;
    }

    // 上記以外の場合は高さを0にする
    return 0.0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.18,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ScoreBoardTheme().customColors[team.id],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                ScoreBoardTheme().customShapePaths[team.id],
                height: MediaQuery.of(context).size.width * 0.06,
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Spacer(),
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
        ),
        SizedBox(height: 16),
        AnimatedContainer(
          duration: Duration(seconds: 2),
          height: _calculatePodiumHeight(context),
          width: MediaQuery.of(context).size.width * 0.18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            color: ScoreBoardTheme().rankColor[rank - 1],
          ),
          child: Center(child: Text("$rank", style: TextStyle(fontSize: 50))),
        ),
      ],
    );
  }
}
