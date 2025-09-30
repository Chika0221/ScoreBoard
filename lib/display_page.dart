// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/display_stream_provider.dart';
import 'package:m_score_board/rank_card.dart';

class DisplayPage extends HookConsumerWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = "得点";

    final displaysStream = ref.watch(displayStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Center(
        child: displaysStream.when(
          data: (data) {
            return StreamBuilder(
              stream: data[0].teams,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final teams = snapshot.data;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(teams!.length, (index) {
                      return RankCard(team: teams[index]);
                    }),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("チーム取得エラー"));
                } else {
                  return CircularProgressIndicator();
                }
              },
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text("通信エラー$error"));
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
