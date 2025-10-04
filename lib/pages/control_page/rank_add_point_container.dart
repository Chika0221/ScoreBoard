// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/scripts/firebase_scripts.dart';
import 'package:m_score_board/theme.dart';

class RankAddPointContainer extends HookConsumerWidget {
  const RankAddPointContainer({super.key, required this.display});

  final Display display;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: StreamBuilder(
        stream: display.teams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print(snapshot.data);
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text("エラー: ${snapshot.error}");
          }
          if (snapshot.hasData && snapshot.data != null) {
            final teams = snapshot.data!;
            final firestore = FirestoreScripts();

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(teams.length, (index) {
                final team = teams[index];

                return Container(
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: ScoreBoardTheme().customColors[index],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      IconButton.filled(
                        onPressed:
                            () async =>
                                firestore.addPoint(index.toString(), 10),
                        icon: Icon(Icons.add),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Center(
                          child: Text(
                            team.point.toString(),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      IconButton.filled(
                        onPressed:
                            () async =>
                                firestore.addPoint(index.toString(), -10),
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                );
              }),
            );
          } else {
            return Text("チームデータがありません。");
          }
        },
      ),
    );
  }
}
