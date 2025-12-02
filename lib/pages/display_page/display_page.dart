// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/display_stream_provider.dart';
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/pages/display_page/rank_display_page.dart';
import 'package:m_score_board/pages/display_page/slide_display_page.dart';

// Package imports:

class DisplayPage extends HookConsumerWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displaysStream = ref.watch(displayStreamProvider);

    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        final key = event.logicalKey;
        if (event is KeyDownEvent) {
          if (key == LogicalKeyboardKey.arrowLeft) {
            Navigator.of(context).pop();
          }
        }
        return KeyEventResult.ignored;
      },
      child: displaysStream.when(
        data: (data) {
          final Display? display = data.firstWhereOrNull(
            (display) => display.nowDisplay,
          );

          if (display == null) {
            return Center(child: CircularProgressIndicator());
          } else if (display.id == 0) {
            return RankDisplayPage(display: display);
          } else {
            return SlideDisplayPage(display: display);
          }
        },
        error: (error, stackTrace) => Center(child: Text("${error}")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
