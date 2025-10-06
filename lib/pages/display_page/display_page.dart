// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/display_stream_provider.dart';
import 'package:m_score_board/pages/display_page/rank_display_page.dart';
import 'package:m_score_board/pages/display_page/slide_display_page.dart';

class DisplayPage extends HookConsumerWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
  }
}
