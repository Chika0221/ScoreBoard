// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/color.dart';
import 'package:m_score_board/display_page.dart';
import 'package:m_score_board/display_stream_provider.dart';
import 'package:m_score_board/preview_app.dart';
import 'package:m_score_board/scripts/firebase_scripts.dart';

class ControlPage extends HookConsumerWidget {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backColor = Color(0xFF141218);

    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text("コントローラー"),
        centerTitle: true,
        backgroundColor: backColor,
        foregroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [PreviewApp(), Expanded(child: ControllerWidget())],
      ),
    );
  }
}

class ControllerWidget extends HookConsumerWidget {
  const ControllerWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listSelected = useState<int?>(null);

    final displayStream = ref.watch(displayStreamProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: EdgeInsets.all(16),
      child: displayStream.when(
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final displayData = data[index];
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border:
                      (displayData.nowDisplay)
                          ? Border.all(color: Colors.pinkAccent, width: 4)
                          : Border.all(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                ),
                width: double.infinity,
                child: ListTile(
                  title: Text(displayData.title),
                  trailing: Switch(
                    value: (displayData.nowDisplay),
                    onChanged: (value) {
                      if (value) {
                        FirestoreScripts().changeDisplay(index);
                      }
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 16);
            },
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text("$error"));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
