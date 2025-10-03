// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_network/image_network.dart';

// Project imports:
import 'package:m_score_board/models/team.dart';
import 'package:m_score_board/theme.dart';

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
    );
  }
}
