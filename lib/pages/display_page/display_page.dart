// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/display_stream_provider.dart';
import 'package:m_score_board/pages/display_page/rank_card.dart';
import 'package:m_score_board/pages/display_page/rank_display_page.dart';
import 'package:m_score_board/pages/display_page/slide_display_page.dart';

class DisplayPage extends HookConsumerWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = "得点";

    final displaysStream = ref.watch(displayStreamProvider);

    return displaysStream.when(
      data: (data) {
        final display = data.where((display) => display.nowDisplay).first;

        if (display.id == 0) {
          return RankDisplayPage(display: display);
        } else {
          return SlideDisplayPage(display: display);
        }
      },
      error: (error, stackTrace) => Center(child: Text("${error}")),
      loading: () => Center(child: CircularProgressIndicator()),
    );

    // return Scaffold(
    //   appBar: AppBar(title: Text(title), centerTitle: true),
    //   body: Center(
    //     child: displaysStream.when(
    //       data: (data) {
    //         return StreamBuilder(
    //           stream: data[0].teams,
    //           builder: (context, snapshot) {
    //             if (snapshot.hasData) {
    //               final teams = snapshot.data;

    //               return Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: List.generate(teams!.length, (index) {
    //                   return RankCard(team: teams[index]);
    //                 }),
    //               );
    //             } else if (snapshot.hasError) {
    //               return Center(child: Text("チーム取得エラー"));
    //             } else {
    //               return CircularProgressIndicator();
    //             }
    //           },
    //         );
    //       },
    //       error: (error, stackTrace) {
    //         return Center(child: Text("通信エラー$error"));
    //       },
    //       loading: () {
    //         return Center(child: CircularProgressIndicator());
    //       },
    //     ),
    //   ),
    // );
  }
}
