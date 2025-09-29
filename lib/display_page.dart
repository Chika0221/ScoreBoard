// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/display_stream_provider.dart';
import 'package:m_score_board/models/team.dart';
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
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(data[1].teams!.length, (index) {
                return RankCard(team: data[1].teams![index]);
              }),
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
